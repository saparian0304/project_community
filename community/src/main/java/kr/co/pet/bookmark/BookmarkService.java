package kr.co.pet.bookmark;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.pet.board.BoardVO;

public interface BookmarkService {

	boolean bookmark(BoardVO vo);
	boolean bookmarked(BoardVO vo, HttpSession sess);
	int getBookmarkCnt(BoardVO vo);
	public Map getMemberBookmarkTotal(BookMarkVO vo);
}
