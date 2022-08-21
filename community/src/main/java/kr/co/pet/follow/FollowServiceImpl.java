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
	

}
