package kr.co.pet.file;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.pet.board.BoardVO;

@Mapper
public interface FileMapper{

	public int insert(FileVO vo);
	public void delete(int file_no);
	List<FileVO> findByBoard_no(int board_no);
	FileVO view(int Board_no);
	
	int update(FileVO vo);
	
}
