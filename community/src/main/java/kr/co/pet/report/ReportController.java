package kr.co.pet.report;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReportController {

	@Autowired
	ReportService service;
	
	/**
	 * 신고 등록
	 * @param vo ReportVO - i_no, you_no, reason, content, reply_no, board_no
	 * @param model
	 * @return 등록 후 페이지 이동
	 */
	@RequestMapping("report/report.do")
	public String report(ReportVO vo, Model model) {
		if (service.report(vo)>0) {
			model.addAttribute("url", "");	// 접수 후 이동할 url 입력 필요
			model.addAttribute("msg", "신고가 정상적으로 접수되었습니다.");
		} else {
			model.addAttribute("msg", "접수 중에 오류가 발생하였습니다. 잠시 후에 다시 시도해주십시오.");
		}
		return "common/alert";
	}
	
	/**
	 * 
	 * @param vo ReportVO - report_no, stat
	 * @return 신고처리 후 페이지 이동
	 */
	@ResponseBody
	@RequestMapping("report/handle.do")
	public String handle(@RequestBody ReportVO vo, Model model) {
		if (service.handle(vo)>0) {
			model.addAttribute("url", "");	// 접수 후 이동할 url 입력 필요
			model.addAttribute("msg", "정상 처리되었습니다.");
		} else {
			model.addAttribute("msg", "처리 중에 오류가 발생하였습니다.");
		}
		return "common/alert";
	}
	
	/**
	 * 
	 * @param vo ReportVO - reply_no, board_no, stat
	 * @param model
	 * @return 신고목록 리스트 페이지 반환
	 */
	@RequestMapping("report/list.do")
	public String list(ReportVO vo, Model model) {
		model.addAttribute("data", service.getList(vo));
		return "report/board";
	}
	
	/**
	 * 
	 * @param vo ReportVO - report_no, stat
	 * @param model
	 * @return 상세페이지 반환
	 */
	@RequestMapping("report/view.do")
	public String view(ReportVO vo, Model model) {
		model.addAttribute("data", service.getView(vo));
		return "report/view";
	}
	
	/**
	 * 
	 * @param vo ReportVO - you_no, stat
	 * @param model
	 * @return 회원 신고목록페이지 반환
	 */
	@RequestMapping("report/reportedList.do")
	public String reportedList(ReportVO vo, Model model) {
		model.addAttribute("data", service.getReportedList(vo));
		return "report/memberBoard";
	}
	
}
