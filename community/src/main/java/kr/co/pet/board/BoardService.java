package kr.co.pet.board;

import java.util.Map;

public interface BoardService {
	//목록
	
	Map index(BoardVO vo);
	Map freeindex(BoardVO vo);
	Map liveindex(BoardVO vo);
	Map centerindex(BoardVO vo);
	
	//등록처리?
	boolean insert(BoardVO vo);
	
	BoardVO view(int board_no);
	
	boolean delete(int board_no);
	
	//수정폼
	BoardVO edit(int board_no);

	//수정처리
	boolean update(BoardVO vo);
	
	int indexTotal(BoardVO vo);
	

}
