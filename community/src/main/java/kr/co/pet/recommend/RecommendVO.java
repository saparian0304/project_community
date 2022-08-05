package kr.co.pet.recommend;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecommendVO {

	private int rec_no;
	private int member_no;
	private int board_no;
	private int reply_no;
	
	private int recommendCount;
	private boolean recommended;
		
}
