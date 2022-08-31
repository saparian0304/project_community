package kr.co.pet.admin;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.pet.member.MemberVO;

public interface AdminService {

	Map list(AdminBoardVO vo);
	
	// 관리자 로그인
	boolean loginCheck(AdminMemberVO vo, HttpSession sess);
	int idCheck(String id);
	int insert(AdminMemberVO vo);
	Map adminList(AdminMemberVO vo);
	int defalutPwd(AdminMemberVO vo);
	
	// 회원관리
	Map memberList(AdminMemberVO vo);

	int memberCnt(AdminMemberVO vo);
	
	//댓글관리 - 박 -
	Map replyList(AdminReplyVO vo);
	
	// 방문자
	Map todayTotalCnt(AdminBoardVO vo);

}
