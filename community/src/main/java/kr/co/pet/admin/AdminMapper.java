package kr.co.pet.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.pet.board.BoardVO;
import kr.co.pet.member.MemberVO;

@Mapper
public interface AdminMapper {
	
	List<BoardVO> list(AdminBoardVO vo);
	int count(AdminBoardVO vo);
	
	// admin 로그인
	AdminMemberVO loginCheck(AdminMemberVO vo);
	int idCheck(String id);
	int insert(AdminMemberVO vo);
	List adminList(AdminMemberVO vo);
	int adminCnt(AdminMemberVO vo);
	int defalutPwd(AdminMemberVO vo);
	
	// 회원관리
	List memberList(AdminMemberVO vo);
	int memberCnt(AdminMemberVO vo);
	
	//댓글관리 - 박 -
	List replyList(AdminReplyVO vo);
	int replyCnt(AdminReplyVO vo);
	
	// 통계 count
	AdminBoardVO visitToday(AdminBoardVO vo);
	Integer boardToday(AdminBoardVO vo);
	Integer replyToday(AdminBoardVO vo);
	
	AdminBoardVO current(AdminBoardVO vo);
	
}
