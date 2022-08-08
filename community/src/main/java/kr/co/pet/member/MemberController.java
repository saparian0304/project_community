package kr.co.pet.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
	
	@GetMapping("/board/join.do")
	public String join() {
		System.out.println("############");
		System.out.println("나옴???");
		return "join"; 
	}
	@PostMapping("/board/join.do")
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
	
	@GetMapping("/board/login.do")
	public String login() {
		return "login";
	}
	@PostMapping("/board/login.do")
	public String login(MemberVO vo, HttpSession sess, Model model) {
		if(service.loginCheck(vo, sess)) {
			return "redirect:/notice.do";
		}else {
			model.addAttribute("msg", "아이디/비번을 확인해주세요.");
			System.out.println("왜 오류남");
			return "common/alert";
		}
	}
//	@PostMapping("/board/login.do")
//	public String kakaoLogin(HttpSession sess) {
//		
//		return "notice";
//	}
	
	@PostMapping("/board/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("member_id") String member_id) {
		int cnt = service.idCheck(member_id);
		return cnt+"";
	}
	
	@PostMapping("/board/nickname")
	@ResponseBody
	public String nicknameCheck(@RequestParam("nickname") String nickname) {
		int cnt = service.nicknameCheck(nickname);
		return cnt + "";
	}
	@GetMapping("/board/emailCheck.do")
	public void emailCheck(@RequestParam String email, HttpServletResponse res ) throws IOException {
		int cnt = service.emailCheck(email);
		boolean r = false;
		if (cnt > 0) r = true;
		PrintWriter out = res.getWriter();
		out.print(r);
		//out.flush();
	}
	
//	@PostMapping("/board/login.do")
//	public String loginCheck() {
//		
//	}
}
