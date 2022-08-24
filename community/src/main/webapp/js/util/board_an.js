
// 신고
function report(you_no, board_no, reply_no, loginInfo) {
	if (loginInfo == '') {
		alert('로그인후 댓글작성해주세요');
		return;
	}
	var option = "width = 800, height = 600, top = 100, left = 100";
	var url = "/pet/report/write.do?you_no="+you_no+"&board_no="+board_no+"&reply_no="+reply_no;
	var name = "신고하기";
	window.open(url, name, option);
}

// 좋아요
function recommend(board_no, reply_no, writer_no,login_no, title) {
	if (login_no == '') {
		alert('로그인후 댓글작성해주세요');
		return;
	}
	$.ajax({
		url : "/pet/recommend/recommend.do",
		data : {
			board_no : board_no,
			reply_no : reply_no,
		},			
		type : 'post',
		dataType : "JSON",
		success : function(res) {
			if (res.recommended) {
				var icon_img = '<img alt="좋아요" src="/pet/img/icon_like_black.png" width="50px"><br>'+res.recommendCount;
				$('#like').html(icon_img);
				if(socket){
					socket.send("recommend,"+login_no+","+writer_no+","+board_no+","+'[게시글]' + title);
				}
			} else {
				var icon_img = '<img alt="좋아요" src="/pet/img/icon_like_white.png" width="50px"><br>'+res.recommendCount;
				$('#like').html(icon_img);
			}
		}	
	})
}

// 댓글 좋아요
function recommendReply(board_no, reply_no, login_no) {
	if (login_no == '') {
		alert('로그인후 댓글작성해주세요');
		return;
	}
	$.ajax({
		url : "/pet/recommend/recommend.do",
		data : {
			board_no : board_no,
			reply_no : reply_no,
		},			
		type : 'post',
		dataType : "JSON",
		success : function(res) {
			if (res.recommended) {
				var icon_img = '<img alt="좋아요" src="/pet/img/icon_like_black_2.png" width="13px"> '+res.recommendCount;
				$('#relike'+res.reply_no).html(icon_img);
				if(socket){
					socket.send("recommend,"+login_no+","+$("#no"+reply_no).val()+","+board_no+",[댓글]"+$("#content"+reply_no).val());
				}
			} else {
				var icon_img = '<img alt="좋아요" src="/pet/img/icon_like_white_2.png" width="13px"> '+res.recommendCount;
				$('#relike'+res.reply_no).html(icon_img);
			}
		}	
	})
}


// 북마크
function bookmark(board_no, member_no) {
	if (member_no == '') {
		alert('로그인후 댓글작성해주세요');
		return;
	}
	
	$.ajax({
		url : "/pet/bookmark/bookmark.do",
		data : {
			board_no : board_no,
			member_no : member_no
		},			
		type : 'post',
		dataType : "JSON",
		success : function(res) {
			console.log(res.bookmarked);
			if (res.bookmarked) {
				var icon_img = '<img alt="북마크" src="/pet/img/icon_bookmark_black.png" width="45px">';
				$('#book').html(icon_img);
			} else {
				var icon_img = '<img alt="북마크" src="/pet/img/icon_bookmark_white.png" width="45px">';
				$('#book').html(icon_img);
			}
		}	
	})
}