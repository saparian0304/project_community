package kr.co.pet.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	


	@Override
	public boolean update(MemberVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int no) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insert(MemberVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}

	@Override
	public boolean loginCheck(MemberVO vo, HttpSession sess) {
		boolean l = false;
		MemberVO loginInfo = mapper.loginCheck(vo);
		if(loginInfo != null) {
			l = true;
			//로그인 성공하면 세션에 저장
			sess.setAttribute("loginInfo", loginInfo);
		}
		return l; 
	}

	@Override
	public MemberVO findEmail(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO findPwd(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int idCheck(String id) {
		int cnt = mapper.idCheck(id);
		System.out.println("cnt : "+ cnt);
		return cnt;
	}

	@Override
	public int nicknameCheck(String nickname) {
		int cnt = mapper.nicknameCheck(nickname);
		System.out.println("nickname: "+cnt);
		return cnt;
	}

}
