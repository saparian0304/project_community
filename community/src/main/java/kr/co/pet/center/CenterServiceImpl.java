package kr.co.pet.center;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CenterServiceImpl implements CenterService{

	@Autowired
	CenterMapper mapper;
	
	@Override
	public Map index(CenterVO vo) {
		// TODO Auto-generated method stub
		return null;
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
