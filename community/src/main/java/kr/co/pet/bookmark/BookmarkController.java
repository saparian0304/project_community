package kr.co.pet.bookmark;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.pet.board.BoardVO;
import kr.co.pet.member.MemberVO;

@Controller
public class BookmarkController {

	@Autowired
	BookmarkService service;
	
	/**
	 * 북마크 등록/해제
	 * @param vo BookMarkVO - board_no, member_no
	 * @return 북마크 수(BookmarkCount), 북마크 여부(Bookmarked) 반환
	 */
	@ResponseBody
	@RequestMapping(value="bookmark/bookmark.do")
	public BookMarkVO recommend(BoardVO vo, HttpSession sess) {
		MemberVO mvo = (MemberVO)sess.getAttribute("loginInfo");
		BookMarkVO bvo = new BookMarkVO();
		if(mvo != null) {
			bvo.setMember_no(mvo.getMember_no());
			bvo.setBookmarked(service.bookmark(vo));
			bvo.setBookmarkCount(service.getBookmarkCnt(vo));
		}
		return bvo;
	}
	/**
	 * 북마크 수 리턴 (타입 int)
	 * @param vo BookMarkVO - board_no
	 * @param model
	 * @return 북마크 수 리턴
	 */
	@ResponseBody
	@RequestMapping(value="bookmark/count.do")
	public int count(@RequestBody BoardVO vo) {
		return service.getBookmarkCnt(vo);
	}
	
	/**
	 * 회원 북마크 통계수치 리턴
	 * @param vo BookMarkVO - member_no
	 * @return 북마크 총 횟수, 북마크 리스트
	 */
	@ResponseBody
	@RequestMapping("bookmark/member.do")
	public Map memberTotal(@RequestBody BookMarkVO vo) {
		return service.getMemberBookmarkTotal(vo);
	}
}
