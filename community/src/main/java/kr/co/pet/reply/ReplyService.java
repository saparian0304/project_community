package kr.co.pet.reply;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface ReplyService {
	
	Map index(ReplyVO vo, HttpSession sess); 
	
	int insert(ReplyVO vo);
		
	int update(ReplyVO vo);
	
	int reply(ReplyVO vo);

	int replyEdit(ReplyVO vo);
	
	int totalCount(ReplyVO vo);
}
