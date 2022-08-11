package kr.co.pet.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	
	int insert(ReplyVO vo);
	
	int count(ReplyVO vo);
	
	int rcount(ReplyVO vo);
	
	List<ReplyVO> replyList(ReplyVO vo);
	
	List<ReplyVO> list(ReplyVO vo);
	
	int update(int no);
	
	int gnoUpdate(int no);
	
	int reply(ReplyVO vo);
	
	int replyEdit(ReplyVO vo);
	
}
