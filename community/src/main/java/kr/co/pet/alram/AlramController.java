package kr.co.pet.alram;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.pet.member.MemberVO;

@Controller
public class AlramController {

	@Autowired
	AlramService service;
	
	@GetMapping("/alramlist")
	public String alramList(Model model, HttpSession sess) {
		MemberVO vo = (MemberVO)sess.getAttribute("loginInfo");
		model.addAttribute("alrData", service.alramList(vo.getMember_no()));
		return "alramlist";
	}
	
}
