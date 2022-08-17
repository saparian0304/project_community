package kr.co.pet.member;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	
	private int member_no;
	private String name;
	private String member_id;
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
	private String loginBySns;
	private String snsCheck;
	
	// 마이페이지용
	private int board_count;
	private int reply_count;
	
}
