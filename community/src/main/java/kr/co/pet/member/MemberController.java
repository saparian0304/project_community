package kr.co.pet.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@Autowired
	HttpSession sess;
	
	@GetMapping("/member/join.do")
	public String join() {
		System.out.println("############");
		System.out.println("가입하세요 어서");
		return "member/join"; 
	}
	@PostMapping("/member/join.do")
	public String join(MemberVO vo, Model model) {

		if (service.insert(vo) > 0) {
			model.addAttribute("msg", "정상적으로 회원가입되었습니다.");
			model.addAttribute("url", "login.do");
			log.info("model : "+ model);
			return "/common/alert";
		}else {
			model.addAttribute("msg", "회원가입오류");
			return "/common/alert";
		}
	}
	
	@GetMapping("/member/login.do")
	public String login() {
		return "member/login";
	}
	@PostMapping("/member/login.do")
	public String login(MemberVO vo, HttpSession sess, Model model) {
		if(service.loginCheck(vo, sess)) {
			
			
			return "redirect:/main.do"; //notice라는 메서드가 매핑돼있는 곳으로 감. notice라는 이름의 파일을 여는게 아님.
		}else {
			model.addAttribute("msg", "아이디/비번을 확인해주세요.");
			System.out.println("왜 오류남");
			return "common/alert";
		}
	}
	//로그아웃
	@GetMapping("/member/logout.do")
	public String logout(HttpServletRequest req, Model model ) throws IOException{
		
		HttpSession sess = req.getSession();
		
		sess.invalidate();
		model.addAttribute("msg", "로그아웃완료!");
		model.addAttribute("url", "/pet/member/login.do");
		return "common/alert";
	}
	
	@GetMapping("/member/notice.do")
	public String notice() {
		return "notice";
	}
	
	//간편로그인
	@GetMapping("/member/loginBySns.do")
		public String loginBySns(@RequestParam(value="code", required =false) String code, Model model)throws Exception {
			System.out.println("##########"+code);
			String access_Token = service.getAccessToken(code);
			
			MemberVO userInfo = service.getUserInfo(access_Token);
			System.out.println("#####access_Token#####: " + access_Token );
			System.out.println("#####nickname####: "+ userInfo.getNickname());
			System.out.println("#####email#####: "+ userInfo.getEmail());
			System.out.println("#####member_id#####: "+ userInfo.getMember_id());
			
			
			sess.invalidate();
			// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드. 남아있는 정보가 혹시라도 있을까봐..
			sess.setAttribute("loginInfo", userInfo);
			// 위 3개의 코드는 닉네임과 이메일, 아이디를 session객체에 담는 코드
			// jsp에서 ${sessScope.kakaoN} 이런 형식으로 사용할 수 있다.
		   System.out.println("loginInfo : "+ userInfo.getMember_id());
			
			MemberVO snsCheckVo = (MemberVO)sess.getAttribute("loginInfo");
	
			MemberVO svo = service.snsCheck(snsCheckVo, sess);
			
			if(svo==null) {
				model.addAttribute("url", "/pet/member/easyJoin.do");
				return "member/easyJoin";
				
			}else {
				sess.setAttribute("loginInfo", svo);
				return "/main";
			}
	    }
	@GetMapping("/member/easyJoin.do")
	public String insertSns(HttpSession sess, @RequestParam("nickname") String nickname, MemberVO vo) {
		service.insertSns(sess, nickname);
		System.out.println("@@@@@@@@@@nickname : "+ service.nicknameCheck(nickname));
		sess.setAttribute("loginInfo", vo); //session에다가 vo를 담음
		return "/main";
	}
	@PostMapping("/member/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("member_id") String member_id) {
		int cnt = service.idCheck(member_id);
		return cnt+"";
	}
	
	@PostMapping("/member/nickname")
	@ResponseBody
	public String nicknameCheck(@RequestParam("nickname") String nickname) {
		int cnt = service.nicknameCheck(nickname);
		return cnt + "";
	}
	//이메일 중복체크 & 인증번호 보내기
	@GetMapping("/member/emailCheck.do")
	public void emailCheck(@RequestParam String email, HttpSession sess, HttpServletResponse res ) throws IOException {
		
		int cnt = service.emailCheck(email, sess);
		System.out.println("cnt: "+cnt);
		boolean r = false;
		if (cnt > 0) r = true;
		PrintWriter out = res.getWriter();
		out.print(r);
		
	}
	
	//보낸 인증번호 브라우저에서 확인
	@GetMapping("/member/Certification.do")
	public String checkCerti(@RequestParam String certi, HttpSession sess, Model model) throws IOException{
		//view로부터 넘어온 데이터 확인
		
		String certi_num = (String)sess.getAttribute("certification");
		System.out.println("certi_num : "+ certi_num);
		
		if ( certi_num.equals(certi)) {
		System.out.println("certi_num : "+ certi_num + "certi: "+certi);
		model.addAttribute("result", "true");
		}
		return "common/result";
	}
	
	@GetMapping("/member/findId.do")
	public String findId() {
		return "member/findId";
	}
	
	@PostMapping("/member/findId.do")
	public String findId(Model model, MemberVO param) {
		MemberVO vo = service.findId(param);
		if(vo != null) {
			model.addAttribute("result", vo.getMember_id());
		}
		return "common/result";
	}
	
	@GetMapping("/member/findPwd.do")
	public String findPwd(){
		return "member/findPwd";
	}
	
	@PostMapping("/member/findPwd.do")
	@ResponseBody
	public String findPwd(MemberVO param) {
		MemberVO vo = service.findPwd(param);
		if(vo != null) 

//			model.addAttribute("result", vo.getPwd()); //responseBody 있으면 안써줘도됨.
			
			return "here";
		else { 
			return null;
		}	
	}
	
	
}
