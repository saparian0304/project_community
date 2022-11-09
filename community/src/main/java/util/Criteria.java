package util;

import lombok.Data;

@Data
public class Criteria {

	// 페이징
	private int page; 
	private int pageRow;
	private int startIdx;

	public Criteria() {
		this.page = 1;
		this.pageRow = 10;
	}
	
	
	public Criteria(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}
	
	public int getStartIdx() {
		return (this.page - 1) * pageRow;
	}
	
}
