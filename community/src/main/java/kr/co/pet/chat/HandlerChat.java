package kr.co.pet.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.pet.member.MemberVO;

@Component
public class HandlerChat extends TextWebSocketHandler {
	
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		int count = 0;
		System.out.println("새로 들어왔습니다." + session.getId() +", 카운트 : " + ++count);
	}
	
	
	// 클라이언트가 서버로 메세지 전송처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		super.handleTextMessage(session, message);
		
		// Json -> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
		
		switch (mapReceive.get("cmd")) {
			
			case "CMD_ENTER":
				// 소켓에 연결된 회원(map) 세션 리스트(sessionList)에 저장
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("channel", mapReceive.get("channel"));		// 방번호
				map.put("nickname", mapReceive.get("nickname"));	// 닉네임
				map.put("session", session);						// 회원 세션정보
				sessionList.add(map);
				
				// 같은 채널에 입장 메세지 전송
				for (int i=0; i<sessionList.size(); i++) {
					Map<String, Object> mapSessionList = sessionList.get(i);
					String channel = (String) mapSessionList.get("channel");
					WebSocketSession sess = (WebSocketSession)mapSessionList.get("session");
					
					if (channel.equals(mapReceive.get("channel"))) {
						Map<String, String> mapToSend = new HashMap<String, String>();
						mapToSend.put("channel", channel);
						mapToSend.put("cmd", "CMD_ENTER");
						mapToSend.put("msg", mapReceive.get("nickname") + "님이 입장했습니다.");
						
						String jsonStr = objectMapper.writeValueAsString(mapToSend);
						sess.sendMessage(new TextMessage(jsonStr));
					}
				}
				break;
				
			case "CMD_MSG_SEND":
				for (int i=0; i<sessionList.size(); i++) {
					Map<String, Object> mapSessionList = sessionList.get(i);	// 세션리스트에 있는 각 회원 뽑기
					String channel = (String) mapSessionList.get("channel");
					WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
					
					if(channel.equals(mapReceive.get("channel"))) {
						Map<String, String> mapToSend = new HashMap<String, String>();
						mapToSend.put("channel", channel);
						mapToSend.put("cmd", "CMD_MSG_SEND");
						mapToSend.put("msg", mapReceive.get("nickname") + " : " + mapReceive.get("msg"));
						
						String jsonStr = objectMapper.writeValueAsString(mapToSend);
						sess.sendMessage(new TextMessage(jsonStr));
					}
				}
			break;
		}
	}
	
	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		super.afterConnectionClosed(session, status);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String now_channel = "";
		String nickname = "";
		
		// 사용자 세션을 리스트에서 제거
		for (int i=0; i<sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			String channel = (String)map.get("channel");
			WebSocketSession sess = (WebSocketSession)map.get("session");
			
			if(session.equals(sess)) {
				now_channel = channel;
				nickname = (String)map.get("nickname");
				sessionList.remove(map);
				break;
			}
		}
		
		// 같은 채팅방에 퇴장 메세지 전송
		for (int i = 0; i<sessionList.size(); i++) {
			Map<String, Object> mapSessionList = sessionList.get(i);
			String channel = (String)mapSessionList.get("channel");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
			
			if(channel.equals(now_channel)) {
				Map<String, String> mapToSend = new HashMap<String, String>();
				mapToSend.put("channel", channel);
				mapToSend.put("cmd", "CMD_EXIT");
				mapToSend.put("msg", nickname +"님이 퇴장했습니다.");
				
				String jsonStr = objectMapper.writeValueAsString(mapToSend);
				sess.sendMessage(new TextMessage(jsonStr));
			}
		}
		
	}
}
