package kr.co.pet.recommend;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	RecommendMapper	mapper;
	
	/**
	 * true면 좋아요, false는 좋아요 해제
	 */
	@Override
	public boolean recommend(RecommendVO vo) {
		boolean result = false;
		if (mapper.isRecommended(vo) == 0) {
			mapper.recommend(vo);
			result = true;
		} else {
			mapper.cancleRec(vo);
		}
		return result;
	}

	/**
	 * 게시글 / 댓글의 좋아요 수를 리턴
	 */
	@Override
	public int getRecCnt(RecommendVO vo) {
		return mapper.getRecCnt(vo);
	}

	/**
	 * 멤버별 좋아요 통계
	 */
	@Override
	public Map<String, Object> getMemberRecTotal(RecommendVO vo) {
		Map<String, Object> map = new HashMap();
		map.put("list", mapper.getMemberRecTotalList(vo));
		map.put("boardList", mapper.getMemberRecBoardList(vo));
		map.put("replyList", mapper.getMemberRecReplyList(vo));
		map.put("totalCnt", mapper.getMemberRecTotalCnt(vo));
		map.put("boardCnt", mapper.getMemberRecBoardCnt(vo));
		map.put("replyCnt", mapper.getMemberRecReplyCnt(vo));
		return map;
	}


}
