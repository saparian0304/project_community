package kr.co.pet.member;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.SendMail;

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

	@Override
	public MemberVO findId(MemberVO vo) {
		System.out.println("findId : "+ vo);
		
		return mapper.findId(vo);
	}
	
	@Override
	public MemberVO findPwd(MemberVO vo) {
		//update
		MemberVO mv = mapper.findPwd(vo);

		
		if(mv !=null) {
		//임시비번생성
		//영문3자리,숫자3자리
		String temp = "";
		for (int i=0; i<3; i++) {
			temp += (char)(Math.random()*26+97);
		}
		for (int i=0; i<3; i++) {
			temp += (int)(Math.random()*9);
		}
		//임시비번 update
		vo.setPwd(temp);
		mapper.updateTempPwd(vo);
		
		System.out.println("보내는대상 : "+ vo.getMember_id());
		//email발송
		SendMail.sendMail("a_jin0609@naver.com", vo.getEmail(), "[pet_community]비번test", "임시비번: "+temp+"입니다.");
		return mv;
	    }else {
		    return null;
	    }
	}

}
