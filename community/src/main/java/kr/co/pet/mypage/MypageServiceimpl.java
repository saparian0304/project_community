package kr.co.pet.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceimpl implements MypageService {
	
	@Autowired
	MypageMapper mapper;
	
	@Override
	public Map friendList(MypageVO vo) {
		Map map = new HashMap();
		
		// 총 친구수
		int totalCount = mapper.friendCount(vo); 
		// 총 페이지
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) totalPage++;
		if (totalPage == 0) totalPage = 1;
		
		// 시작인덱스
		int startIdx = (vo.getPage() - 1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		
		// 페이징
		int temp = vo.getPage() / vo.getPageRow();
		if (vo.getPage() % vo.getPageRow() > 0) temp++;
		int endPage = temp * vo.getPageRow();
		int startPage = endPage - (vo.getBlockSize() - 1);
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage > totalPage ? true : false;
		
		// 친구 리스트
		List list = mapper.friendList(vo); 
		
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("page", vo.getPage());
		map.put("list", list);
		return map;
	}

	@Override
	public Map friReqList(MypageVO vo) {
		Map map = new HashMap();
		int totalCount = mapper.reqCount(vo);
		// 총 페이지
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) totalPage++;
		if (totalPage == 0) totalPage = 1;
		// 시작인덱스
		int startIdx = (vo.getPage() - 1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		
		// 페이징
		int temp = vo.getPage() / vo.getPageRow();
		if (vo.getPage() % vo.getPageRow() > 0) temp++;
		int endPage = temp * vo.getPageRow();
		int startPage = endPage - (vo.getBlockSize() - 1);
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage > totalPage ? true : false;
		
		List list  = mapper.reqList(vo);
		
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("page", vo.getPage());
		map.put("list", list);
		return map;
	}

	@Override
	public boolean friAccept(MypageVO vo) {
		return mapper.friendAccept(vo) > 0? true : false;
	}


}
