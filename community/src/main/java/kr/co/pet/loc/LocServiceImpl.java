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

		@Override
		public LocVO view(int board_no) {
			mapper.findByBoard_no(board_no);
			return mapper.view(board_no);
	}

		@Override
		public LocVO edit(int board_no) {
			return mapper.view(board_no);
		}

		@Override
		public boolean update(LocVO vo) {
			return mapper.update(vo) > 0 ? true : false;
		}
	
}
