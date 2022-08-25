package kr.co.pet.report;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.pet.member.MemberVO;

@Controller
public class ReportController {

	@Autowired
	ReportService service;
	
	@GetMapping("report/write.do")
	public String write(ReportVO vo, Model model) {
		model.addAttribute("data", service.getInfo(vo));
		return "report/write";
	}
	
	/**
	 * 신고 등록
	 * @param vo ReportVO - i_no, you_no, reason, content, reply_no, board_no
	 * @param model
	 * @return 등록 후 페이지 이동
	 */
	@PostMapping("report/report.do")
	public String report(ReportVO vo, Model model, HttpSession sess) {
		if(sess.getAttribute("loginInfo") != null) {
			MemberVO mvo = (MemberVO)sess.getAttribute("loginInfo");
			vo.setI_no(mvo.getMember_no());
		}
		
		if (service.report(vo)>0) {
			model.addAttribute("url", "/pet/report/view.do?close_=true");	// 접수 후 이동할 url 입력 필요
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
	@RequestMapping("report/handle.do")
	public String handle(ReportVO vo, Model model) {
		if (service.handle(vo)>0) {
			model.addAttribute("url", "/pet/admin/board/report_board.do");	// 접수 후 이동할 url 입력 필요
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
