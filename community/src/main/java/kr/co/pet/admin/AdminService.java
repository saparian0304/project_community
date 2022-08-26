package kr.co.pet.admin;

import java.util.Map;

public interface AdminService {

	Map list(AdminBoardVO vo);

	// 회원관리
	Map memberList(AdminMemberVO vo);
}
