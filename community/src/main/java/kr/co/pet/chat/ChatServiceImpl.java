package kr.co.pet.chat;

import java.util.LinkedHashMap;
import java.util.List;

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

}
