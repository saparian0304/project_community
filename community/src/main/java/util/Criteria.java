package util;

import lombok.Data;

@Data
public class Criteria {

	// 페이징
	private int pageRow;
	private int blockSize;
	private int page;
	private int startIdx;
	
	public Criteria() {
		this.pageRow = 10;
		this.page = 1;
		this.blockSize = 10;
	}
}
