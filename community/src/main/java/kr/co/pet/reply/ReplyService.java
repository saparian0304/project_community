package kr.co.pet.reply;

import java.util.Map;

public interface ReplyService {
	
	Map index(ReplyVO vo); 
	
	int insert(ReplyVO vo);
		
	int update(ReplyVO vo);
	
	int reply(ReplyVO vo);
}
