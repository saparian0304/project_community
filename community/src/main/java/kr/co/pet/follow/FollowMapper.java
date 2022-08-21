package kr.co.pet.follow;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FollowMapper {
	
	int insert(FollowVO vo);
	
	int delete(FollowVO vo);
	
	Integer followChk(FollowVO vo);


	
}
