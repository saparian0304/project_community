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
	@RequestMapping("/admin/main/index.do")
	public String mainIndex() {
		return "admin/main/index";
	}
	
	@RequestMapping("/admin/board/board_list.do")
	public String myinfoIndex(Model model, AdminBoardVO vo) {
		if(vo.getSort() == null) {
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
		if(vo.getSort() == null) {
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
}