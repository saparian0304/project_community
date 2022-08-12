package kr.co.pet.message;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {
	
	int insert(MessageVO vo);
	
	List<MessageVO> sendList(MessageVO vo);
	
	List<MessageVO> readList(MessageVO vo);
	
	MessageVO search(MessageVO vo);
	
	int readUpdate(int no);
	
	int delUpdate(int no);
	
}
