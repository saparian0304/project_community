package kr.co.pet.report;

import java.sql.Timestamp;

import kr.co.pet.admin.SearchVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportVO extends SearchVO {

	private int report_no;
	private int i_no;
	private int you_no;
	private String i_nickname;
	private String you_nickname;
	private int reason;
	private String content;
	private Timestamp report_date;
	private int board_no;
	private int reply_no;
	private String stat;	// wait | accept | reject
	private Timestamp resdate;
	private String resFromDate;
	private String resToDate;
	
	private int sumCnt;
	private int isReply;
	
	// 검색조건
	private String targetType;
	
	// 게시글 정보
	private String board_name;
	private String horse_hair;
	private String target_title;
	private String target_reply;
	private Timestamp regdate;
	private Timestamp update_date;
	
	// 신고처리시 메시지
	private int admin_no;
}
