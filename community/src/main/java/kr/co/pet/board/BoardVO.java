package kr.co.pet.board;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import util.Criteria;

@Data
@Setter
@Getter
public class BoardVO extends Criteria {
	//board
	private int board_no;
	private String board_name;
	private String title;
	private int member_no;
	private String memb_nickname;
	private Timestamp regdate;
	private int viewcount;
	private int reply_count;
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
	
	private String addr; // 시도,구군 select box
	private String addr2; // 시도,구군 select box
	private String sido1;
	private String gugun1; // 시도,구군 select box
	
	private String filename_org;
	private String filename_real;
	
}
