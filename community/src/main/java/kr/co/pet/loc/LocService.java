package kr.co.pet.loc;

import java.util.Map;

public interface LocService {

	boolean insert(LocVO vo);
	
	LocVO view(int board_no);
	
	//수정폼
	LocVO edit(int board_no);
		
		//수정처리
	boolean update(LocVO vo);
	
}
