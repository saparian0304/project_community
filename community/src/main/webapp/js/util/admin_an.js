

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


// 관리자  테이블 헤더 작성 함수
function makeTh(arrColName, arrHeadName, Formid, sort, order) {
	//게시판 제목과 댓글의 내용이 같이 나와야 함... / 작성자(작성자별, 신고많이 당한 작성자별)
	var str1 = '';
	for (var i = 0 ; i<arrColName.length; i++) {
		var str2 = '';
		var str3 = '';
		str2 += "<th scope='col'><a href=\"javascript:adminSearch(\'"+Formid+"\', \'"+arrColName[i];
		if ( sort == arrColName[i]) {
			if (order == 'DESC') {
				str3 += "', 'ASC');\"><img src='/pet/img/admin/icon_sort_desc.png' style='width : 17px;'>"+ arrHeadName[i]+"</a></th>";
			} else {
				str3 += "', 'DESC');\"><img src='/pet/img/admin/icon_sort_asc.png' style='width : 17px;'>"+ arrHeadName[i]+"</a></th>";
			}
		} else {
			str3 += "', 'DESC');\">"+ arrHeadName[i]+"</a></th>";
		}
		str1 += str2+str3;
		
	}
	$('tr > th[scope="col"]').after(str1);
}


// 윈도우창 닫기
function winClose(){
	  window.open('','_self').close(); 
};

// 게시글, 댓글 구분
function setTargetType(targetType) {
	$('#targetType').val(targetType);
	$('#reportSearch').submit();
} 

// 체크박스 전체 체크
function selectAll(selectAll)  {
	var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	checkboxes.forEach((checkbox) => {
	   checkbox.checked = selectAll.checked
	})
}