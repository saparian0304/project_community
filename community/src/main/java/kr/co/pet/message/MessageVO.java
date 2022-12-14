package kr.co.pet.message;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageVO {

	private int mess_no;
	private String content;
	private int send_member;
	private int read_member;
	private Timestamp senddate;
	private Timestamp readdate;
	private boolean isdelete;	
	
	private String searchNick;
	private String member_nickname;
	
	private int member_no;
	
}
