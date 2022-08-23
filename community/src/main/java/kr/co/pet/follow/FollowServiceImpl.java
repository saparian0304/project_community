package kr.co.pet.follow;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.member.MemberVO;

@Service
public class FollowServiceImpl implements FollowService {

	@Autowired
	FollowMapper mapper;
	
	
	// 팔로우
	@Override
	public int insert(FollowVO vo) {
		
		Integer e = mapper.followChk(vo);
		if(e ==null || e == 0) {
			return mapper.insert(vo);
		}
		else {
			return mapper.delete(vo);
		}
	}


	// 차단
	@Override
	public int blockInsert(FollowVO vo) {
		
		Integer i = mapper.blockChk(vo);
		Integer e = mapper.followChk(vo);
		if(i == null || i == 0 || e != 0) {
			mapper.delete(vo);
			return mapper.blockInsert(vo);
		}		
		else {
			return mapper.blockDel(vo);			
		}
	}
	

}
