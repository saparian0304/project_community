package kr.co.pet.admin;

import java.sql.Timestamp;

import lombok.Data;
import util.Criteria;

@Data
public class AdminReplyVO extends SearchVO {
	//reply
	private String content;
	private int member_no;
	private int gno;
	private Timestamp regdate;
	private String nickname;
	
	//board
	private String horse_hair;
	private String board_name;
	private String title;
	private int board_no;
	
	//count
	private int rec_count;
	private int rep_count;
	private int gno_count;
	
	
}
