package kr.co.pet.member;

import javax.servlet.http.HttpSession;

public interface MemberService {

	boolean update(MemberVO vo);
	boolean delete(int no);
	int insert(MemberVO vo);
	boolean loginCheck(MemberVO vo, HttpSession sess);
	MemberVO findEmail(MemberVO vo);
	MemberVO findPwd(MemberVO vo);
	int idCheck(String id); 
	int nicknameCheck(String nickname);
	int emailCheck(String email);
}
