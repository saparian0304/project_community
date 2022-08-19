<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<link rel="stylesheet" href="/pet/css/tab.css"/>
<script>

/* 삭제 할거임 */
function del(no) {
	if(confirm('삭제하시겠습니까?')){
		location.href='delete.do?board_no='+no;
	}
}

/* 댓글 스크립트  */

 
var boardWriter = ${data.member_no};
function getComment(page){
	$.ajax({    			
		url : "/pet/reply/list.do",
			data : {
				board_no : ${data.board_no},
				member_no : ${data.member_no},
				page: page				
			},			
			success : function(res) {
				$("#commentArea").html(res);				
			}
	});
}


 
$(function(){
	getComment(1);
	
});


function goSave(){
	<c:if test="${empty loginInfo}">
		 alert('로그인후 댓글작성해주세요');
	</c:if>
	<c:if test="${!empty loginInfo}"> 
	if (confirm('댓글을 저장하시겠습니까?')){
		$.ajax({			
			url : "/pet/reply/insert.do",
			data : {
				board_no : ${data.board_no},
				content : $("#content").val(),
				member_no : ${loginInfo.member_no}
			},
			success : function(res) {
				if (res.trim() == "1") {
					alert('정상적으로 댓글이 등록되었습니다.');
					$("#content").val('');
					getComment(1);
				}
				if(socket){
				 socket.send("reply,"+${loginInfo.member_no}+","+boardWriter+","+${data.board_no}+","+'${data.title}');
				}
			}
		});
	}
	</c:if>
}

// 댓글수정
function replyEdit(reply_no, content){
	$.ajax({    			
		url : "/pet/reply/list.do",
		data : {
			board_no : ${data.board_no},
			reply_no : reply_no,
			content : content
			
		},			
		success : function() {
			$("#redit"+reply_no).html('<tr><td colspan="5"><textarea name="content" id="recon" style="width:800px; height:70px;">'+content+'</textarea></td><td><div class="btnSet"><a href="javascript:replyEditgo(' + reply_no + ');"  style="  text-align: center;" >&nbsp;&nbsp;수정</a></div></td></tr>');				
		}
	});
	$("#redit"+reply_no).toggle();
}

function replyEditgo(reply_no){
<c:if test="${!empty loginInfo}">
	if (confirm('댓글을 수정하시겠습니까?')){
		$.ajax({			
			url : "/pet/reply/replyEdit.do",
			data : {
				board_no: ${data.board_no},
				reply_no : reply_no,
				content : $("#recon").val(),
				member_no : ${loginInfo.member_no}
			},
			success : function(res) {
				if (res.trim() == "1") {
					alert('정상적으로 댓글이 수정되었습니다.');
					$("#recon").val('');
					getComment(1);
				}
			}
		});
	}
</c:if>
}

// 대댓글작성
function replySave(gno){
	<c:if test="${empty loginInfo}">
		 alert('로그인후 댓글작성해주세요');
	</c:if>
	<c:if test="${!empty loginInfo}">
	if (confirm('댓글을 저장하시겠습니까?')){
		$.ajax({			
			url : "/pet/reply/reply.do",
			data : {
				board_no: ${data.board_no},
				gno : gno,				
				content : $("#contents").val(),
				member_no : ${loginInfo.member_no}
			},
			success : function(res) {
				if (res.trim() == "1") {
					alert('정상적으로 댓글이 등록되었습니다.');
					$("#contents").val('');
					getComment(1);
				}
			}
		});
		
	}
	</c:if>
} 

// 대댓글 리스트
function replyForm(gno){	
	$.ajax({    			
		url : "/pet/reply/replylist.do",
			data : {
				board_no : ${data.board_no},
				member_no : ${data.member_no},
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
					getComment(1);		
				
				}
			}	
		})
	}
}

function report(member_no, board_no, reply_no) {
	<c:if test="${empty loginInfo}">
		alert('로그인후 댓글작성해주세요');
	 	return;
	</c:if>
	var isReply;
	if (reply_no == '' || reply_no == null) {
		isReply = 0;
	} else {
		isReply = 1
	}

	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', '/pet/report/write.do');
	document.charset = "uft-8";
	var list = { 
			'you_no' : member_no, 
			'board_no' : board_no, 
			'reply_no' : reply_no,
			'isReply' : isReply}
	for ( var key in list) {
		var field = document.createElement('input');
		field.setAttribute('type', 'hidden');
		field.setAttribute('name', key);
		field.setAttribute('value', list[key]);
		form.appendChild(field);
	}
	document.body.appendChild(form);
	form.submit();
}

