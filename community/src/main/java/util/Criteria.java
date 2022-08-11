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
		this.page = 1;
		this.pageRow = 10;
		this.blockSize = 10;
		this.startIdx = (this.page-1)* this.pageRow;
	}
}
