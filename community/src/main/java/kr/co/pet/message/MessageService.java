package kr.co.pet.message;

public interface MessageService {

	boolean insert(MessageVO vo);
	
	int search(MessageVO vo);
}
