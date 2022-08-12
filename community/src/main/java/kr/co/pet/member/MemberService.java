package kr.co.pet.member;

import javax.servlet.http.HttpSession;

import kr.co.pet.certification.CertificationVO;

public interface MemberService {

	boolean update(MemberVO vo);
	boolean delete(int no);
	int insert(MemberVO vo);
	boolean loginCheck(MemberVO vo, HttpSession sess);
	int idCheck(String id); 
	int nicknameCheck(String nickname);
	int emailCheck(String email);
	MemberVO findId(MemberVO vo);
	MemberVO findPwd(MemberVO vo);
	void certification(CertificationVO c_vo, HttpSession sess);
	void checkCerti(String certi_num);
}
