package kr.co.pet.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.pet.member.MemberVO;

@Controller
public class ControllerView {

	@Autowired
	ChatService service;
	
	// 채팅방 입장
	@RequestMapping("/chat/chat.do")
	public String view_chat(HttpServletRequest req, HttpServletResponse res, Model model) {
		return "chat/view_chat";
	}
	// 채팅목록 
	@RequestMapping("/chat/index.do")
	public String index(Model model, HttpSession sess) {
		MemberVO vo =(MemberVO)sess.getAttribute("loginInfo");
		if (vo != null)
			model.addAttribute("list", service.entry(vo));
		return "chat/entry";
	}
	
	@RequestMapping("/join.do")
	public String join() {
		return "chat/login";
	}
	
	
}
