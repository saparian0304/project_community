package kr.co.pet.report;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReportMapperTests {

	@Autowired
	private ReportMapper mapper;

//	@Test
	public void testObj() {
		log.info(mapper);
	}
	
//	@Test
	public void testInsert() {
		ReportVO vo = new ReportVO();
		vo.setI_no(3);
		vo.setYou_no(1);
		vo.setReason(1);
		vo.setContent("욕설");
		vo.setBoard_no(3);
		vo.setReply_no(2);
		mapper.report(vo);
		
	}
//	@Test
	public void testcancle() {
	}
	
}
