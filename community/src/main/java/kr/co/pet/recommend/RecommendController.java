package kr.co.pet.recommend;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.pet.member.MemberVO;

@Controller
public class RecommendController {

	@Autowired
	RecommendService service;
	
	/**
	 * 좋아요 클릭시 등록/해제 기능
	 * 
	 * @param vo RecommendVO - board_no, reply_no, member_no
	 * @return 좋아요 수(recommendCount), 좋아요 여부(recommended) 반환
	 */
	@ResponseBody
	@RequestMapping(value="recommend/recommend.do" )
	public RecommendVO recommend(RecommendVO vo, Model model, HttpSession sess) {
		MemberVO loginInfo = (MemberVO)sess.getAttribute("loginInfo");
		RecommendVO rvo = new RecommendVO();

		if (loginInfo != null) {
			vo.setMember_no(loginInfo.getMember_no());
			rvo.setRecommended(service.recommend(vo));
			rvo.setRecommendCount(service.getRecCnt(vo));
			rvo.setReply_no(vo.getReply_no());
		}
		return rvo;
	}
	
	/**
	 * 좋아요 수 리턴 (타입 int)
	 * @param vo RecommendVO - board_no, reply_no
	 * @param model
	 * @return 좋아요 수 리턴
	 */
	@ResponseBody
	@RequestMapping(value="recommend/count.do")
	public int count(@RequestBody RecommendVO vo, Model model) {
		return service.getRecCnt(vo);
	}
	
	/**
	 * 회원 좋아요 통계수치 리턴
	 * @param vo RecommendVO - member_no
	 * @return 좋아요 총 횟수, 좋아요 리스트(글/댓글)
	 */
	@ResponseBody
	@RequestMapping("recommend/member.do")
	public Map memberTotal(RecommendVO vo) {
		return service.getMemberRecTotal(vo);
	}
}
