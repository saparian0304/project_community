package kr.co.pet.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.reply.ReplyMapper;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageMapper mapper;
	
	@Override
	public int insert(MessageVO vo) {
		
		return mapper.insert(vo);
	}

}
