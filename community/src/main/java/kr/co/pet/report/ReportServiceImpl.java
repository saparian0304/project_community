package kr.co.pet.report;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportMapper mapper;

	@Override
	public Map getInfo(ReportVO vo) {
		Map<String, Object> map = new HashMap();
		map.put("member", mapper.selectMember(vo));
		if(vo.getReply_no() == 0 ) {
			map.put("board", mapper.selectBoard(vo));
			map.put("isReply", false);
		} else {
			map.put("reply", mapper.selectReply(vo));
			map.put("isReply", true);
		}
		return map;
	}
	
	/**
	 * 신고 등록
	 * @param vo ReportVO - i_no, you_no, reason, content, reply_no, board_no
	 */
	@Override
	public int report(ReportVO vo) {
		return mapper.report(vo);
	}

	/**
	 * 신고 처리
	 * @param vo ReportVO - report_no, stat
	 */
	@Override
	public int handle(ReportVO vo) {
		int result = 0;
		String tempStat = vo.getStat();
		vo = mapper.getReportInfo(vo);
		vo.setStat(tempStat);
		if (vo.getReply_no() == 0) {
			mapper.adminDeleteB(vo);
			mapper.handleReport(vo);
			result++;
		} else {
			mapper.adminDeleteR(vo);
			mapper.handleReport(vo);
			result++;
		}
		if ("accept".equals(tempStat)) {
			vo.setContent("관리자에 의해 게시물이 삭제되었습니다.");
			vo.setAdmin_no(1);	// 관리자번호 구현 전까지 1로 설정
			mapper.sendAdminMsg(vo);
		}
		
		return result;
	}

	/**
	 * 신고 목록 리스트
	 * @param vo ReportVO - reply_no, board_no, stat
	 */
	@Override
	public Map getList(ReportVO vo) {
		Map<String, Object> map = new HashMap();
		map.put("list", mapper.getMemberList(vo));
		map.put("totalCnt", mapper.getCount(vo));
		return map;
	}

	/**
	 * @param vo ReportVO - report_no, stat
	 */
	@Override
	public ReportVO getView(ReportVO vo) {
		return mapper.getReportView(vo);
	}

	/**
	 * @param vo ReportVO - you_no, stat
	 */
	@Override
	public Map getReportedList(ReportVO vo) {
		Map<String, Object> map = new HashMap();
		map.put("list", mapper.getReportList(vo));
		map.put("page", vo.getPage());
		map.put("totalCount", mapper.getCount(vo));
		return map;
	}

}
