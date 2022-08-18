package kr.co.pet.alram;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlramMapper {

	String findNick(int member_no);
	
	int insert(AlramVO vo);
	
}
