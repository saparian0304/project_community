package kr.co.pet.file;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.board.BoardMapper;
import kr.co.pet.board.BoardVO;


@Service
public class FileServiceImpl implements FileService{
	@Autowired
	FileMapper mapper;

	@Override
	public FileVO view(int board_no) {
		mapper.findByBoard_no(board_no);
		return mapper.view(board_no);
	}
	
	@Override
	public boolean insert(FileVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}

	@Override
	public boolean update(FileVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}
	
	@Override
	public FileVO edit(int board_no) {
		return mapper.view(board_no);
	}

}
