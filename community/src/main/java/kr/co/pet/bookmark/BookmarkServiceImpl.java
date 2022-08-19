package kr.co.pet.bookmark;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.board.BoardVO;
import kr.co.pet.member.MemberVO;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired
	BookmarkMapper	mapper;
	
	/**
	 * true면 북마크, false는 북마크 해제
	 */
	@Override
	public boolean bookmark(BoardVO vo) {
		boolean result = false;
		if (mapper.bookmarked(vo) == 0) {
			mapper.bookmark(vo);
			result = true;
		} else {
			mapper.cancleBookmark(vo);
		}
		return result;
	}
	
	/**
	 * 북마크 여부 확인
	 */
	@Override
	public boolean bookmarked(BoardVO vo, HttpSession sess) {
		MemberVO mvo = (MemberVO)sess.getAttribute("loginInfo");
		boolean flag = false;
		if(mvo != null) {
			vo.setMember_no(mvo.getMember_no());
			if (mapper.bookmarked(vo) > 0)
				flag = true;
		}
		return flag;
	}

	/**
	 * 게시글의 북마크 수 카운트
	 */
	@Override
	public int getBookmarkCnt(BoardVO vo) {
		return mapper.getBookmarkCnt(vo);
	}

	/**
	 * 회원의 북마크 통계
	 * list : 북마크 리스트, count : 북마크 수
	 */
	@Override
	public Map<String, Object> getMemberBookmarkTotal(BookMarkVO vo) {
		Map<String, Object> map = new HashMap();
		map.put("list", mapper.getBookmarkList(vo));
		map.put("count", mapper.getMemberBookmarkCnt(vo));
		return map;
	}


}
