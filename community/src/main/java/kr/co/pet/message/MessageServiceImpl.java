package kr.co.pet.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pet.reply.ReplyMapper;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageMapper mapper;
	
	@Override
	public boolean insert(MessageVO vo) {
		
		return mapper.insert(vo) > 0 ? true : false;
	}

	@Override
	public Integer search(MessageVO vo) {
		
		if(mapper.search(vo) == null) {
			return 0;
		}else {
		return mapper.search(vo).getMember_no();
		}
		
	}

}
