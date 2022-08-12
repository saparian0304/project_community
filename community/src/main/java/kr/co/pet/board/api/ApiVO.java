package kr.co.pet.board.api;

import lombok.Data;

@Data
public class ApiVO {
	private int insert_no;
	private String areaName;
	private String partName;
	private String title;
	private String adress;
	private String latitude;
	private String longitude;
	private String tel;
}
