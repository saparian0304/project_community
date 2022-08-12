package kr.co.pet.board.api;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApiMapper {
	int insert(ApiVO vo);
	
	int apiInsert(ApiVO vo);
}
