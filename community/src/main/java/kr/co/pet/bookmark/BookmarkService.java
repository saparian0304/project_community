package kr.co.pet.bookmark;

import java.util.List;
import java.util.Map;

public interface BookmarkService {

	boolean bookmark(BookMarkVO vo);
	int getBookmarkCnt(BookMarkVO vo);
	public Map getMemberBookmarkTotal(BookMarkVO vo);
}
