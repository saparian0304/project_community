package kr.co.pet.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
	
	int insertSelectKey(BoardVO vo);
	
	int count(BoardVO vo);
	
	List<BoardVO> list(BoardVO vo);
	
	void updateViewCount(int board_no);
	
	BoardVO view(int board_no);
	
	int delete(int board_no);
	
	int update(BoardVO vo);
}
