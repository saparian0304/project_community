package kr.co.pet.mypage;

import java.util.Map;

public interface MypageService {
	// 친구 리스트 호출
	Map friendList(MypageVO vo);
	// 친구 요청 목록
	Map friReqList(MypageVO vo);
	// 친구 수락
	boolean friAccept(MypageVO vo);
	// 친구 삭제
	boolean friDel(MypageVO vo);
}
