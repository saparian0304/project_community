package kr.co.pet.alram;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlramMapper {

	String findNick(int member_no);
	String findBoard_name(int member_no);
	
	int insert(AlramVO vo);

	List alramList(int member_no);
}
