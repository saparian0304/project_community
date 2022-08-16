package kr.co.pet.alram;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AlramController {

	@GetMapping("/alram")
	public String alram() {
		return "alram";
	}
	
}
