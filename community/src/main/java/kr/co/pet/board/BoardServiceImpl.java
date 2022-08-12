package kr.co.pet.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.file.FileMapper;
import kr.co.pet.file.FileVO;


@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardMapper mapper;
	@Autowired
	FileMapper fmapper;
	
	@Override
	public Map index(BoardVO vo) {
		int totalCount = mapper.count(vo); // 총게시물수
		// 총페이지수
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) totalPage++;
		
		// 시작인덱스
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<BoardVO> list = mapper.list(vo);
		
		// 페이징처리
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*10);
		int startPage = endPage-9;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true : false;
		
//		String ani = "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171541001.jpg";
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
//		map.put("ani", ani);
		
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

}