// 좋아요
function recommend(board_no, reply_no) {
	<c:if test="${empty loginInfo}">
	 alert('로그인 상태에서 이용할 수 있습니다.');
	 return;
	</c:if>
	$.ajax({
		url : "/pet/recommend/recommend.do",
		data : {
			board_no : board_no,
			reply_no : reply_no,
		},			
		type : 'post',
		dataType : "JSON",
		success : function(res) {
			console.log(res)
			console.log(res.recommendCount);
			console.log(res.recommended);
			if (res.recommended) {
				var icon_img = '<img alt="좋아요" src="/pet/img/icon_like_black.png" width="50px"><br>'+res.recommendCount;
				$('#like').html(icon_img);
			} else {
				var icon_img = '<img alt="좋아요" src="/pet/img/icon_like_white.png" width="50px"><br>'+res.recommendCount;
				$('#like').html(icon_img);
			}
		}	
	})
}
//탭
$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
	 
	})
</script>
    
    <ul class="skipnavi">
        <li><a href="#container">본문내용</a></li>
    </ul>


    <div id="wrap">
        <!-- 컨텐츠 영역 -->
        <div id="container">
            <!-- 위치(페이지 제목)영역 -->
            <div class="location_area customer">
                <div class="box_inner">
                    <h2 class="tit_page">
                        <span>반려동물 커뮤니티</span>
                    </h2>
                </div>
            </div> 
            <div class="sub">
	            <div class="size">
	                <h3 class="sub_title">게시판</h3>
	                <div class="bbs">
	                	<div style="text-align: right">
	                    	작성자 : ${data.member_no } <a href="javascript:report(${data.member_no}, ${data.board_no }, 0)">[게시글 신고버튼 예]</a><br>  
							<a href="javascript:report(${data.member_no}, ${data.board_no }, 1)">[댓글 신고버튼 예]</a>
	                	</div>
	                    <div class="view">
	                        <div class="title">
	                            <dl>
	                                <dt>${data.title } </dt>
	                                <dd class="date">작성일 : ${data.regdate } </dd>
	                            </dl>
	                        </div>
	                        <div class="content" style="text-align: center">
	                        	<dl>
	                        		<dt>${data.content }</dt>
	                        	</dl>
	                        </div>
	                        
	                        <dl class="file" style="clear:both">
	                            <dt>첨부파일 </dt>
	                            <dd>
	                            <!-- 
	                            <a href="/pet/common/download.jsp?oName=${URLEncoder.encode(fdata.filename_org,'UTF-8')}&sName=${fdata.filename_real}"  
	                            target="_blank">${fdata.filename_org}</a></dd>
	                             -->
	                            <c:forEach var="fo" items="${fdata }">
	                            	${URLEncoder.encode(fo.filename_org,'UTF-8')}
	                            
	                            </c:forEach>
	                            </dd>
	                        </dl>
	                        
	                        
	                        <div class="btnSet clear" style="clear:both">
	                            <div class="fl_l">
		                            <a href="freeindex.do" class="btn">목록으로</a>
		                            <a href="/pet/board/edit.do?board_no=${data.board_no }" class="btn">수정</a>
		                            <a href="javascript:del(${data.board_no})" class="btn">삭제</a>
		                            <a href="reply.do?board_no=${data.board_no }" class="btn">답변</a>
	                            </div>
	                        </div>
	                    </div><!-- view -->
	                </div><!-- bbs -->
	            </div><!-- size -->
	        </div><!-- sub -->
        </div>
        <!-- id contner -->
        
    </div> <!-- div id="wrap" -->

  
 <!-- 댓글 폼 -->   
    <div style="width: 980px; margin: 0 auto;">
	<form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
		<table class="board_write" style="width:100%;">
			<colgroup>
				<col width="*" />
				<col width="100px" />
			</colgroup>
			<tbody>
				<tr id="test">
				<c:if test="${empty loginInfo}">
					<td>
						<textarea name="content" id="content" style="width:900px;height: 70px;" placeholder="로그인 후 작성해주세요"></textarea>
					</td>
				</c:if>
				<c:if test="${!empty loginInfo}">
					<td>
						<textarea name="content" id="content" style="width:900px;height: 70px;" placeholder="댓글을 작성해주세요"></textarea>
					</td>
				</c:if>		
					<td>
						<div class="btnSet">
							<a href="javascript:goSave();"  style="  text-align: center;">저장</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
	<div id="commentArea"></div>
</div>
    

    

</body>
</html>