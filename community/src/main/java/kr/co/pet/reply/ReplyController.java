package kr.co.pet.reply;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReplyController {

	@Autowired
	ReplyService service;
	
	
	@GetMapping("/comment/list.do")
	public String list(ReplyVO vo, Model model) {
		model.addAttribute("comment", service.index(vo));
		
		return "common/comment"; 
	}
	
	
	@GetMapping("/comment/insert.do")
	public String insert(ReplyVO vo, Model model) {
		model.addAttribute("result", service.insert(vo));
		return "common/result";
	}
	
	
	@GetMapping("/comment/update.do")
	public String update(ReplyVO vo, Model model) {
		model.addAttribute("result", service.update(vo));
		return "common/result";
	}
	
	@GetMapping("/comment/reply.do")
	public String reply(ReplyVO vo, Model model) {
		
		model.addAttribute("result", service.reply(vo));		
		return "common/result";
	}
	
	@GetMapping("/comment/replylist.do")
	public String replylist(ReplyVO vo, Model model) {
		model.addAttribute("reply", service.index(vo));
		return "common/reply";
	}
	
	
}
