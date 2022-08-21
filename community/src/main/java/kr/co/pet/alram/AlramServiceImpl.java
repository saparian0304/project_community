package kr.co.pet.alram;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlramServiceImpl implements AlramService{

	@Autowired
	AlramMapper mapper;
	
	@Override
	public Map alramList(AlramVO vo) {
		Map map = new HashMap();
		List list = mapper.alramList(vo);
		return map;
	}

}
