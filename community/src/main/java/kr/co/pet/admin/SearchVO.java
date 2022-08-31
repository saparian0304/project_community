package kr.co.pet.admin;

import lombok.Getter;
import lombok.Setter;
import util.Criteria;

@Getter
@Setter
public class SearchVO extends Criteria {

	private String stype;//검색타입
	private String sword;//검색어
	private String fromDate;	// 검색시작일자
	private String toDate;	//검색종료일자
	private String reply_content;
	private String sort;
	private String order;
	
	// member 검색 - shon
	private String dateType;
	private String level_order;
	private String board_order;
	private String reply_order;
}
