package kr.co.pet.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.member.MemberVO;

@Service
public class MypageServiceimpl implements MypageService {
	
	@Autowired
	MypageMapper mapper;
	
	
	@Override
	public Map friendList(MypageVO vo) {
		Map map = new HashMap();
		
		// 총 친구수
		int totalCount = mapper.friendCount(vo); 
		// 친구 리스트
		List list = mapper.friendList(vo); 
		map.put("totalCount", totalCount);
		map.put("list", list);
		map.put("page", vo.getPage());
		return map;
	}
	
	@Override
	public int friTotal(MypageVO vo) {
		return mapper.friendCount(vo);
	}
	
	@Override
	public int frireqTotal(MypageVO vo) {
		return mapper.reqCount(vo);
	}

	@Override
	public Map friReqList(MypageVO vo) {
		Map map = new HashMap();
		int totalCount = mapper.reqCount(vo);
		// 총 페이지
		
		List list  = mapper.reqList(vo);
		map.put("totalCount", totalCount);
		map.put("list", list);
		map.put("page", vo.getPage());
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

	@Override
	public Map myActList(MypageVO vo) {
		Map map = new HashMap();
		int totalCount = mapper.memberActCnt(vo);
		List list  = mapper.memberAct(vo);
		map.put("totalCount", totalCount);
		map.put("list", list);
		map.put("page", vo.getPage());
		return map;
	}

	@Override
	public int actTotal(MypageVO vo) {
		return mapper.memberActCnt(vo);
	}

	@Override
	public boolean actIsdel(MypageVO vo) {
		return mapper.memberActIsdel(vo) > 0? true: false;
	}

	@Override
	public Map messReadList(MypageVO vo) {
		Map map = new HashMap();
		int totalCount = mapper.messReadCnt(vo);
		List list  = mapper.messRead(vo);
		map.put("totalCount", totalCount);
		map.put("list", list);
		map.put("page", vo.getPage());
		return map;
	}

	@Override
	public int messReadTotal(MypageVO vo) {
		return mapper.messReadCnt(vo);
	}

	@Override
	public Map messSendList(MypageVO vo) {
		Map map = new HashMap();
		int totalCount = mapper.messSendCnt(vo);
		List list  = mapper.messSend(vo);
		map.put("totalCount", totalCount);
		map.put("list", list);
		map.put("page", vo.getPage());
		return map;
	}

	@Override
	public int messSendTotal(MypageVO vo) {
		return mapper.messSendCnt(vo);
	}

	@Override
	public Map bookList(MypageVO vo) {
		Map map = new HashMap();
		int totalCount = mapper.bookCnt(vo);
		List list  = mapper.bookList(vo);
		map.put("totalCount", totalCount);
		map.put("list", list);
		map.put("page", vo.getPage());
		return map;
	}

	@Override
	public int bookCnt(MypageVO vo) {
		return mapper.bookCnt(vo);
	}


}
