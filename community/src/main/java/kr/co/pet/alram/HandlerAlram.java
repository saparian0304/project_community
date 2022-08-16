package kr.co.pet.alram;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mysql.cj.util.StringUtils;

import kr.co.pet.member.MemberVO;

@Component
public class HandlerAlram extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> memberSessions = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session);
		sessions.add(session);
		String senderId = getId(session);
		memberSessions.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage : " + session + " : " + message);
//		String senderId = getId(session);
//		for (WebSocketSession sess : sessions) {
//			sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
//		}
		// protocol : cmd, 댓글작성자,board_no 게시글작성자 (reply, member2, member1, 1)
		String msg = message.getPayload();
		if (StringUtils.isNullOrEmpty(msg)) {
			String[] strs = msg.split(",");
			if (strs != null && strs.length == 4) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String bno = strs[3];
				
				WebSocketSession boardWriterSession = memberSessions.get(boardWriter);
				if ("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 " + bno + "번 게시글에 댓글을 달았습니다!");
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
		}
		
	}
	
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginMember = (MemberVO)httpSession.get("loginInfo");
		if (null == loginMember) {
			return session.getId(); 
		} else {
			return loginMember.getNickname();
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed : " + session + " : " + status);
	}
}
