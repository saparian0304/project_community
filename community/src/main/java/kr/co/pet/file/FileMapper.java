package kr.co.pet.file;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper{

	public int insert(FileVO vo);
	public void delete(int file_no);
	public List<FileVO> findByBoard_no(int board_no);
	FileVO view(int Board_no);
	
	int update(FileVO vo);
	
}
