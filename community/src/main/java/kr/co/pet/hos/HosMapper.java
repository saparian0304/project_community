package kr.co.pet.hos;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HosMapper {
	
	int insert(HosVO vo);
	
	public void delete(int hos_no);
	
	public List<HosVO> findByBoard_no(int board_no);
	
	HosVO view(int board_no);
	
	int update(HosVO vo);
	
}
