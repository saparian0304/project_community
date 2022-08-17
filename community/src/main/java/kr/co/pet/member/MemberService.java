package kr.co.pet.member;

import javax.servlet.http.HttpSession;

public interface MemberService {

	boolean update(MemberVO vo);
	boolean delete(int no);
	int insert(MemberVO vo);
	boolean loginCheck(MemberVO vo, HttpSession sess);
	int idCheck(String id); 
	int nicknameCheck(String nickname);
	int emailCheck(String email, HttpSession sess);
	MemberVO findId(MemberVO vo);
	MemberVO findPwd(MemberVO vo);
	MemberVO loginBySns(MemberVO vo, HttpSession sess);
}
