package kr.co.pet.chat;

import java.util.LinkedHashMap;
import java.util.List;

import kr.co.pet.member.MemberVO;

public interface ChatService {

	List<LinkedHashMap> entry(MemberVO vo);
}
