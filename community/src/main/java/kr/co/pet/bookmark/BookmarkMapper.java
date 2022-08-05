package kr.co.pet.bookmark;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookmarkMapper {

	/**
	 * 북마크 여부를 파악
	 * 
	 * @param vo BookmarkVO - member_no, board_no
	 * @return  
	 */
	int bookmarked(BookMarkVO vo);
	
	/**
	 * 북마크 생성
	 * @param vo RecommendVO -  member_no, board_no
	 * @return int
	 */
	int bookmark(BookMarkVO vo);		

	/**
	 * 북마크 해제
	 * @param vo RecommendVO -  member_no, board_no
	 * @return int
	 */
	int cancleBookmark(BookMarkVO vo);
	
	/**
	 * 게시글의 북마크 수 카운트  
	 * @param vo RecommendVO - board_no
	 * @return int
	 */
	int getBookmarkCnt(BookMarkVO vo);
	
	/**
	 * 회원의 북마크 수 카운트  
	 * @param vo RecommendVO - member_no
	 * @return int
	 */
	int getMemberBookmarkCnt(BookMarkVO vo);
	
	/**
	 * 회원의 북마크 리스트
	 * @param vo RecommendVO
	 * @return int
	 */
	List<BookMarkVO> getBookmarkList(BookMarkVO vo); // 통계용
}
