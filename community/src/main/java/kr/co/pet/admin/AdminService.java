package kr.co.pet.admin;

import java.util.Map;

public interface AdminService {

	Map list(AdminBoardVO vo);

	// 회원관리
	Map memberList(AdminMemberVO vo);

	int memberCnt(AdminMemberVO vo);
	
	//댓글관리 - 박 -
	Map replyList(AdminReplyVO vo);
	
	// 방문자
	Map todayTotalCnt(AdminBoardVO vo);

}
