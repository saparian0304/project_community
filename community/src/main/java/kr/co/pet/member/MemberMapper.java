package kr.co.pet.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	int insert(MemberVO vo);
	int count(MemberVO vo);
	List<MemberVO> list(MemberVO vo);
	int update(MemberVO vo);
	int delete(int no);
	int idCheck(String id);
	int nicknameCheck(String nickname);
	int emailCheck(String email);
	MemberVO loginCheck(MemberVO vo);
	MemberVO findId(MemberVO vo);
	MemberVO findPwd(MemberVO vo);
	int updateTempPwd(MemberVO vo);
}
