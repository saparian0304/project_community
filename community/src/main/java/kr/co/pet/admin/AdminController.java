package kr.co.pet.admin;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.pet.member.MemberVO;
import kr.co.pet.report.ReportService;
import kr.co.pet.report.ReportVO;
import util.PageMaker;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@Autowired
	ReportService rservice;
	
	@RequestMapping("/admin/index.do")
	public String index() {
		return "admin/index";
	}
	
	// 메인 들어가자 마자 보이게
	@RequestMapping("/admin/main/index.do")
	public String mainindex(Model model, AdminBoardVO vo) {
		model.addAttribute("total", service.todayTotalCnt(vo)); // 방문자 
		
		return "admin/main/index";
	}
	
	@RequestMapping("/admin/board/board_list.do")
	public String myinfoIndex(Model model, AdminBoardVO vo) {
		if(vo.getSort() == null || vo.getSort().equals("")) {
			vo.setSort("regdate");
			vo.setOrder("DESC");
		}
		model.addAttribute("data", service.list(vo));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount((int)((Map)(model.getAttribute("data"))).get("totalCount"));
		model.addAttribute("pageMaker", pageMaker);
		return "admin/board/board_list";
	}
	
	
	@RequestMapping("/admin/board/report_board.do")
	public String report_board(Model model, ReportVO vo) {
		if(vo.getSort() == null || "".equals(vo.getSort())) {
			vo.setSort("regdate");
			vo.setOrder("DESC");
		}
		model.addAttribute("data", rservice.getReportedList(vo));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount((int)((Map)(model.getAttribute("data"))).get("totalCount"));
		model.addAttribute("pageMaker", pageMaker);
		return "admin/board/report_board";
	}
	
	@RequestMapping("/admin/member/member_list.do")
	public String memberList(Model model, AdminMemberVO vo) {
		if(vo.getSort() == null || "".equals(vo.getSort())) {
			vo.setSort("member_no");
			vo.setOrder("ASC");
		}
		model.addAttribute("data", service.memberList(vo));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount((int)((Map)(model.getAttribute("data"))).get("totalCount"));
		model.addAttribute("pageMaker", pageMaker);
		return "admin/member/member_list";
	}
	
	@RequestMapping("/admin/member/admin_list.do")
	public String adminList(Model model, AdminMemberVO vo) {
		if(vo.getSort() == null || "".equals(vo.getSort())) {
			vo.setSort("admin_no");
			vo.setOrder("ASC");
		}
		model.addAttribute("data", service.adminList(vo));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount((int)((Map)(model.getAttribute("data"))).get("totalCount"));
		model.addAttribute("pageMaker", pageMaker);
		return "admin/member/admin_list";
	}
	@RequestMapping("/admin/defalutPwd.do")
	public String defalutPwd(Model model, AdminMemberVO vo) {
		if(service.defalutPwd(vo)>0) {
			model.addAttribute("url", "/pet/admin/member/admin_list.do");
			model.addAttribute("msg", "정상처리되었습니다.");
			return "common/alert";
		} else {
			model.addAttribute("msg", "처리 중에 오류가 발생하였습니다.");
			return "/common/alert";
		}
	}
	
	@RequestMapping("/admin/board/reply_list.do")
	public String replyIndex(Model model, AdminReplyVO vo) {
		if(vo.getSort() == null || "".equals(vo.getSort())) {
			vo.setSort("reply_no");
			vo.setOrder("DESC");
		}
		model.addAttribute("data", service.replyList(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount((int)((Map)(model.getAttribute("data"))).get("totalCount"));
		model.addAttribute("pageMaker", pageMaker);
		return "admin/board/reply_list";
	}
	
	
	@GetMapping("/admin/login.do")
	public String login() {
		return "admin/login";
	}
	@PostMapping("/admin/login.do")
	public String login(AdminMemberVO vo, HttpSession sess, Model model) {
		if(service.loginCheck(vo, sess)) {
			return "redirect:/admin/index.do"; //notice라는 메서드가 매핑돼있는 곳으로 감. notice라는 이름의 파일을 여는게 아님.
		}else {
			model.addAttribute("msg", "아이디/비번을 확인해주세요.");
			return "common/alert";
		}
	}
	
	
	@GetMapping("/admin/join.do")
	public String join() {
		return "admin/join";
	}
	
	@PostMapping("/admin/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("admin_id") String admin_id) {
		int cnt = service.idCheck(admin_id);
		return cnt+"";
	}
	
	@PostMapping("/admin/join.do")
	public String join(AdminMemberVO vo, Model model) {
		if (service.insert(vo) > 0) {
			model.addAttribute("msg", "정상적으로 회원가입되었습니다.");
			model.addAttribute("url", "index.do");
			return "/common/alert";
		}else {
			model.addAttribute("msg", "회원가입오류");
			return "/common/alert";
		}
	}
	
	//로그아웃
	@GetMapping("/admin/logout.do")
	public String logout(HttpServletRequest req, Model model ) throws IOException{
		HttpSession sess = req.getSession();
		
		sess.invalidate();
		model.addAttribute("msg", "로그아웃완료!");
		model.addAttribute("url", "/pet/admin/login.do");
		return "common/alert";
	}
	
	
	
}
