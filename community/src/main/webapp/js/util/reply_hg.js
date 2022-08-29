
// 게시글 정렬
function adminSearch(id, sort, order) {
	$('#sort').val(sort);
	$('#order').val(order);
	$(id).submit();
}


// 관리자 게시판관리 테이블 헤더 작성 함수
function makeTh(sort, order) {
	var arr1 = ['board_name', 'title', 'content', 'reply_count', 'rec_count', 'report_count', 'nickname', 'regdate'];
	var arr2 = ['게시판', '게시판제목', '댓글 내용', '댓글 수', '좋아요 횟수', '신고 횟수', '작성자', '작성일'];
	//게시판 제목과 댓글의 내용이 같이 나와야 함... / 작성자(작성자별, 신고많이 당한 작성자별
	var str3 = '';
	for (var i = 0 ; i<arr1.length; i++) {
		var str1 = '';
		var str2 = '';
		str1 += "<th scope='col'><a href=\"javascript:adminSearch(\'#boardSearch\', \'"+arr1[i];
		if ( sort == arr1[i]) {
			if (order == 'DESC') {
				str2 += "', 'ASC');\"><img src='/pet/img/admin/icon_sort_desc.png' style='width : 17px;'>"+ arr2[i]+"</a></th>";
			} else {
				str2 += "', 'DESC');\"><img src='/pet/img/admin/icon_sort_asc.png' style='width : 17px;'>"+ arr2[i]+"</a></th>";
			}
		} else {
			str2 += "', 'DESC');\">"+ arr2[i]+"</a></th>";
		}
		str3 += str1+str2;
		
	}
	$('tr > th[scope="col"]').after(str3);
}