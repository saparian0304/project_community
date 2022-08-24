package kr.co.pet.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.pet.member.MemberVO;

@Mapper
public interface MypageMapper {
	
	// 회원정보테이블
	MemberVO memberSelect(int member_no);
	// 내 정보 수정 눌렀을 때 패스워드 확인
	int pwdCheck(MypageVO vo);
	// 회원정보수정(닉네임, 비밀번호, 주소)
	int memberUpdate(MypageVO vo);

	// 내 활동내역(게시글, 댓글, 북마크)
	List memberAct(MypageVO vo);
	int memberActCnt(MypageVO vo);
	
	// 쪽지
	List messRead(MypageVO vo);
	int messReadCnt(MypageVO vo);
	List messSend(MypageVO vo);
	int messSendCnt(MypageVO vo);
	
	// 북마크
	List bookList(MypageVO vo);
	int bookCnt(MypageVO vo);
	
	// 선택 업데이트 isdelete 
	int memberActIsdel(MypageVO vo);
	// 선택 삭제 delete 
	int memberActDel(MypageVO vo);
	
	// 친구요청
	int friendReq(MypageVO vo);
	// 친구 요청 목록 (닉네임, 신청일자 desc)
	List reqList(MypageVO vo);
	int reqCount(MypageVO vo);
	// 친구 승인
	int friendAccept(MypageVO vo);
	// 친구 목록 (닉네임, 닉네임 asc)
	List friendList(MypageVO vo);
	int friendCount(MypageVO vo);
	Integer findFriNo(MypageVO vo);
	
	Integer findFriNo(MypageVO vo);
	
	// 팔로우 목록
	List followList(MypageVO vo);
	int followCount(MypageVO vo);
	
	
	// 차단 목록
	List blockList(MypageVO vo);
	int blockCount(MypageVO vo);
	
}
