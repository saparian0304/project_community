package kr.co.pet.file;

import java.util.List;
import java.util.Map;

public interface FileService {
	//등록처리?
	boolean insert(FileVO vo);
	
	FileVO view(int board_no);
	
	List find(int board_no);
	//수정폼
	FileVO edit(int board_no);
	
	//수정처리
	boolean update(FileVO vo);
	
}
