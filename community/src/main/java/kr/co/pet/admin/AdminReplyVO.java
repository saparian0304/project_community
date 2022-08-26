package kr.co.pet.admin;

import java.sql.Timestamp;

import lombok.Data;
import util.Criteria;

@Data
public class AdminReplyVO extends Criteria {
	//reply
	private String content;
	private int member_no;
	private int gno;
	private Timestamp regdate;
	
	//board
	private String horse_hair;
	private String board_name;
	private String title;
	
	//count
	private int rec_count;
	private int rep_count;
	
	
}
