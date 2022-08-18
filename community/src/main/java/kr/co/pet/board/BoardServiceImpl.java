package kr.co.pet.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.file.FileMapper;
import kr.co.pet.file.FileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardMapper mapper;
	@Autowired
	FileMapper fmapper;
	
	
	@Override
	public Map index(BoardVO vo) {
		Map map = new HashMap();
		
		// 총 게시물
		int totalCount = mapper.count(vo);
				
		//게시물 리스트
		List list = mapper.list(vo);
		map.put("totalCount", totalCount);
		map.put("page", vo.getPage());
		map.put("list", list);
		
		return map;
	}
	
	
	@Override
	public Map freeindex(BoardVO vo) {
		vo.setBoard_name("free");
		List<BoardVO> list = mapper.list(vo);
		// 총 게시물
		int totalCount = mapper.count(vo);
		
		Map map = new HashMap();
		//게시물 리스트
		List list = mapper.list(vo);
		map.put("totalCount", totalCount);
		map.put("page", vo.getPage());
		map.put("list", list);
		
		return map;
	}
	@Override
	public Map liveindex(BoardVO vo) {
		vo.setBoard_name("live");
		
		int totalCount = mapper.count(vo); // 총게시물수
		
		Map map = new HashMap();
		
		// 총 게시물
		int totalCount = mapper.count(vo);
		
		//게시물 리스트
		List list = mapper.list(vo);
		map.put("totalCount", totalCount);
		map.put("page", vo.getPage());
		map.put("list", list);
		
		return map;
	}
	

	@Override
	public boolean insert(BoardVO vo) {
		return mapper.insertSelectKey(vo) > 0 ? true : false;
	}

	@Override
	public BoardVO view(int board_no) {
		mapper.updateViewCount(board_no);
		return mapper.view(board_no);
	}
	
	@Override
	public boolean delete(int board_no) {
		return mapper.delete(board_no) > 0 ? true : false;
	}

	@Override
	public BoardVO edit(int board_no) {
		return mapper.view(board_no);
	}

	@Override
	public boolean update(BoardVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}


	@Override
	public int indexTotal(BoardVO vo) {
		return mapper.count(vo);
	}

}
