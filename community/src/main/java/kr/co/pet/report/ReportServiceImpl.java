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
		if(vo.getIsReply() == 0 ) {
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
		return mapper.handleReport(vo);
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
		map.put("totalCnt", mapper.getCount(vo));
		return map;
	}

}
