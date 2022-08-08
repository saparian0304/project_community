package kr.co.pet.report;

import java.util.List;
import java.util.Map;

public interface ReportService {

	
	public Map getInfo(ReportVO vo);
	
	/**
	 * 신고 등록
	 * @param vo ReportVO - i_no, you_no, reason, content, reply_no, board_no
	 */
	int report(ReportVO vo);
	
	/**
	 * 신고 처리
	 * @param vo ReportVO - report_no, stat
	 */
	int handle(ReportVO vo);
	
	/**
	 * 신고 목록 리스트
	 * @param vo ReportVO - reply_no, board_no, stat
	 */
	Map getList(ReportVO vo);
	
	/**
	 * @param vo ReportVO - report_no, stat
	 */
	ReportVO getView(ReportVO vo);
	
	/**
	 * @param vo ReportVO - you_no, stat
	 */
	Map getReportedList(ReportVO vo);
}
