package util;

import lombok.Data;

@Data
public class PageMaker {

	private Criteria cri;
	private int totalCount;
	private int totalPage;
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int blockSize;
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.blockSize = 10;
		calcData();
	}
	
	private void calcData() {
		
		totalPage = totalCount / cri.getPageRow();
		if (totalCount % cri.getPageRow() > 0) totalPage++;
		if (totalPage == 0) totalPage = 1;
		
		endPage = (int)(Math.ceil(cri.getPage() / (double)blockSize) * blockSize);
		startPage = (endPage - blockSize) + 1 ;
		if (startPage <= 0) startPage = 1;
		
		int temp = (int)(Math.ceil((totalCount) / (double)cri.getPageRow()));
		if (endPage > temp) endPage = temp;
		
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPageRow() < totalCount ? true : false;
		
	}
}
