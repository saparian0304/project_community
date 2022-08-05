package kr.co.pet.file;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.board.BoardMapper;
import kr.co.pet.board.BoardVO;


@Service
public class FileServiceImpl implements FileService{
	@Autowired
	FileMapper mapper;

	@Override
	public FileVO view(int board_no) {
		mapper.findByBoard_no(board_no);
		return mapper.view(board_no);
	}
	
	@Override
	public boolean insert(FileVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}

	@Override
	public boolean update(FileVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}

	
//	@Override
//	public Map index(BoardVO vo) {
//		int totalCount = mapper.count(vo); // 총게시물수
//		// 총페이지수
//		int totalPage = totalCount / vo.getPageRow();
//		if (totalCount % vo.getPageRow() > 0) totalPage++;
//		
//		// 시작인덱스
//		int startIdx = (vo.getPage()-1) * vo.getPageRow();
//		vo.setStartIdx(startIdx);
//		List<BoardVO> list = mapper.list(vo);
//		
//		// 페이징처리
//		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*10);
//		int startPage = endPage-9;
//		if (endPage > totalPage) endPage = totalPage;
//		boolean prev = startPage > 1 ? true : false;
//		boolean next = endPage < totalPage ? true : false;
//		
//		Map map = new HashMap();
//		map.put("totalCount", totalCount);
//		map.put("totalPage", totalPage);
//		map.put("startPage", startPage);
//		map.put("endPage", endPage);
//		map.put("prev", prev);
//		map.put("next", next);
//		map.put("list", list);
//		
//		return map;
//	}
//
//
//	@Override
//	public BoardVO view(int board_no) {
//		mapper.updateViewCount(board_no);
//		return mapper.view(board_no);
//	}

}
