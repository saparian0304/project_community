package kr.co.pet.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		if(vo.getSort() == null) {
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
	
	@RequestMapping("/admin/board/reply_list.do")
	public String replyIndex(Model model, AdminReplyVO vo) {
		if(vo.getSort() == null) {
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
}
