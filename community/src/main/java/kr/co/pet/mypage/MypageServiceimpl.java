package kr.co.pet.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.member.MemberVO;
import util.Criteria;
import util.Paging;

@Service
public class MypageServiceimpl implements MypageService {
	
	@Autowired
	MypageMapper mapper;
	
	@Override
	public Map friendList(MypageVO vo, Criteria cri) {
		Map map = new HashMap();
		
		// 총 친구수
		int totalCount = mapper.friendCount(vo); 
		// 친구 리스트
		List list = mapper.friendList(vo); 
		Paging pMaker = new Paging(cri, totalCount);
		map.put("totalCount", totalCount);
		map.put("list", list);
		map.put("pageMaker", pMaker);
		return map;
	}

	@Override
	public Map friReqList(MypageVO vo) {
		Map map = new HashMap();
		int totalCount = mapper.reqCount(vo);
		// 총 페이지
		
		List list  = mapper.reqList(vo);
		
		map.put("totalCount", totalCount);
		map.put("list", list);
		return map;
	}

	@Override
	public boolean friAccept(MypageVO vo) {
		return mapper.friendAccept(vo) > 0? true : false;
	}

	@Override
	public boolean friDel(MypageVO vo) {
		return mapper.memberActDel(vo) > 0? true : false;
	}

	@Override
	public MemberVO memberSelect(int member_no) {
		return mapper.memberSelect(member_no);
	}


}
