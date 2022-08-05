package kr.co.pet.file;

import lombok.Data;

@Data
public class FileVO {
	
	private int file_no;
	private int board_no;
	private String filename_org;
	private String filename_real;
}
