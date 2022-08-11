package kr.co.pet.mypage;

import java.util.Map;

import kr.co.pet.member.MemberVO;

public interface MypageService {
	// 친구 리스트 호출
	Map friendList(MypageVO vo);
	// 친구 리스트 수
	int friTotal(MypageVO vo);
	// 친구 요청 목록
	Map friReqList(MypageVO vo);
	// 친구 리스트 수
	int frireqTotal(MypageVO vo);
	// 친구 수락
	boolean friAccept(MypageVO vo);
	// 친구 삭제
	boolean friDel(MypageVO vo);
	
	// 내 정보 테이블
	MemberVO memberSelect(int member_no);
	
	// 내 활동 내역
	Map myActList(MypageVO vo);
	int actTotal(MypageVO vo);
	// 활동내역 삭제(isdelete)
	boolean actIsdel(MypageVO vo);
}
