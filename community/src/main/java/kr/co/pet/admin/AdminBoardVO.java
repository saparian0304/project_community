package kr.co.pet.admin;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import util.Criteria;

@Data
@Setter
@Getter
public class AdminBoardVO extends Criteria {
	//board
	private int board_no;
	private String board_name;
	private String title;
	private int member_no;
	private String memb_nickname;
	private Timestamp regdate;
	// count
	private int viewcount;
	private int reply_count;
	private int rec_count;
	private int book_count;
	private int report_count;
	
	private String content;
	private String tel;
	private String link;
	private String horse_hair;
	private Timestamp update_date;
	private String nickname;
	private String[] imageList;
	private String image;
	
	
	
	private String stype;//검색타입
	private String sword;//검색어
	private String fromDate;	// 검색시작일자
	private String toDate;	//검색종료일자
	private String reply_content;
	private String sort;
	private String order;
	
	
	private String filename_org;
	private String filename_real;
	
}
