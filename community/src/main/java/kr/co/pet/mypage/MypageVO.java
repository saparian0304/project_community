package kr.co.pet.mypage;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import util.Criteria;

@Getter
@Setter
public class MypageVO extends Criteria{

	// 테이블명
	private String table_name;
	
	// 게시판 이름
	private String board_name;
	
	//쪽지
	private int send_member;
	private int read_member;
	private int mess_no;
	private String send_nick;
	private String read_nick;
	private Timestamp senddate;
	
	// 활동 내역
	private String title;
	private String content;
	private Timestamp regdate;
	private int board_no;
	
	// 체크 넘버
	private int select_no;
	
	// 회원
	private int member_no;
	private String nickname;
	
	// 친구
	private int fri_no;
	private int i_no;
	private int you_no;
	private Timestamp req_date;
	private Timestamp res_date;

}
