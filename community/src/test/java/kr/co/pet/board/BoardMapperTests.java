package kr.co.pet.board;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.pet.file.FileMapper;
import kr.co.pet.file.FileVO;
import kr.co.pet.loc.LocMapper;
import kr.co.pet.loc.LocVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper mapper;
	@Autowired
	private FileMapper fmapper;
	@Autowired
	private LocMapper lmapper;

	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setBoard_name("aaa");
		board.setTitle("bbb");
		
		int rowCount = mapper.insertSelectKey(board);
		int board_no = board.getBoard_no();
//		int r = mapper.insertSelectKey(board);
//		board.setBoard_no(r);
		//log.info(r);
//		log.info(mapper.insertSelectKey(board));
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("board_no", mapper.insertSelectKey(board));
		
		FileVO file = new FileVO();
		file.setBoard_no(board_no);
		file.setFilename_org("ccc");
		file.setFilename_real("ddd");
		fmapper.insert(file);
		
		LocVO loc = new LocVO();
		loc.setBoard_no(board_no);
		loc.setAddr("대림");
		lmapper.insert(loc);
		log.info(file);
		log.info(loc);
	}
	
	//@Test
	public void testList() {
		BoardVO vo = new BoardVO();
	}
	
	//@Test
	public void testObj2() {
		BoardVO vo = new BoardVO();
		vo.setTitle("안녕하세여");
		vo.setContent("내용");
		int r = 0;
		for(int i=0; i <20; i++) {
			//r +=mapper.insert(vo); 
		}
		log.info("등록갯수: " + r);
	}
	
	//@Test
	public void testUpdate(BoardVO vo, FileVO fvo) {
		vo.setBoard_no(1);
		vo.setBoard_name("shon");
		vo.setTitle("one");
		fvo.setFilename_org("joo");
		fvo.setFilename_real("jooo");
		
		log.info("update : "+mapper.update(vo));
	}
	
	
	
}
