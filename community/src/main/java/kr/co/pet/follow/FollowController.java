package kr.co.pet.follow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FollowController {

	@Autowired
	FollowService service;
		
	// 팔로우
	@RequestMapping("/follow/insert.do")
	public String insert(FollowVO vo, Model model) {	
		int i = service.insert(vo);
		System.out.println(i);
		model.addAttribute("result", i);		
		return "common/result";
	}
	
	// 차단
	@RequestMapping("/follow/blockinsert.do")
	public String blockInsert(FollowVO vo, Model model) {	
		int i = service.blockInsert(vo);
		model.addAttribute("result", i);		
		return "common/result";
	}
	
	
}
