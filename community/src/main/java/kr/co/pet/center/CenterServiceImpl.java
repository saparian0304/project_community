package kr.co.pet.center;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CenterServiceImpl implements CenterService{

	@Autowired
	CenterMapper mapper;
	
	@Override
	public Map index(CenterVO vo) {
		Map map = new HashMap();
		
		// 총 게시물
		int totalCount = mapper.count(vo);
				
		//게시물 리스트
		List list = mapper.list(vo);
//		map.put("totalCount", totalCount);
//		map.put("page", vo.getPage());
		map.put("list", list);
		
		return map;
	}
	
	@Override
	public boolean insert(CenterVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}

	@Override
	public CenterVO view(int board_no) {
		mapper.findByBoard_no(board_no);
		return mapper.view(board_no);
	}

	@Override
	public boolean update(CenterVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}

	
}
