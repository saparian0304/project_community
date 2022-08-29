package kr.co.pet.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	MemberVO loginBySns(MemberVO vo);
	MemberVO snsCheck(MemberVO userInfo); //괄호안에 parameterType, 메서드앞이 resultType
	int insertSns(MemberVO userInfo);
	
	int updateCurr(MemberVO vo); // 방문날짜 update
	
	int visit(MemberVO vo); // 방문 insert
	
	int visitUpdate(); // 방문 update

}
