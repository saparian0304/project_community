package kr.co.pet.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {

	@Autowired
	MessageService service;
	
	// 쪽지 보내기
	@RequestMapping("/message/index.do")
	public String message(MessageVO vo,  Model model) {
		return "message/write";
	}
	
	// 마이페이지에서 쪽지 보내기
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
	
	// 아이디 찾기
	@RequestMapping("/message/search.do")
	public String search(MessageVO vo,  Model model) {			
			model.addAttribute("result", service.search(vo));
			return "common/result";	
		
	}
	
	// 아이디 눌렀을때
	@RequestMapping("/message/send.do")
	public String messageSend(MessageVO vo,  Model model) {
		return "message/send";
	}	
	
	// 아이디 눌렀을때 쪽지보내기 팝업
	@RequestMapping("/message/sendinsert.do")
	public String insert2(MessageVO vo, Model model) {		
		if (service.insert(vo)){
			model.addAttribute("off", "yes");
			return "reply/comment"; 
		} else {
			model.addAttribute("msg", "발송을 실패했습니다.");
			return "common/alert"; 
		}
	}
	
	// 쪽지 답장
	@RequestMapping("/message/resend.do")
	public String messageResend(MessageVO vo,  Model model) {
		return "message/resend";
	}
	
	
	// 마이페이지에서 쪽지 답장 팝업
	@RequestMapping("/message/resendinsert.do")
	public String insert3(MessageVO vo, Model model) {		
		if (service.insert(vo)){
			model.addAttribute("off", "yes");
			return "mypage/messreadlist"; 
		}		
		else {
			model.addAttribute("msg", "발송을 실패했습니다.");
			return "common/alert"; 
		}
	}	
		
	// 마이페이지에서 받은쪽지 리스트 클릭시
	@RequestMapping("/message/listread.do")
	public String messageListRead(MessageVO vo,  Model model) {		
		return "message/listread";
	}
	
	
	@RequestMapping("/message/listsend.do")
	public String messageListSend(MessageVO vo,  Model model) {
		return "message/listsend";
	}	
	
	// 아이디 눌렀을때 쪽지보내기
	/*
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
	*/	
	
	
	// 마이페이지에서 쪽지 답장
	/*
	@RequestMapping("/message/resendinsert.do")
	public String insert3(MessageVO vo, Model model) {		
		if (service.insert(vo)){
			model.addAttribute("msg", "발송 되었습니다.");
			model.addAttribute("url", "/pet/message/index.do");
			return "common/alert"; 
		} else {
			model.addAttribute("msg", "발송을 실패했습니다.");
			return "common/alert"; 
		}
	}
	*/	
	
	
}
