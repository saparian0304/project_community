package kr.co.pet.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {

	/**
	 * 신고 등록
	 * @param vo ReportVO - i_no, you_no, reason, content, reply_no, board_no
	 * @return
	 */
	int report(ReportVO vo); // -> insert
	
	/**
	 * 신고 상태 처리 (stat 값 업데이트)
	 * @param vo ReportVO - report_no, stat
	 * @return
	 */
	int handleReport(ReportVO vo); // -> update
	
	/**
	 * 신고 게시글/댓글 목록 리스트
	 * @param vo ReportVO - [stat] (stat에 따라서 목록을 가져올 수있음)
	 * @return
	 */
	List<ReportVO> getReportList(ReportVO vo); // -> select
	
	/**
	 * 신고내용 상세페이지 
	 * @param vo ReportVO - report_no, [stat]
	 * @return
	 */
	ReportVO getReportView(ReportVO vo); // -> select
	
	/**
	 * 회원이 신고당한 목록
	 * @param vo ReportVO - you_no, [stat]
	 * @return
	 */
	List<ReportVO> getMemberList(ReportVO vo); // -> select
	/**
	 * 회원이 신고당한 총 횟수
	 * @param vo ReportVO - you_no, [stat]
	 * @return
	 */
	ReportVO getMemberReportCnt(ReportVO vo); // -> select
	
}
