package kr.co.pet.alram;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AlramController {

	@Autowired
	AlramService service;
	
	
}
