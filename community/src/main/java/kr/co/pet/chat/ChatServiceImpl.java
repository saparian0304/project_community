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
		
//		for (int i=0; i < list.size(); i++) {
//			LinkedHashMap map = list.get(i);
//			map.put("i_no", i_no);
//			map.put("channel_no", mapper.listInfo(map));
//			System.out.println(map.get("nickname"));
//			System.out.println(map.get("member_no"));
//			System.out.println(map.get("channel_no"));
//			
//		}
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
	
	public List<LinkedHashMap> chatHistory(int channel_no, int member_no) {
		Map channelInfo = new HashMap();
		channelInfo.put("channel_no", channel_no);
		channelInfo.put("member_no", member_no);
		
		return mapper.chatHistory(channelInfo);
	}
}
