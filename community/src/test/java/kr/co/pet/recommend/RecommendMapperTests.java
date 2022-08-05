package kr.co.pet.recommend;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RecommendMapperTests {

	@Autowired
	private RecommendMapper mapper;

//	@Test
	public void testObj() {
		log.info(mapper);
	}
	
//	@Test
	public void testInsert() {
		RecommendVO vo = new RecommendVO();
		vo.setMember_no(1);
		vo.setReply_no(3);
		vo.setBoard_no(1);
//		mapper.insertRec(vo);
		
		
	}
//	@Test
	public void testcancle() {
		RecommendVO vo = new RecommendVO();
		vo.setRec_no(12);
		int r = mapper.cancleRec(vo);
		log.info(r);
		
	}
	
}
