package kr.co.pet.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.member.MemberVO;

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

	
	// 관리자 관리용
	public Map adminList(AdminMemberVO vo) {
		Map map = new HashMap();
		List list = mapper.adminList(vo);
		int totalCount = mapper.adminCnt(vo);
		map.put("totalCount", totalCount);
		map.put("list", list);
		map.put("page", vo.getPage());
		return map;
	}
	
	@Override
	public int defalutPwd(AdminMemberVO vo) {
		return mapper.defalutPwd(vo);
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


	@Override
	public boolean loginCheck(AdminMemberVO vo, HttpSession sess) {
		boolean flag = false;
		AdminMemberVO adminInfo = mapper.loginCheck(vo);
		
		if (adminInfo != null) {
			flag = true;
			sess.setAttribute("adminInfo", adminInfo);
			
		}
		return flag;
	}

	@Override
	public int idCheck(String id) {
		int cnt = mapper.idCheck(id);
		System.out.println("cnt : " + cnt);
		return cnt;
	}
	
	@Override
	public int insert(AdminMemberVO vo) {
		return mapper.insert(vo);
	}


	
	// today 방문수 , 게시글 , 가입 , 멤버 출석
	@Override
	public Map todayTotalCnt(AdminBoardVO vo) {
		Map map = new HashMap();
		
		AdminBoardVO vt = mapper.visitToday(vo); 	// 회원, 비회원 방문수
		AdminBoardVO cur = mapper.current(vo);		// 가입, 방문한 멤버수
		Integer boardToday = mapper.boardToday(vo); // 게시글 수
		Integer replyToday = mapper.replyToday(vo); // 댓글 수 
		
		map.put("boardToday", boardToday);
		map.put("replyToday", replyToday);
		map.put("vt",vt);
		map.put("cur", cur);
		return map;
	}

}
