package kr.co.pet.center;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.pet.board.BoardVO;
import kr.co.pet.file.FileVO;

@Mapper
public interface CenterMapper {
	
	int insert(CenterVO vo);
	
	public void delete(int cent_no);
	
	public List<FileVO> findByBoard_no(int board_no);
	
	CenterVO view(int Board_no);
	
	int update(CenterVO vo);
	
	int count(CenterVO vo);
	
	List<CenterVO> list(CenterVO vo);
}
