package kr.co.pet.loc;

import lombok.Data;

@Data
public class LocVO {
	
	private int loc_no;
	private int board_no;
	private String gps_x;
	private String gps_y;
	private String addr;
	private String addr2;
	private String gugun;
	
}
