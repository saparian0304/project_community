package kr.co.pet.reply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import util.Criteria;

@Getter
@Setter
public class ReplyVO extends Criteria {
	
	private int reply_no;
	private String content;
	private int board_no;
	private int member_no;
	private Timestamp regdate;
	private Timestamp update_date;
	private boolean isdelete;
	private int gno;
	private int ono;
	
	
	private int reply_count;
	private String member_nickname;	
	
	
	
}
