package kr.co.pet.loc;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LocMapper {
	
	int insert(LocVO vo);
	
}
