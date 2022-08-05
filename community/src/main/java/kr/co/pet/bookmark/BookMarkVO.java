package kr.co.pet.bookmark;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookMarkVO {

	private int book_no;
	private int member_no;
	private int board_no;
	
	private int bookmarkCount;
	private boolean bookmarked;
		
}
