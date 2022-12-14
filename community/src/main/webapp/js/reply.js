// 댓글 리스트
function getComment(page, board_no, member_no){
	$.ajax({    			
		url : "/pet/reply/list.do",
			data : {
				board_no : board_no,
				member_no : member_no,
				page: page				
			},			
			success : function(res) {
				$("#commentArea").html(res);				
			}
	});
}
 
// 댓글 작성 
function goSave(loginMem, board_no, data_tit, boardWriter){
	if(loginMem == null && loginMem == ''){
		 alert('로그인후 댓글작성해주세요');
	}
	if(loginMem != null && loginMem != ''){ 
		if (confirm('댓글을 저장하시겠습니까?')){
			$.ajax({			
				url : "/pet/reply/insert.do",
				data : {
					board_no : board_no,
					content : $("#content").val(),
					member_no : loginMem
				},
				success : function(res) {					
					if (res.trim() == "1") {
						alert('정상적으로 댓글이 등록되었습니다.');
						$("#content").val('');
						getComment(1,  board_no, boardWriter);
					}
					if(socket){
					 socket.send("reply,"+loginMem+","+boardWriter+","+board_no+","+data_tit);
					}
				}
			});
		}
	}
}


// 댓글 수정
function replyEdit(reply_no, board_no, content, loginMem, boardWriter){
	$.ajax({    			
		url : "/pet/reply/list.do",
		data : {
			board_no : board_no,
			reply_no : reply_no,
			content : content
			
		},			
		success : function() {
			$("#redit"+reply_no).html('<tr><td colspan="5"><textarea name="content" id="recon" style="width:800px; height:70px;">'+content+'</textarea></td><td><div class="btnSet"><a href="javascript:replyEditgo(' + reply_no + ','+ board_no +','+ loginMem +','+boardWriter+');"  style="  text-align: center;" >&nbsp;&nbsp;수정</a></div></td></tr>');				
		}
	});
	$("#redit"+reply_no).toggle();
}

// 대댓글 수정
function replyEditgo(reply_no, board_no, loginMem, boardWriter){
	if(loginMem != null && loginMem != ''){ 
		if (confirm('댓글을 수정하시겠습니까?')){
			$.ajax({			
				url : "/pet/reply/replyEdit.do",
				data : {
					board_no: board_no,
					reply_no : reply_no,
					content : $("#recon").val(),
					member_no : loginMem
				},
				success : function(res) {
					if (res.trim() == "1") {
						alert('정상적으로 댓글이 수정되었습니다.');
						$("#recon").val('');
						getComment(1, board_no, boardWriter);
					}
					
				}
			});
		}
	}
}

// 대댓글작성
function replySave(gno, board_no, loginMem, boardWriter){
	if(loginMem== null && loginMem == ''){
		 alert('로그인후 댓글작성해주세요');
	}
	if(loginMem != null && loginMem != ''){ 
		if (confirm('댓글을 저장하시겠습니까?')){
			$.ajax({			
				url : "/pet/reply/reply.do",
				data : {
					board_no: board_no,
					gno : gno,				
					content : $("#contents").val(),
					member_no : loginMem
				},
				success : function(res) {
					if (res.trim() == "1") {
						alert('정상적으로 댓글이 등록되었습니다.');
						$("#contents").val('');
						getComment(1, board_no, boardWriter);
					}
					if(socket){
						socket.send("rereply,"+loginMem+","+$("#no"+gno).val()+","+ board_no+","+$("#content"+gno).val());
					}
				}
			});
			
		}
	}
} 


// 대댓글 리스트
function replyForm(gno, board_no, boardWriter){	
	$.ajax({    			
		url : "/pet/reply/replylist.do",
			data : {
				board_no : board_no,
				member_no : boardWriter,
				gno : gno,
				page: 1				
			},			
			success : function(res) {
				$(".rbox"+gno).html(res);
				
		}
	});
	$(".replyshow").hide();
	$(".rbox"+gno).toggle();	
} 


// 댓글삭제
function commentDel(reply_no) {
	
	if(confirm("댓글을 삭제하시겠습니까?")) {
		$.ajax({
			url : '/pet/reply/update.do?reply_no='+reply_no,
			success : function(res)	{
				if(res.trim() == '1') {
					alert('댓글이 정상적으로 삭제되었습니다.');
					getComment(1, board_no, boardWriter);		
				
				}
			}	
		});
	}
}
