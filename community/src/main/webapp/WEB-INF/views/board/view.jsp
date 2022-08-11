<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ include file= "/WEB-INF/views/includes/header.jsp"%> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>박물관 미션 투어 당첨자 발표 | 공지사항 | 고객센터 | 투어리스트인투어</title>
      <link rel="stylesheet" href="/pet/css/common.css">
      <link rel="stylesheet" href="/pet/css/reset.css"/>
      <link rel="stylesheet" href="/pet/css/contents.css"/> 
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  
<script>

/* 댓글 스크립트  */
 

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
			}
		});
	}
	</c:if>
}

// 댓글수정
function replyEdit(reply_no){
	$.ajax({    			
		url : "/pet/reply/list.do",
		data : {
			board_no : ${data.board_no},
			reply_no : reply_no				
		},			
		success : function() {
			$("#redit"+reply_no).html('<tr><td><textarea name="content" id="recon" style="width:900px; height="70px;"></textarea></td><td><div class="btnSet"><a href="javascript:replyEditgo(' + reply_no + ');"  style="  text-align: center;">수정</a></div></td></tr>');				
		}
	});
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
				gno : gno,
				page: 1				
			},			
			success : function(res) {			
				$("#rbox"+gno).html(res);	
			 
		}
	});
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

</script>

</head>
<body>
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
                        <span>TOURIST</span>
                        <span class="in">in</span>
                        <!-- <span class="in">IN</span> -->
                        <span>TOUR</span>
                    </h2>
                    <p class="location">
                        고객센터
                        <span class="path">/</span> 
                        공지사항
                    </p>
                    <!-- 모바일 -->
                    <ul class="page_menu clear">
                        <li>
                            <a href="#" class="on">공지사항<a>
                        </li>
                        <li>
                            <a href="#">문의하기</a>
                        </li>
                    </ul>

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
                        <div class="cont"><p>${data.content }</p> </div>
                        <dl class="file">
                            <dt>첨부파일 </dt>
                            <dd>
                            <a href="/pet/common/download.jsp?oName=${ URLEncoder.encode(fdata.filename_org,'UTF-8')}&sName=${fdata.filename_real}"  
                            target="_blank">${fdata.filename_org}</a></dd>
                        </dl>
                                    
                        <div class="btnSet clear">
                            <div class="fl_l">
                            <a href="index.do" class="btn">목록으로</a>
                            <a href="/pet/board/edit.do?board_no=${data.board_no }" class="btn">수정</a>
                            <a href="javascript:del(${data.board_no})" class="btn">삭제</a>
                            <a href="reply.do?board_no=${data.board_no }" class="btn">답변</a>
                        </div>
                    </div>
                   </div>
                  </div>
              </div>
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
				<tr>
					<td>
						<textarea name="content" id="content" style="width:900px;height: 70px;" placeholder="로그인 후 작성해주세요"></textarea>
					</td>
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
    

    <!-- 퀵메뉴 -->
    <h2 class="hdd">빠른 링크 : 전화문의, 카카오톡, 오시는 길, 꼭대기로 가기</h2>
    <div class="quick_area">
        <ul class="quick_list">
            <li>
                <a href="tel:010-1234-5678">
                    <h3>전화문의</h3>
                    <p>010-1234-5678</p>
                </a>
            </li>

            <li>
                <a href="#">
                    <h3>카카오톡<em>상담</em></h3>
                    <p>1대1상담</p>
                </a>
            </li>

            <li>
                <a href="#">
                    <h3 class="to_contact">오시는 길</h3>   
                </a>
            </li>
        </ul>
        <p class="to_top">
            <a href="#layout0" class="s_point">TOP</a>
        </p>
    </div>

</body>
</html>