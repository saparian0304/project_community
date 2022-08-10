package util;

import lombok.Data;

@Data
public class Paging {

	private int endPage;
	private int startPage;
	private boolean prev, next;
	private int totalPage;
	private int totalCount;
	private Criteria cri;
//	private int pageRow;
//	private int blockSize;
//	private int page;
//	private int startIdx;
	
	public Paging(Criteria cri, int totalCount) {
		this.cri = cri;
		this.totalCount = totalCount;
		// 총 페이지
		int totalPage = totalCount / cri.getPageRow();
		if (totalCount % cri.getPageRow() > 0) totalPage++;
		if (totalPage == 0) totalPage = 1;
		this.totalPage = totalPage;
		
		// 시작인덱스
		int startIdx = (cri.getPage() - 1) * cri.getPageRow();
		cri.setStartIdx(startIdx);
		
		// 페이징
		int temp = cri.getPage() / cri.getPageRow();
		if (cri.getPage() % cri.getPageRow() > 0) temp++;
		int endPage = temp * cri.getPageRow();
		int startPage = endPage - (cri.getBlockSize() - 1);
		if (endPage > totalPage) endPage = totalPage;
		
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage > totalPage ? true : false;

		this.endPage = endPage;
		this.startPage = startPage;
		this.prev = prev;
		this.next = next;
		
	}
}
