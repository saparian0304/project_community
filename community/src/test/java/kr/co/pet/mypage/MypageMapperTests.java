package kr.co.pet.mypage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MypageMapperTests {

	
	@Autowired
	private MypageMapper mapper;

	@Test
	public void insertTest() {
		MypageVO vo = new MypageVO();
		vo.setI_no(21);
		vo.setYou_no(1);
		int i = mapper.friendReq(vo);
		log.info("insert count : " + vo);
	}
	
}
