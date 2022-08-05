package kr.co.pet.bookmark;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired
	BookmarkMapper	mapper;
	
	/**
	 * true면 북마크, false는 북마크 해제
	 */
	@Override
	public boolean bookmark(BookMarkVO vo) {
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
	 * 게시글의 북마크 수 카운트
	 */
	@Override
	public int getBookmarkCnt(BookMarkVO vo) {
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
