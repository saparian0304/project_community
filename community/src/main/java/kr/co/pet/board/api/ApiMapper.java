package kr.co.pet.board.api;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApiMapper {
	int insert(ApiVO vo);
	
	int insert2(Map map);
	
	
}
