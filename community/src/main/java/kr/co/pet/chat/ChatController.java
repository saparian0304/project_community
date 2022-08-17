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
public class ChatController {

	@Autowired
	ChatService service;
	
	// 채팅목록 
	@RequestMapping("/chat/index.do")
	public String index(Model model, HttpSession sess) {
		MemberVO vo =(MemberVO)sess.getAttribute("loginInfo");
		if (vo != null)
			model.addAttribute("list", service.entry(vo));
		return "chat/entry";
	}
	
	// 오픈채팅 목록
	@RequestMapping("/chat/openChat.do")
	public String openIndex(Model model, HttpSession sess) {
			model.addAttribute("list", service.openChatList());
		return "chat/openEntry";
	}
	// 참여중인 오픈채팅 목록
	@RequestMapping("/chat/myOpenChat.do")
	public String openMyIndex(Model model, HttpSession sess) {
		MemberVO vo =(MemberVO)sess.getAttribute("loginInfo");
		if (vo != null)
			model.addAttribute("list", service.myOpenChatList(vo.getMember_no()));
		return "chat/myOpenEntry";
	}
	
	
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
	
	// 채팅방 입장
	@RequestMapping(value = {"/chat/o/{channel_no}"})
	public String view_chat(Model model,
							@PathVariable int channel_no, HttpSession sess) {
		MemberVO vo =(MemberVO)sess.getAttribute("loginInfo");
//			Integer channel_no = service.getChannel(member_no, friend_no);
//			if (channel_no == null) {
//				Map<String, Object> map = new HashMap();
//				map.put("member_no", member_no);
//				map.put("friend_no", friend_no);
//				channel_no = service.creatChannel(map);
//				service.joinChannel(channel_no, member_no);
//				service.joinChannel(channel_no, friend_no);
//			}
//			
//			model.addAttribute("data",service.chatHistory(channel_no, member_no));
//			model.addAttribute("channel_no", channel_no);
//			model.addAttribute("member_no", member_no);
//			model.addAttribute("friend_no", friend_no);
//			
		return "chat/view_chat";
	}
	
	
	@RequestMapping("/join.do")
	public String join() {
		return "chat/login";
	}
	
	
}
