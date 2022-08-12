package kr.co.pet.chat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.pet.member.MemberVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChatMapperTests {

	
	@Autowired
	private ChatMapper mapper;
	private ChatService service;
	
//	@Test
	public void entryTest() {
		MemberVO vo = new MemberVO();
		vo.setMember_no(1);
		List<LinkedHashMap> list = mapper.friendList(1);
		for (Map map : list) {
			
			System.out.println("###########################");
			System.out.println(map.get("nickname"));
			System.out.println(map.get("name"));
			System.out.println(map.get("member_id"));
			System.out.println("###########################");
		}
	}
	
	@Test
	public void Test() {
		MemberVO vo = new MemberVO();
		vo.setMember_no(1);
//		List<LinkedHashMap> list = mapper.listInfo(1);
//		for (Map map : list) {
//			
//			System.out.println("###########################");
//			System.out.println(map.get("nickname"));
//			System.out.println(map.get("name"));
//			System.out.println(map.get("member_id"));
//			System.out.println("###########################");
//		}
	}
	
}
