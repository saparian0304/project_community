package kr.co.pet.report;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportVO {

	private int report_no;
	private int i_no;
	private int you_no;
	private int reason;
	private String content;
	private Timestamp report_date;
	private int board_no;
	private int reply_no;
	private String status;	// wait | accept | reject
	
	private int sumCnt;
}
