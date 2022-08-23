package kr.co.pet.follow;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface FollowService {	
	
	//팔로우
	int insert(FollowVO vo);
	
	// 차단
	int blockInsert(FollowVO vo);
		
	
}
