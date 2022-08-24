package kr.co.pet.follow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.mypage.MypageMapper;
import kr.co.pet.mypage.MypageVO;

@Service
public class FollowServiceImpl implements FollowService {

	@Autowired
	FollowMapper mapper;
	
	@Autowired
	MypageMapper mymapper;  // 차단시 친구도 같이 삭제하기 위해 
	
	
	// 팔로우
	@Override
	public int insert(FollowVO vo) {
		
		Integer e = mapper.followChk(vo);
		if(e ==null || e == 0) {
			return mapper.insert(vo);
		}
		else {
			return mapper.delete(vo);
		}
	}


	// 차단
	@Override
	public int blockInsert(FollowVO vo) {
		
		Integer i = mapper.blockChk(vo);
		Integer e = mapper.followChk(vo); // follow 되어있음 삭제하기 위해
		
		MypageVO m = new MypageVO(); // 친구등록되어있음 삭제하기 위해
		
		m.setYou_no(vo.getYou_no()); 
		m.setI_no(vo.getI_no());		
		
		if(i == null || i == 0 || e != 0) {
		// 친구등록되어있음 삭제
			if (mymapper.findFriNo(m) != null) {
				m.setSelect_no(mymapper.findFriNo(m));
				m.setTable_name("friend");
				mymapper.memberActDel(m); 			
			}
		
		// follow 되어있음 삭제
			mapper.delete(vo);                 
			
			return mapper.blockInsert(vo);
		}		
		else {
			return mapper.blockDel(vo);			
		}
	}
	

}
