package kr.co.pet.center;

import java.util.Map;

public interface CenterService {

	Map index(CenterVO vo);
	
	boolean insert(CenterVO vo);
	
	CenterVO view(int board_no);
	
	boolean update(CenterVO vo);
}
