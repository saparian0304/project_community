package kr.co.pet.board;

import java.sql.Timestamp;
import java.util.List;

import kr.co.pet.file.FileVO;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class BoardVO {
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
	private int horse_hair;
	private Timestamp update_date;
	private String nickname;
	private String[] imageList;
	private String image;
	
	private int page;
	private String stype;//검색타입
	private String sword;//검색어
	
	private int startIdx;
	private int pageRow;
	
	public BoardVO() {
		this.page = 1;
		this.pageRow = 10;

	}
	
	public BoardVO(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}
	
	private String filename_real;
}
