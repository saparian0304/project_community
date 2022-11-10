package kr.co.pet.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import util.SendMail;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	private int key;

	@Override
	public boolean update(MemberVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int no) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insert(MemberVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int emailCheck(String email, HttpSession sess) {
		// 이메일 중복 확인
		int cnt = mapper.emailCheck(email);
		if (cnt == 0) {
			// 인증번호발송
			// 영문3자리,숫자3자리
			String temp = "";
			for (int i = 0; i < 3; i++) {
				temp += (char) (Math.random() * 26 + 97);
			}
			for (int i = 0; i < 3; i++) {
				temp += (int) (Math.random() * 9);
			}
			sess.setAttribute("certification", temp);

			// email발송
			SendMail.sendMail("a_jin0609@naver.com", email, "[pet_community]비번test", "인증번호: " + temp + "입니다.");
		}

		return cnt;
	}

	@Override
	public boolean loginCheck(MemberVO vo, HttpSession sess) {
		boolean l = false;
		MemberVO loginInfo = mapper.loginCheck(vo);
		
		int v = mapper.visitMupdate() > 0 ? 1 : 0; // visit_count 
		
		if (loginInfo != null) {
			l = true;
			// 로그인 성공하면 세션에 저장. 로그인 한 홈페이지안에서 돌아다녀도 로그인상태 계속 유지되도록.
			sess.setAttribute("loginInfo", loginInfo);
			
			mapper.updateCurr(loginInfo); // 로그인했을때 방문날짜 update	
			
			 if( v != 1 ) { 				 
				 mapper.visitMember(loginInfo);
				 mapper.visitMupdate();// visit insert 
			 }
			 			
		}
		return l;
	}
	
	
	// boardController 비회원방문수 update count 하기위해
	@Override
	public int visitNonmUpdate() {
		MemberVO vo = new MemberVO();
		
		int i = mapper.visitNonmUpdate() > 0 ? 1: 0;			
			
		if(i !=1) {			
				mapper.visitMember(vo); // visit insert
				mapper.visitNonmUpdate();
			}		
		return i;	
	}
	
	
	@Override
	public int idCheck(String id) {
		int cnt = mapper.idCheck(id);
		System.out.println("cnt : " + cnt);
		return cnt;
	}

	@Override
	public int nicknameCheck(String nickname) {
		int cnt = mapper.nicknameCheck(nickname);
		System.out.println("nickname: " + cnt);
		return cnt;
	}

	@Override
	public MemberVO findId(MemberVO vo) {
		System.out.println("findId : " + vo);

		return mapper.findId(vo);
	}

	@Override
	public MemberVO findPwd(MemberVO vo) {
		// update
		MemberVO mv = mapper.findPwd(vo);

		if (mv != null) {
			// 임시비번생성
			// 영문3자리,숫자3자리
			String temp = "";
			for (int i = 0; i < 3; i++) {
				temp += (char) (Math.random() * 26 + 97);
			}
			for (int i = 0; i < 3; i++) {
				temp += (int) (Math.random() * 9);
			}
			// 임시비번 update
			vo.setPwd(temp);
			mapper.updateTempPwd(vo);

			System.out.println("보내는대상 : " + vo.getMember_id());
			// email발송
			SendMail.sendMail("a_jin0609@naver.com", vo.getEmail(), "[pet_community]비번test", "임시비번: " + temp + "입니다.");
			return mv;
		} else {
			return null;
		}
	}

	@Override
	public MemberVO loginBySns(MemberVO vo, HttpSession sess) {
		return mapper.loginBySns(vo);
	}

	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=559a5c15295281d3e0cf6c7390c0d790"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/pet/member/loginBySns.do"); // 본인이 설정한 주소

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	public MemberVO getUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		MemberVO userInfo = new MemberVO();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			System.out.println("id : ");

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String member_id = element.getAsJsonObject().get("id").getAsString();

//			userInfo.put("nickname", nickname);
//			userInfo.put("member_id", member_id);
//			userInfo.put("email", email);\
			userInfo.setMember_id(member_id);
			userInfo.setEmail(email);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	@Override
	public MemberVO snsCheck(MemberVO vo, HttpSession sess) {

		MemberVO user = new MemberVO();

		  user.setMember_id(vo.getMember_id());
		  user.setEmail(vo.getEmail());
		  user.setNickname(vo.getNickname());
		 
		MemberVO result = mapper.snsCheck(user);
		sess.setAttribute("result", user);
		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
		/*
		 * System.out.println("######S:" + result.getEmail());
		 * System.out.println("######SSS:"+ user.getMember_id());
		 */
		if (result == null) {
			return null;
			
		} else {
			return result;
			// 정보가 이미 있기 때문에 result를 리턴함.
		}
	}

	@Override
	public int insertSns(HttpSession sess, String nickname) {
		MemberVO vo = (MemberVO)sess.getAttribute("result");
		System.out.println("받는중? : "+vo.getEmail());
		vo.setNickname(nickname);
		
		System.out.println("###############nickname : "+ vo.getNickname());
		return mapper.insertSns(vo);
	}

	

	

}