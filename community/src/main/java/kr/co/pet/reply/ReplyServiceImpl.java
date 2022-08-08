package kr.co.pet.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;
	
	@Override
	public Map index(ReplyVO vo) {
		
		int replyCount = mapper.rcount(vo);
		int totalCount = mapper.count(vo); // 총게시물수
		// 총페이지수
		int totalPage = totalCount / vo.getPageRow(); //->기본 10;		
		if(totalCount % vo.getPageRow() > 0) totalPage++; 
	 
	
		// 시작인덱스
		
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx); // vo 주입
		
		List<ReplyVO> list = mapper.list(vo); //list 호출
		List<ReplyVO> replyList = mapper.replyList(vo);
		// 페이징처리										// 번호가 최대나오는거
		int endPage = (int)(Math.ceil(vo.getPage()/10.0) * 10);
		int startPage = endPage-9; 
							// 뺀다음 대입
		if(endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false; // 1보다 크면 true, 아님 false
		boolean next = endPage < totalPage ? true : false; 	
		
		
		
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		map.put("replyList", replyList);
		map.put("replyCount", replyCount);
		
		
		return map;
	}

	@Override
	public int insert(ReplyVO vo) {
		int i = mapper.insert(vo) > 0 ? 1 : 0;	
		
		if (i == 1) mapper.gnoUpdate(vo.getNo());		
		
		return  i;
		
		//return mapper.insert(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		return mapper.update(vo.getNo());
		
	}
	
	
	@Override
	public int reply(ReplyVO vo) {
		vo.setOno(mapper.rcount(vo)+1);
		return mapper.reply(vo);
		
	}

	

	



	

}
