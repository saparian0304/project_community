package kr.co.pet.loc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.pet.board.BoardService;

@Controller
public class LocController {

	@Autowired
	BoardService service;
	
	@GetMapping("/selectbox")
	public void selectbox(Model model) {
		model.addAttribute("getDBList", service.getDBList());
	}
	
}
