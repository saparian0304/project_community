package kr.co.pet.loc;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LocMapper {
	
	int insert(LocVO vo);
	public void delete(int loc_no);
	public List<LocVO> findByBoard_no(int board_no);
	LocVO view(int Board_no);
	
	int update(LocVO vo);
}
