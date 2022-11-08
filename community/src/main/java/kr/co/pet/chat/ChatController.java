package kr.co.pet.chat;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.pet.member.MemberVO;

@Controller
public class ChatController {

	@Autowired
	ChatService service;
	
	// 채팅목록 
	@RequestMapping("/chat/index.do")
	public String index(Model model, HttpSession sess) {
		MemberVO vo =(MemberVO)sess.getAttribute("loginInfo");
		if (vo == null) { 
			model.addAttribute("msg", "로그인 후 이용할 수 있습니다.");
			model.addAttribute("url", "/board/index.do");
			return "common/result";
		} else {
			model.addAttribute("list", service.entry(vo));
			return "chat/entry";
		}
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
		if (vo == null) { 
			model.addAttribute("msg", "로그인 후 이용할 수 있습니다.");
			model.addAttribute("url", "/board/index.do");
			return "common/result";
		} else {
			int member_no = vo.getMember_no();
			
			// 없는 경우 입장
			if (!service.isJoined(channel_no, member_no)) {
				// 제한인원 확인 후 입장
				if (service.joinOpenChannel(channel_no, member_no) ==0) {
					model.addAttribute("msg", "채팅방이 꽉 차있습니다.");
					model.addAttribute("url", "/pet/chat/openChat.do?close_=true");
					return "common/alert";
				}
			}
	
			model.addAttribute("data",service.chatHistory(channel_no, member_no));
			model.addAttribute("channel_no", channel_no);
			model.addAttribute("member_no", member_no);
			model.addAttribute("channelInfo", service.channelInfo(channel_no));
		}
			
		return "chat/view_openChat";
	}
	
	
	@RequestMapping("/join.do")
	public String join() {
		return "chat/login";
	}
	
	
	// 오픈채팅방 생성 폼 
	@GetMapping("/chat/create.do")
	public String create() {
		return "chat/create";
	}

	// 오픈채팅방 생성
	@PostMapping("/chat/create.do")
	public String createOpenChat(Model model, HttpServletRequest req) {
		
		HttpSession sess = req.getSession();
		MemberVO vo = (MemberVO)sess.getAttribute("loginInfo");
		
		Map<String, String> openChatInfo = new HashMap();
		openChatInfo.put("type", req.getParameter("type"));
		openChatInfo.put("title", req.getParameter("title"));
		openChatInfo.put("limit", req.getParameter("limit"));
		openChatInfo.put("master_no", vo.getMember_no()+"");
		
		service.creatOpenChat(openChatInfo);
		int channel_no = Integer.valueOf(String.valueOf(openChatInfo.get("channel_no")));
		service.joinOpenChannel(channel_no, vo.getMember_no());
		
		
		model.addAttribute("list", service.openChatList());
		return "chat/openEntry";
	}
	
	@GetMapping("chat/exit.do")
	public String exitOpenChat(@RequestParam int channel_no, HttpServletRequest req) {
		HttpSession sess = req.getSession();
		MemberVO vo = (MemberVO)sess.getAttribute("loginInfo");
		if(vo != null) {
			Map memberInfo = new HashMap();
			memberInfo.put("channel_no", channel_no);
			memberInfo.put("member_no", vo.getMember_no());
			service.exitOpenChat(memberInfo);
		}
		req.setAttribute("close_", "true");
		return "chat/view_openChat";
	}
}
