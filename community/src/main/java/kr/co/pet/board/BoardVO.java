package kr.co.pet.board;

import java.sql.Timestamp;
import java.util.List;

import kr.co.pet.file.FileVO;
import lombok.Data;

@Data
public class BoardVO {
	//board
	private int board_no;
	private String board_name;
	private String title;
	private int member_no;
	private Timestamp regdate;
	private int viewcount;
	private String content;
	private int horse_hair;
	private Timestamp update_date;
	
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
	
	private List<FileVO> fileList;
	private int file_no;
	private String filename_org;
	private String filename_real;
	
	
	
	//location
	private int loc_no;
	private String gps_x;
	private String gps_y;
	private String addr;
	private String addr2;
	
	
}
