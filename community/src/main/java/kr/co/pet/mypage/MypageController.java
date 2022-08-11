package kr.co.pet.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.pet.member.MemberVO;
import util.PageMaker;

@Controller
public class MypageController {

	@Autowired
	MypageService service;
	
	
	@GetMapping("/mypage/info.do")
	public String mypageList(Model model, HttpSession sess) {
		MemberVO mv = (MemberVO)sess.getAttribute("loginInfo");
//		vo.setMember_no(mv.getMember_no());
		model.addAttribute("mydata", service.memberSelect(mv.getMember_no()));
		return "mypage/myinfo";
	}
	
	@GetMapping("/mypage/index.do")
	public String myIndex(Model model, HttpSession sess) {
		MemberVO mv = (MemberVO)sess.getAttribute("loginInfo");
//		vo.setMember_no(mv.getMember_no());
		model.addAttribute("mydata", service.memberSelect(mv.getMember_no()));
		return "mypage/index";
	}
	
	@GetMapping("/mypage/frilist.do")
	public String friendList(Model model, MypageVO vo) {
		model.addAttribute("data", service.friendList(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.friTotal(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "mypage/friendlist";
	}

	@GetMapping("/mypage/frireq.do")
	public String friReqList(Model model, MypageVO vo) {
		model.addAttribute("data", service.friReqList(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.frireqTotal(vo));
		model.addAttribute("pageMaker", pageMaker);
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
	
	@GetMapping("/mypage/actlist.do")
	public String myActList(Model model, MypageVO vo) {
		model.addAttribute("data", service.myActList(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.actTotal(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "mypage/actlist";
	}
	
	@GetMapping("/mypage/actisdel.do")
	public String actIsdel(MypageVO vo) {
		service.actIsdel(vo);
		return "mypage/index";
	}
}
