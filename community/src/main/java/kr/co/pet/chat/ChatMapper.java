package kr.co.pet.chat;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.pet.member.MemberVO;

@Mapper
public interface ChatMapper {

	List<LinkedHashMap> friendList(int vo);
	Integer listInfo(LinkedHashMap map);
	List<LinkedHashMap> list(int i_no);
	
}
