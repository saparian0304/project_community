package kr.co.pet.follow;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FollowVO {

	private int foll_no;
	private int i_no;
	private int you_no;
	private Timestamp req_date;
	private boolean relation;
	
}
