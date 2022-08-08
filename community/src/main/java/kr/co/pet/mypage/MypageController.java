package kr.co.pet.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	@Autowired
	MypageService service;
	
	
	@GetMapping("/mypage/index.do")
	public String mypageList(Model model, MypageVO vo, HttpSession sess) {
		sess.setAttribute("member_no", vo.getMember_no());
		return "mypage/index";
	}
	
	@GetMapping("/mypage/frilist.do")
	public String friendList(Model model, MypageVO vo) {
		model.addAttribute("data", service.friendList(vo));
		return "mypage/friendlist";
	}

	@GetMapping("/mypage/frireq.do")
	public String friReqList(Model model, MypageVO vo) {
		model.addAttribute("data", service.friReqList(vo));
		return "mypage/frireq";
	}
	
	@GetMapping("/mypage/friaccept.do")
	public String friAccept(MypageVO vo) {
		service.friAccept(vo);
		return "mypage/index";
	}
	
	@GetMapping("/mypage/fridel.do")
	public String friDelete(MypageVO vo) {
		service.friDel(vo);
		return "mypage/index";
	}
	
}
