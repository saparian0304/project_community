package kr.co.pet.message;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {
	
	int insert(MessageVO vo);
	
	
}
