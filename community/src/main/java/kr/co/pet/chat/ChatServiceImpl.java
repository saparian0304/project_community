package kr.co.pet.chat;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.member.MemberVO;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatMapper mapper;
	
	@Override
	public List<LinkedHashMap> entry(MemberVO vo) {
		int i_no = vo.getMember_no();
		List<LinkedHashMap> list = mapper.list(i_no);
		
		return list;
	}
	
	public int creatChannel(Map membersInfo) {
		mapper.creatChannel(membersInfo);
		return (int)membersInfo.get("channel_no");
	}
	
	public Integer getChannel(int member_no, int friend_no) {
		Map membersInfo = new HashMap();
		membersInfo.put("member_no", member_no);
		membersInfo.put("friend_no", friend_no);
		return mapper.getChannel(membersInfo);
	}
	
	public int joinChannel(int channel_no, int member_no) {
		Map joinInfo = new HashMap();
		joinInfo.put("member_no", member_no);
		joinInfo.put("channel_no", channel_no);
		
		return mapper.joinChannel(joinInfo);
	}
	
	public int joinOpenChannel(int channel_no, int member_no) {
		Map joinInfo = new HashMap();
		joinInfo.put("member_no", member_no);
		joinInfo.put("channel_no", channel_no);
		
		int limit= Integer.valueOf(String.valueOf(mapper.channelInfo(channel_no).get("limit")));
		int joinedNum = mapper.getMemberCnt(joinInfo);
		int result = 0;
		
		if (joinedNum < limit) {
			result = mapper.joinChannel(joinInfo);
		}
		
		return result;
	}
	
	public List<LinkedHashMap> chatHistory(int channel_no, int member_no) {
		Map channelInfo = new HashMap();
		channelInfo.put("channel_no", channel_no);
		channelInfo.put("member_no", member_no);
		
		return mapper.chatHistory(channelInfo);
	}

	@Override
	public List<LinkedHashMap> openChatList() {
		
		return mapper.openChatList();
	}

	@Override
	public List<LinkedHashMap> myOpenChatList(int member_no) {
		
		return mapper.myOpenChatlist(member_no);
	}

	@Override
	public boolean isJoined(int channel_no, int member_no) {
		Map memberInfo = new HashMap();
		memberInfo.put("channel_no", channel_no);
		memberInfo.put("member_no", member_no);
		return mapper.isJoined(memberInfo) > 0;
	}
	
	@Override
	public Map<String, String> channelInfo(int channel_no) {
		return mapper.channelInfo(channel_no);
	}
	
	@Override
	public Map<String, String> creatOpenChat(Map openChatInfo) {
		mapper.creatOpenChat(openChatInfo);
		return openChatInfo;
	}

	@Override
	public int exitOpenChat(Map memberInfo) {
		int result = mapper.exitOpenChat(memberInfo);
		if (mapper.getMemberCnt(memberInfo) == 0) {
			mapper.closeChannel(memberInfo);
		}
		return result;
	}

}
