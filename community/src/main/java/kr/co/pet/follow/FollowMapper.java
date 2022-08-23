package kr.co.pet.follow;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FollowMapper {
	
	// 팔로우
	int insert(FollowVO vo);
	
	int delete(FollowVO vo);
	
	Integer followChk(FollowVO vo);
	
	// 차단
	Integer blockChk(FollowVO vo);
	
	int blockInsert(FollowVO vo);
	
	int blockDel(FollowVO vo);
	
	int blockUP(FollowVO vo);

	
}
