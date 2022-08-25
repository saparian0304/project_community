

// 게시판명 변화에 따른 말머리 옵션 변경
function change_hair(e) {
	var live = ['식당', '관광지', '병원'];
	var free = ['잡담', '여행후기', '추천', '고민'];
	var center = ['보호센터'];
	var index = 0;
	var add_hair = '<option value="">말머리</option>';
	var add = [];
	if(e == 'live') {
		add = live;
		index = 1;
	} else if (e== 'free') {
		add = free;
		index = 3;
	} else if (e == 'center') {
		add = center;
		index = 7;
	}
	
	for (var i=0; i<add.length; i++) {
		add_hair +=	"<option value='"+index+"'>" + add[i] + "</option>";
		index++;
	}
	$('#horse_hair').html(add_hair);
}

// 게시글 정렬
function adminSearch(id, sort, order) {
	$('#sort').val(sort);
	$('#order').val(order);
	$(id).submit();
}


// 관리자 게시판관리 테이블 헤더 작성 함수
function makeTh(sort, order) {
	var arr1 = ['board_name', 'horse_hair', 'title', 'viewcount', 'reply_count', 'rec_count', 'book_count', 'report_count', 'member_no', 'regdate'];
	var arr2 = ['게시판', '말머리', '제목', '조회수', '댓글 수', '좋아요 횟수', '북마크 횟수', '신고 횟수', '작성자', '작성일'];
	
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


// 윈도우창 닫기
function winClose(){
	  window.open('','_self').close(); 
};