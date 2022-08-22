package kr.co.pet.alram;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.pet.member.MemberVO;

@Component
public class HandlerAlram extends TextWebSocketHandler {
	
	@Autowired
	AlramMapper mapper;
	
	List<WebSocketSession> sessions = new ArrayList<>();
	
	Map<String, WebSocketSession> memberSessions = new HashMap<>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session);
		sessions.add(session);
		String senderId = currentMember(session);
		System.out.println("현재 접속한 member : " + senderId);
		memberSessions.put(senderId, session);
	}
	
	private String currentMember(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginMember = (MemberVO)httpSession.get("loginInfo");
		String tmp ="";
		if(httpSession.get("plus") != null) {
			tmp = (String)httpSession.get("plus");
		}
		
		if (loginMember == null) {
			String mno = session.getId();
			return mno;
		}
		String mno = loginMember.getMember_no()+tmp;
		return mno;
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage : " + session + " : " + message);
		System.out.println("현재 접속한 member : " + currentMember(session));
		String msg = message.getPayload();
		System.out.println("msg : " + msg);
		
		if (!StringUtils.isEmpty(msg)) {
			System.out.println("if문 들어옴");
			String[] strs = msg.split(",");
			if (strs != null && strs.length == 5) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String bno = strs[3];
				String title = strs[4];
//				String bgno = strs[5];
				System.out.println("length 성공 : " + cmd);
				
				AlramVO vo = new AlramVO();
				vo.setBoard_no(bno);
				vo.setRead_no(boardWriter);
				vo.setSend_no(replyWriter);
				vo.setCmd(cmd);
				
				String board_name = mapper.findBoard_name(Integer.parseInt(bno));
				
				WebSocketSession replyWriterSession = memberSessions.get(replyWriter);
				WebSocketSession boardWriterSession = memberSessions.get(boardWriter);
//				String boardNick = boardWriter; 
//				String replyNick = replyWriter;
				String boardNick = mapper.findNick(Integer.parseInt(boardWriter));
				String replyNick = mapper.findNick(Integer.parseInt(replyWriter));
				
				System.out.println("boardNick " + boardNick);
				System.out.println("replyNick " + replyNick);
				System.out.println("boardWriterSession : " + boardWriterSession);
	
				String tmpURL = "";
				if(!"message".equals(cmd)) {
					if(board_name.equals("free")) {
						tmpURL = "/pet/board/freeview.do?board_no=";
					} else if (board_name.equals("live")) {
						tmpURL = "/pet/board/liveview.do?board_no=";
					} else if (board_name.equals("center")) {
						tmpURL = "/pet/board/centerview.do?board_no=";
					}
				}
				String str = "";

				//댓글
				if ("reply".equals(cmd) && boardWriterSession != null) {
					str = "<a href='"+ tmpURL +bno + "'>" 
							+ replyNick + "님이 [게시글] "+ title +"에 댓글을 달았습니다</a>";
					TextMessage tmpMsg = new TextMessage(str);
					boardWriterSession.sendMessage(tmpMsg);							
				}
				
				// 쪽지
				if ("message".equals(cmd) && boardWriterSession != null) {
					str = "<a href='/pet/mypage/index.do?member_no=" + boardWriter + "'>"
							+ replyNick + "님이 쪽지를 보냈습니다</a>";
					TextMessage tmpMsg = new TextMessage(str);
					boardWriterSession.sendMessage(tmpMsg);
				}
				
				//대댓글
				if ("rereply".equals(cmd) && boardWriterSession != null) {
					str = "<a href='"+ tmpURL +bno + "'>" 
							+ replyNick + "님이 [댓글] "+ title +"에 답글을 달았습니다</a>";
					TextMessage tmpMsg = new TextMessage(str);
					boardWriterSession.sendMessage(tmpMsg);	
				}
				
				//좋아요
				if ("recommend".equals(cmd) && boardWriterSession != null) {
					str = "<a href='" + tmpURL +bno + "'>" 
							+ replyNick + "님이 "+ title +"에 좋아요를 눌렀습니다</a>";
					TextMessage tmpMsg = new TextMessage(str);
					boardWriterSession.sendMessage(tmpMsg);	
				}
				vo.setLink(str);
				mapper.insert(vo);
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed : " + session + " : " + status);
		sessions.remove(session);
		memberSessions.remove(currentMember(session),session);	
	}
}
