package kr.co.pet.chat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import kr.co.pet.member.MemberVO;

public interface ChatService {

	List<LinkedHashMap> entry(MemberVO vo);
	int creatChannel(Map membersInfo);
	Integer getChannel(int member_no, int friend_no);
	int joinChannel(int channel_no, int member_no);
	List<LinkedHashMap> chatHistory(int channel_no, int member_no);
	
	List<LinkedHashMap> openChatList();
	List<LinkedHashMap> myOpenChatList(int member_no);
	int joinOpenChannel(int channel_no, int member_no);
	boolean isJoined(int channel_no, int member_no);
	Map<String, String> channelInfo(int channel_no);
	
	Map<String, String> creatOpenChat(Map openChatInfo);
	int exitOpenChat(Map memberInfo);
	public int masterUpdate(Map memberInfo);
	
	
}
