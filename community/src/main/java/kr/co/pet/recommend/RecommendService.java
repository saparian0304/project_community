package kr.co.pet.recommend;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface RecommendService {

	boolean recommend(RecommendVO vo);
	Map recommend(int board_no, int reply_no, HttpSession sess);
	int getRecCnt(RecommendVO vo);
	public Map getMemberRecTotal(RecommendVO vo);
}
