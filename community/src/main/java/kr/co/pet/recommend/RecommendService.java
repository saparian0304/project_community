package kr.co.pet.recommend;

import java.util.List;
import java.util.Map;

public interface RecommendService {

	boolean recommend(RecommendVO vo);
	int getRecCnt(RecommendVO vo);
	public Map getMemberRecTotal(RecommendVO vo);
}
