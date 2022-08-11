package kr.co.pet.loc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocServiceImpl implements LocService{

	@Autowired
	LocMapper mapper;
	
	@Override
	public boolean insert(LocVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}
	
}
