package kr.co.pet.admin;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminMemberVO extends SearchVO{

	
	private int member_no;
	private int admin_no;
	private String name;
	private String member_id;
	private String admin_id;
	private String pwd;
	private String email; 
	private String nickname;
	private String birthday;
	private String addr;
	private int level;
	private Timestamp regdate;
	private Timestamp leavedate;
	private int out;
	private Timestamp curr_login;
	private int gender;
	private boolean online;
	
	private String board_count;
	private String reply_count;
	private String board_count2;
	private String reply_count2;
	
}
