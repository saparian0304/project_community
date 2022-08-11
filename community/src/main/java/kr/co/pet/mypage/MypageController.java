package kr.co.pet.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.pet.member.MemberVO;
import util.Criteria;
import util.Paging;

@Controller
public class MypageController {

	@Autowired
	MypageService service;
	
	
	@GetMapping("/mypage/index.do")
	public String mypageList(Model model, HttpSession sess) {
		MemberVO mv = (MemberVO)sess.getAttribute("loginInfo");
//		vo.setMember_no(mv.getMember_no());
		model.addAttribute("mydata", service.memberSelect(mv.getMember_no()));
		return "mypage/index";
	}
	
	@GetMapping("/mypage/frilist.do")
	public String friendList(Model model, MypageVO vo, Criteria cri) {
		model.addAttribute("data", service.friendList(vo));
		model.addAttribute("pageMaker", new Paging(vo, service.friTotal(vo)));
		return "mypage/friendlist";
	}

	@GetMapping("/mypage/frireq.do")
	public String friReqList(Model model, MypageVO vo, Criteria cri) {
		model.addAttribute("data", service.friReqList(vo));
		System.out.println("=============================vo" + vo.getStartIdx());
		model.addAttribute("pageMaker", new Paging(cri, service.frireqTotal(vo)));
		System.out.println("=============================cri" + cri.getStartIdx());
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
