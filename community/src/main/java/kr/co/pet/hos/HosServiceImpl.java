package kr.co.pet.hos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HosServiceImpl implements HosService{

	@Autowired
	HosMapper mapper;
	
	@Override
	public boolean insert(HosVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}
	
}
