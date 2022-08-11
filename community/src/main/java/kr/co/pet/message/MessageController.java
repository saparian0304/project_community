package kr.co.pet.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MessageController {

	@Autowired
	MessageService service;
	
	@GetMapping("/message/index.do")
	public String message(MessageVO vo,  Model model) {
		return "message/write";
	}
}
