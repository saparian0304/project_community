package kr.co.pet.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
		if (mv != null) {
			model.addAttribute("mydata", service.memberSelect(mv.getMember_no()));
			return "mypage/index";
		} else {
			model.addAttribute("msg", "다시 로그인해주세요");
			model.addAttribute("url", "/pet/member/login.do");
			return "common/alert";
		}
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
//		vo.setPageRow(12);
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
	
	@GetMapping("/mypage/messreadlist.do")
	public String messReadList(Model model, MypageVO vo) {
		model.addAttribute("data", service.messReadList(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.messReadTotal(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "mypage/messreadlist";
	}

	@GetMapping("/mypage/messsendlist.do")
	public String messSendList(Model model, MypageVO vo) {
		model.addAttribute("data", service.messSendList(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.messSendTotal(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "mypage/messsendlist";
	}
	
	@GetMapping("/mypage/booklist.do")
	public String bookList(Model model, MypageVO vo) {
		model.addAttribute("data", service.bookList(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.bookCnt(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "mypage/booklist";
	}
	
	// 팔로우 리스트
	@GetMapping("/mypage/followlist.do")
	public String followList(Model model, MypageVO vo) {
		model.addAttribute("data", service.followList(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.followCount(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "mypage/followlist";
	}
	
	
	// 차단 리스트
	@GetMapping("/mypage/blocklist.do")
	public String blockList(Model model, MypageVO vo) {
		model.addAttribute("data", service.blockList(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.blockCount(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "mypage/blocklist";
	}
	
	//친구신청
	@GetMapping("/mypage/friinsert.do")
	public String friInsert(Model model, MypageVO vo) {
		if(service.friReqInsert(vo) == 1) {
			model.addAttribute("result", 1);
			return "common/result";
		} else {
			model.addAttribute("result", 0);
			return "common/result";
		}
	}
	
	@GetMapping("/mypage/memberUpdate.do")
	public String memberUpdate(MemberVO vo, Model model) {
		model.addAttribute("data",  service.memberSelect(vo.getMember_no()));
		return "mypage/update";
	}
	
	@PostMapping("/mypage/memberUpdate.do")
	public String memberUpdate(HttpSession sess, MemberVO vo, Model model){
		if(service.memberUpdate(vo) >0) {
			sess.setAttribute("loginInfo",service.memberSelect(vo.getMember_no()));
			model.addAttribute("msg", "닉네임 변경 완료했습니다.");
			model.addAttribute("url", "index.do");
			
			return "common/alert";
		} else {
			model.addAttribute("msg", "닉네임 변경실패했습니다");
			
			return "common/alert";
		}
	
	}
}
