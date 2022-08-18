package kr.co.pet.message;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {

	@Autowired
	MessageService service;
	
	@RequestMapping("/message/index.do")
	public String message(MessageVO vo,  Model model) {
		return "message/write";
	}
	
	@RequestMapping("/message/send.do")
	public String messageSend(MessageVO vo,  Model model) {
		return "message/send";
	}
	
	@RequestMapping("/message/resend.do")
	public String messageResend(MessageVO vo,  Model model) {
		return "message/resend";
	}
	
	
	
	@RequestMapping("/message/insert.do")
	public String insert(MessageVO vo, Model model) {
		if (service.insert(vo)){
			model.addAttribute("msg", "발송 되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert"; 
		} else {
			model.addAttribute("msg", "발송을 실패했습니다.");
			return "common/alert"; 
		}
	}
	
	
	@RequestMapping("/message/sendinsert.do")
	public String insert2(MessageVO vo, Model model, HttpServletRequest request) {
		String board_no = request.getParameter("board_no");	
		
		if (service.insert(vo)){
			model.addAttribute("msg", "발송 되었습니다.");
			model.addAttribute("url", "/pet/board/view.do?board_no="+board_no);
			return "common/alert"; 
		} else {
			model.addAttribute("msg", "발송을 실패했습니다.");
			return "common/alert"; 
		}
	}
	
	@RequestMapping("/message/resendinsert.do")
	public String insert3(MessageVO vo, Model model) {		
		if (service.insert(vo)){
			model.addAttribute("msg", "발송 되었습니다.");
			/* model.addAttribute("url", "/pet/mypage/index.do"); */
			return "common/alert"; 
		} else {
			model.addAttribute("msg", "발송을 실패했습니다.");
			return "common/alert"; 
		}
	}
	
	@RequestMapping("/message/search.do")
	public String search(MessageVO vo,  Model model) {
		/*if(service.search(vo) == 0) {
			model.addAttribute("msg","찾으시는 아이디가 없습니다.");
			return "common/alert";
		}
		else {*/
			model.addAttribute("result", service.search(vo));
			return "common/result";
		
		/*model.addAttribute("result", service.search(vo));
		return "common/result";*/
		
	}
	
	
}
