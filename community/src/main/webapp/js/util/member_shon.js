// 게시글 정렬
function adminSearch(id, sort, order) {
	$('#sort').val(sort);
	$('#order').val(order);
	$(id).submit();
}

// 관리자 게시판관리 테이블 헤더 작성 함수
function makeTh(sort, order) {
	var arr1 = ['member_id', 'nickname', 'email', 'gender', 'birthday', 'level', 'out', 'board_count', 'reply_count', 'regdate', 'curr_login', '출석수'];
	var arr2 = ['ID', '닉네임', '이메일', '성별', '생년월일', '등급', '회원상태', '게시글 수', '댓글 수', '가입일', '최근방문일', '출석수'];
	
	var str3 = '';
	for (var i = 0 ; i<arr1.length; i++) {
		var str1 = '';
		var str2 = '';
		str1 += "<th scope='col'><a href='javascript:adminSearch(\'#boardSearch\', \'"+arr1[i];
		if ( sort == arr1[i]) {
			if (order == 'DESC') {
				str2 += "', 'ASC');'><img src='/pet/img/admin/icon_sort_desc.png' style='width : 17px;'>"+ arr2[i]+"</a></th>";
			} else {
				str2 += "', 'DESC');'><img src='/pet/img/admin/icon_sort_asc.png' style='width : 17px;'>"+ arr2[i]+"</a></th>";
			}
		} else {
			str2 += "', 'DESC');'>"+ arr2[i]+"</a></th>";
		}
		str3 += str1+str2;
		
	}
	$('tr > th[scope="col"]').after(str3);
}

// 상세조건 숨기기 
function dis(){
    if($('.detail').css('display') == 'none'){
        $('.detail').show();
    }else{
        $('.detail').hide();
    }
}

// 검색
function gosearch() {
	
	if($("#board_count").val() == 'self') {
		$("#board_count").val($("input[name='board_count2']").val());
	}
	if($("#reply_count").val() == 'self') {
		$("#reply_count").val($("input[name='reply_count2']").val());
		
	}
	if($("#fromDate").val() == 'self') {
		$("#fromDate").val($("input[name='fromDate2']").val());
	}
	$("#memberSearch").submit();
};


$(function(){
	// 이상이하 표시
	$(".updown").change(function(){
		var state = $("option:selected", this).val();
		var str = "<option value=''>--선택--</option>";
		str += "<option value='up'>이상</option>";
		str += "<option value='down'>이하</option>";
		$("option",$(this).next().next()).remove();
		
		if (state != "") {
			$(this).next().next().append(str);
		} else {
			$(this).next().next().append("<option value=''>--</option>");
		}
	})
	
	$("#board_count").change(function(){
		var state = $("#board_count option:selected").val();
		if (state == 'self') {
			$("input[name='board_count2']").css("display","inline-block");
			$("input[name='board_count2']").focus();
		} else {
			$("input[name='board_count2']").hide();
		}
	});
	$("#reply_count").change(function(){
		var state = $("#reply_count option:selected").val();
		if (state == 'self') {
			$("input[name='reply_count2']").css("display","inline-block");
			$("input[name='reply_count2']").focus();
		} else {
			$("input[name='reply_count2']").hide();
		}
	});
	
	
	// 날짜검색 설정
	$("#dateType").change(function(){
		var state = $("#dateType option:selected").val();
		$("option","#fromDate").remove();
		var str = "<option value=''>------선택------</option>";
		str += "<option value=''>최근 1주일 이내</option>";
		str += "<option value=''>최근 1개월 이내</option>";
		str += "<option value=''>최근 3개월 이내</option>";
		str += "<option value='self'>직접 입력</option>";
		
		if (state != "") {
			$("#fromDate").append(str);
		} else {
			$("#fromDate").append("<option value=''>---</option>");
			$(".dateSelf").hide();
		}
		
		// 날짜검색 직접입력 설정
		$("#fromDate").change(function(){
			var state = $("#fromDate option:selected").val();
			if (state == 'self') {
				$(".dateSelf").css("display","inline-block");
			} else {
				$(".dateSelf").hide();
			}
		});
		
		
	})
	
})
