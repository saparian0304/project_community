package kr.co.pet.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper mapper;
	
	@Override
	public Map list(AdminBoardVO vo) {
		Map map = new HashMap();
		
		// 총 게시물
		int totalCount = mapper.count(vo);
				
		//게시물 리스트
		System.out.println(vo.getNickname());
		List list = mapper.list(vo);
		map.put("totalCount", totalCount);
		map.put("page", vo.getPage());
		map.put("list", list);
		return map;
	}

	
	// 회원관리용입니다
	public Map memberList(AdminMemberVO vo) {
		Map map = new HashMap();
		List list = mapper.memberList(vo);
		int totalCount = mapper.memberCnt(vo);
		map.put("totalCount", totalCount);
		map.put("list", list);
		map.put("page", vo.getPage());
		return map;
	}

	@Override
	public int memberCnt(AdminMemberVO vo) {
		return mapper.memberCnt(vo);
	}


	@Override
	public Map replyList(AdminReplyVO vo) {
		Map map = new HashMap();
		List list = mapper.replyList(vo);
		
		int totalCount = mapper.replyCnt(vo);

		map.put("totalCount", totalCount);
		map.put("page", vo.getPage());
		map.put("list", list);

		return map;
		
	}

	// 방문자
	@Override
	public Map todayTotalCnt(AdminBoardVO vo) {
		Map map = new HashMap();
		
		AdminBoardVO vt =mapper.visitToday(vo);		
		Integer boardToday = mapper.boardToday(vo);
		Integer replyToday = mapper.replyToday(vo);
		
		map.put("boardToday", boardToday);
		map.put("replyToday", replyToday);
		map.put("vt",vt);
		return map;
	}

}
