package kr.co.pet.message;

public interface MessageService {

	boolean insert(MessageVO vo);
	
	Integer search(MessageVO vo);
}
