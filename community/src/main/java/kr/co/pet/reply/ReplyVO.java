package kr.co.pet.reply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {
	
	private int reply_no;
	private String content;
	private int board_no;
	private int member_no;
	private Timestamp regdate;
	private Timestamp update_date;
	private boolean isdelete;
	private int gno;
	private int ono;
	
	private String member_email;	
	
	
	private int page; // 파라미터로 보낼때 같은 이름이면 원하는 화면이 안날올수있음
	private int startIdx;
	private int pageRow; // 
	
			// 생성자
	public ReplyVO() {
		this.page = 1;
		this.pageRow = 10; // 10으로 초기화 		
	}
}
