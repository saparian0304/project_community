package kr.co.pet.reply;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.pet.recommend.RecommendService;
import util.PageMaker;

@Controller
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@Autowired
	RecommendService recService;
	
	@GetMapping("/reply/list.do")
	public String list(ReplyVO vo, Model model, HttpSession sess) {
		model.addAttribute("comment", service.index(vo, sess));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.totalCount(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "reply/comment"; 
	}
	
	
	@GetMapping("/reply/insert.do")
	public String insert(ReplyVO vo, Model model) {
		model.addAttribute("result", service.insert(vo));
		return "common/result";
	}
	
	
	@GetMapping("/reply/update.do")
	public String update(ReplyVO vo, Model model) {
		model.addAttribute("result", service.update(vo));
		return "common/result";
	}
	
	@GetMapping("/reply/reply.do")
	public String reply(ReplyVO vo, Model model) {		
		model.addAttribute("result", service.reply(vo));		
		return "common/result";
	}
	
	@GetMapping("/reply/replylist.do")
	public String replylist(ReplyVO vo, Model model, HttpSession sess) {
		model.addAttribute("reply", service.index(vo, sess));
		return "reply/reply";
	}	
	
	
	@GetMapping("/reply/replyEdit.do")
	public String replyEdit(ReplyVO vo, Model model) {
		model.addAttribute("result", service.replyEdit(vo));
		return "common/result";
	}
	
	
	
}
