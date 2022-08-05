package kr.co.pet.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Override
	public int insert(MemberVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int emailDupCheck(String email) {
		return mapper.emailDupCheck(email);
	}

	@Override
	public boolean loginCheck(MemberVO vo, HttpSession sess) {
		//세션객체를 로그인할 때 넘겨줘야 함
		boolean r = false;
		MemberVO loginInfo = mapper.loginCheck(vo); 
		if(mapper.loginCheck(vo) != null) {
			r = true;
			//로그인 성공시 세션에 저장
			sess.setAttribute("loginInfo", loginInfo);
		}
		return r;
	}

	@Override
	public MemberVO findEmail(MemberVO vo) {
		return mapper.findEmail(vo);
	}
	
	@Override
	public MemberVO findPwd(MemberVO vo) {
		//update
		MemberVO mv = mapper.findEmail(vo);
		if(mv != null) {
			//임시 비밀번호 생성
			//영문 두자리, 숫자 두자리
			String temp = "";
			for(int i=0; i<2; i++) {
				temp += (char)(Math.random()*26+65);
			}
			for(int i=0; i<2; i++) {
				temp += (int)(Math.random()*9);
			}
			//임시비밀번호 update
			vo.setPwd(temp);
			mapper.updateTempPwd(vo);
			
			//email발송
			//SendMail.sendMail("zkdl1201@naver.com", vo.getEmail(), "[더조은]임시비밀번호", "임시비밀번호 : "+temp);
			
			return mv;
		} else {
			return null;
		}
		
	}

}
