package kr.co.pet.hos;

import lombok.Data;

@Data
public class HosVO {
	
	private int hos_no;
	private int board_no;
	private String license_no;
	private boolean park;
	private int ani_type;
	private boolean hurry;
	private boolean room;
	
}
