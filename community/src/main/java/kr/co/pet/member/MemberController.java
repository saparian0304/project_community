package kr.co.pet.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/join.do")
	public String join() {
		System.out.println("############");
		System.out.println("나옴???");
		return "member/join"; 
	}
	@PostMapping("/member/join.do")
	public String join(MemberVO vo, Model model) {
//		System.out.println("##############");
//		System.out.println(vo.getEmail());
//		System.out.println(vo.getMember_id());
		if (service.insert(vo) > 0) {
			model.addAttribute("msg", "정상적으로 회원가입되었습니다.");
			model.addAttribute("url", "login.do");
			log.info("model : "+ model);
			return "/common/alert";
		}else {
			model.addAttribute("msg", "회원가입오류");
			return "/common/alert";
		}
	}
	
	@GetMapping("/member/login.do")
	public String login() {
		return "member/login";
	}
	@PostMapping("/member/login.do")
	public String login(MemberVO vo, HttpSession sess, Model model) {
		if(service.loginCheck(vo, sess)) {
			return "redirect:notice.do"; //notice라는 메서드로 매핑돼있는 곳으로 감. notice라는 이름의 파일을 여는게 아님.
		}else {
			model.addAttribute("msg", "아이디/비번을 확인해주세요.");
			System.out.println("왜 오류남");
			return "common/alert";
		}
	}
	
	@GetMapping("/member/logout.do")
	public String logout(HttpServletRequest req, Model model) throws IOException{
		HttpSession sess = req.getSession();
		sess.invalidate();
		model.addAttribute("msg", "로그아웃됨");
		model.addAttribute("url", "/pet/member/login.do");
		return "common/alert";
	}
	
	@GetMapping("/member/notice.do")
	public String notice() {
		return "notice";
	}
	
//	@GetMapping("/board/.do") //간편로그인
//	public String kakaoLogin(HttpSession sess) {
//		
//		return "notice";
//	}
	
	@PostMapping("/member/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("member_id") String member_id) {
		int cnt = service.idCheck(member_id);
		return cnt+"";
	}
	
	@PostMapping("/member/nickname")
	@ResponseBody
	public String nicknameCheck(@RequestParam("nickname") String nickname) {
		int cnt = service.nicknameCheck(nickname);
		return cnt + "";
	}
	@GetMapping("/member/emailCheck.do")
	public void emailCheck(@RequestParam String email, HttpServletResponse res ) throws IOException {
		int cnt = service.emailCheck(email);
		boolean r = false;
		if (cnt > 0) r = true;
		PrintWriter out = res.getWriter();
		out.print(r);
		//out.flush();
	}
	
	@GetMapping("/member/findId.do")
	public String findId() {
		return "member/findId";
	}
	
	@PostMapping("/member/findId.do")
	public String findId(Model model, MemberVO param) {
		MemberVO vo = service.findId(param);
		if(vo != null) {
			model.addAttribute("result", vo.getMember_id());
		}
		return "common/result";
	}

}
