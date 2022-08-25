// 관리자 게시판관리 테이블 헤더 작성 함수
function makeTh(sort, order) {
	var arr1 = ['member_id', 'nickname', 'email', 'gender', 'birthday', 'level', 'board_count', 'reply_count', 'regdate', 'curr_login', '출석수'];
	var arr2 = ['ID', '닉네임', '이메일', '성별', '생년월일', '등급', '게시글 수', '댓글 수', '가입일', '최종방문일', '출석수'];
	
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