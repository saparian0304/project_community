package kr.co.pet.chat;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.pet.member.MemberVO;

@Controller
public class ControllerView {

	@Autowired
	ChatService service;
	
	// 채팅방 입장
	@RequestMapping(value = {"/chat/f/{member_no}/{friend_no}"})
	public String view_chat(Model model,
							@PathVariable int member_no, 
							@PathVariable int friend_no) {
		Integer channel_no = service.getChannel(member_no, friend_no);
		if (channel_no == null) {
			Map<String, Object> map = new HashMap();
			map.put("member_no", member_no);
			map.put("friend_no", friend_no);
			channel_no = service.creatChannel(map);
			service.joinChannel(channel_no, member_no);
			service.joinChannel(channel_no, friend_no);
		}
		
		model.addAttribute("data",service.chatHistory(channel_no, member_no));
		model.addAttribute("channel_no", channel_no);
		model.addAttribute("member_no", member_no);
		model.addAttribute("friend_no", friend_no);
		
		return "chat/view_chat";
	}
	// 채팅목록 
	@RequestMapping("/chat/index.do")
	public String index(Model model, HttpSession sess) {
		MemberVO vo =(MemberVO)sess.getAttribute("loginInfo");
		if (vo != null)
			model.addAttribute("list", service.entry(vo));
		return "chat/entry";
	}
	
	@RequestMapping("/join.do")
	public String join() {
		return "chat/login";
	}
	
	
}
