package kr.co.pet.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FileServiceImpl implements FileService{
	@Autowired
	FileMapper mapper;

	@Override
	public FileVO view(int board_no) {
		return mapper.view(board_no);
	}
	
	@Override
	public List find(int board_no) {
		List<FileVO> vo = mapper.findByBoard_no(board_no);
		for (FileVO vfo : vo) {
			System.out.println(vfo.getFilename_org());
		}
		return mapper.findByBoard_no(board_no);
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
