package kr.co.pet.alram;

import java.util.Map;

public interface AlramService {

	Map alramList(int member_no);
	
	int isRead(AlramVO vo);
}
