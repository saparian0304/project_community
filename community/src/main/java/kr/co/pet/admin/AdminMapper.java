package kr.co.pet.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.pet.board.BoardVO;

@Mapper
public interface AdminMapper {
	
	List<BoardVO> list(AdminBoardVO vo);
	int count(AdminBoardVO vo);
	
	// 회원관리
	List memberList(AdminMemberVO vo);
	int memberCnt(AdminMemberVO vo);
}
