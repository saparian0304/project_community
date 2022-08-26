package kr.co.pet.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.pet.board.BoardVO;
import kr.co.pet.member.MemberVO;
import kr.co.pet.reply.ReplyVO;

@Mapper
public interface ReportMapper {

	/**
	 * 회원 정보 불러오기
	 * @param vo ReportVO - you_no
	 * @return
	 */
	MemberVO selectMember(ReportVO vo);
	/**
	 * 게시글 정보 불러오기
	 * @param vo ReportVO - board_no, reply_no
	 * @return
	 */
	BoardVO selectBoard(ReportVO vo);
	
	/**
	 * 댓글 정보 불러오기
	 * @param vo ReportVO - board_no, reply_no
	 * @return
	 */
	ReplyVO selectReply(ReportVO vo);
	
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
	 * 신고 게시글/댓글 수
	 * @param vo ReportVO - [stat] (stat에 따라서 목록을 가져올 수있음)
	 * @return
	 */
	int getCount(ReportVO vo); // -> select
	
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
	
	/**
	 * 신고글 삭제 처리
	 * @param vo
	 * @return
	 */
	int adminDeleteB(ReportVO vo);
	
	/**
	 * 신고 댓글 삭제 처리
	 * @param vo
	 * @return
	 */
	int adminDeleteR(ReportVO vo);
	
}
