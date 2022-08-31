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
		str1 += "<th scope='col'><a href='javascript:adminSearch(\"#memberSearch\", \""+arr1[i];
		if ( sort == arr1[i]) {
			if (order == 'DESC') {
				str2 += "\", \"ASC\");'><img src='/pet/img/admin/icon_sort_desc.png' style='width : 17px;'>"+ arr2[i]+"</a></th>";
			} else {
				str2 += "\", \"DESC\");'><img src='/pet/img/admin/icon_sort_asc.png' style='width : 17px;'>"+ arr2[i]+"</a></th>";
			}
		} else {
			str2 += "\", \"DESC\");'>"+ arr2[i]+"</a></th>";
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
		$("input[name='board_count']").val($("input[name='board_count3']").val());
	} else {
		$("input[name='board_count']").val($("#board_count").val());
	}
	
	if($("#reply_count").val() == 'self') {
		$("input[name='reply_count']").val($("input[name='reply_count3']").val());
	} else {
		$("input[name='reply_count']").val($("#reply_count").val());
	}
	
	if($("#fromDate").val() == 'self') {
		$("input[name='fromDate']").val($("input[name='fromDate3']").val());
	} else {
		$("input[name='fromDate']").val($("#fromDate").val());
	}
	$("#memberSearch").submit();
};


$(function(){
	// 이상이하 표시
	$("#level").change(function(){
		var temp1 = level_order == 'only' ? 'selected':'';
		var temp2 = level_order == 'up' ? 'selected':'';
		var temp3 = level_order == 'down' ? 'selected':'';
		
		var state = $("option:selected", this).val();
		var str = "<option value=''>--선택--</option>";
		str += "<option value='only' "+temp1+">해당대상만</option>";
		str += "<option value='up' "+temp2+">이상</option>";
		str += "<option value='down' "+temp3+">이하</option>";
		
		$("option",$(this).next()).remove();
		
		if (state != 0) {
			$(this).next().append(str);
		} else {
			$("option",$(this).next()).remove();
			$(this).next().append("<option value=''>--</option>");
		}
	})
	
	$("#board_count").change(function(){
		var temp1 = board_order == 'only' ? 'selected':'';
		var temp2 = board_order == 'up' ? 'selected':'';
		var temp3 = board_order == 'down' ? 'selected':'';
		
		var state = $("option:selected", this).val();
		var str = "<option value=''>--선택--</option>";
		str += "<option value='only' "+temp1+">해당대상만</option>";
		str += "<option value='up' "+temp2+">이상</option>";
		str += "<option value='down' "+temp3+">이하</option>";
		
		$("option",$(this).next().next()).remove();
		
		if (state != 0) {
			$(this).next().next().append(str);
		} else {
			$("option",$(this).next().next()).remove();
			$(this).next().next().append("<option value=''>--</option>");
		}
	})
	
	$("#reply_count").change(function(){
		var temp1 = reply_order == 'only' ? 'selected':'';
		var temp2 = reply_order == 'up' ? 'selected':'';
		var temp3 = reply_order == 'down' ? 'selected':'';
		
		var state = $("option:selected", this).val();
		var str = "<option value=''>--선택--</option>";
		str += "<option value='only' "+temp1+">해당대상만</option>";
		str += "<option value='up' "+temp2+">이상</option>";
		str += "<option value='down' "+temp3+">이하</option>";
		
		$("option",$(this).next().next()).remove();
		
		if (state != 0) {
			$(this).next().next().append(str);
		} else {
			$("option",$(this).next().next()).remove();
			$(this).next().next().append("<option value=''>--</option>");
		}
	})
	
	$("#board_count").change(function(){
		var state = $("#board_count option:selected").val();
		if (state == 'self') {
			$("input[name='board_count3']").css("display","inline-block");
			$("input[name='board_count3']").focus();
		} else {
			$("input[name='board_count3']").hide();
		}
	});
	$("#reply_count").change(function(){
		var state = $("#reply_count option:selected").val();
		if (state == 'self') {
			$("input[name='reply_count3']").css("display","inline-block");
			$("input[name='reply_count3']").focus();
		} else {
			$("input[name='reply_count3']").hide();
		}
	});
	
	
	// 날짜검색 설정
	$("#dateType").change(function(){
		var temp1 = fromDate == '1week' ? 'selected':'';
		var temp2 = fromDate == '1month' ? 'selected':'';
		var temp3 = fromDate == '3month' ? 'selected':'';
		var temp4 = fromDate == 'self' ? 'selected':'';
		
		var state = $("#dateType option:selected").val();
		$("option","#fromDate").remove();
		var str = "<option value=''>------선택------</option>";
		str += "<option value='1week' "+temp1+">최근 1주일 이내</option>";
		str += "<option value='1month' "+temp2+">최근 1개월 이내</option>";
		str += "<option value='3month' "+temp3+">최근 3개월 이내</option>";
		str += "<option value='self' "+temp4+">직접 입력</option>";
		
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
