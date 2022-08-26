package kr.co.pet.admin;

import java.util.Map;

public interface AdminService {

	Map list(AdminBoardVO vo);
	
	Map memberList(AdminMemberVO vo);
	int memberCnt(AdminMemberVO vo);
	
	//댓글관리 - 박 -
	Map replyList(AdminReplyVO vo);
}
