package kr.co.pet.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.pet.reply.ReplyVO;

@Controller
public class MessageController {

	@Autowired
	MessageService service;
	
	@RequestMapping("/message/index.do")
	public String message(MessageVO vo,  Model model) {
		return "message/write";
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
	
	
	@RequestMapping("/message/search.do")
	public String search(MessageVO vo,  Model model) {
		model.addAttribute("result", service.search(vo));
		return "common/result";
	}
	
	
}
