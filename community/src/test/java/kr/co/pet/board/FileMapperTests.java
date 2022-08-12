package kr.co.pet.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.pet.board.BoardVO;
import kr.co.pet.file.FileMapper;
import kr.co.pet.file.FileVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FileMapperTests {

	@Autowired
	private FileMapper mapper;

	@Test
	public void testInsert() {
		FileVO file = new FileVO();
		file.setFilename_org("ddd");
		file.setFilename_real("ddd");
		
		int r = mapper.insert(file);
		
		log.info(r);
	}
	
	//@Test
	public void testList() {
		BoardVO vo = new BoardVO();
	}
	
//	//@Test
//	public void testObj2() {
//		BoardVO vo = new BoardVO();
//		vo.setTitle("안녕하세여");
//		vo.setContent("내용");
//		int r = 0;
//		for(int i=0; i <20; i++) {
//			r +=mapper.insert(vo); 
//		}
//		log.info("등록갯수: " + r);
//	}
	
	
	
}
