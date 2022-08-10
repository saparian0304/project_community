package kr.co.pet.mypage;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MypageVO {

	// 테이블명
	private String table_name;
	
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
