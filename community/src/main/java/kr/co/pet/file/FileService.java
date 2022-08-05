package kr.co.pet.file;

import java.util.Map;

public interface FileService {
//	//목록
//	Map index(FileVO vo);
//	
	//등록처리?
	boolean insert(FileVO vo);
	
	FileVO view(int board_no);
	
	boolean update(FileVO vo);
}
