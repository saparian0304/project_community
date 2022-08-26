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
	<script src="/pet/js/util/admin_an.js"></script>
<script>
var close_ = '${param.close_}';

$(function() {
	
	// close_ 값이 있으면 창 종료
	if(close_ == 'true') {
		winClose();	
	}
})

function goSave() {
	<c:if test="${empty loginInfo}">
		alert('로그인후 댓글작성해주세요');
	 	return;
	</c:if>
	$('#frm').submit();
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
                <h3 class="sub_title">회원 신고</h3>
                <div class="bbs">
	                <form method="post" name="frm" id="frm" action="report.do" enctype="multipart/form-data" >
	                	<input type="hidden" name="you_no" value="${param.you_no }">
	                	<input type="hidden" name="reply_no" value="${param.reply_no }">
	                	<input type="hidden" name="board_no" value="${param.board_no }">
	                	
		                <table class="board_write">
		                    <tbody>
		                    <!-- 
		                    	ReportVO - i_no, you_no, reason, content, reply_no, board_no
		                     -->
		                    <tr>
		                    	<th>신고사유</th>
		                    	<td>
		                    		<select class="reason" name="reason" disabled="disabled" style="heigth:30px">
		                    			<option value="0">--------신고사유--------</option>
		                    			<option value="1" <c:if test="${data.reason == 1 }">selected</c:if>>욕설</option>
		                    			<option value="2" <c:if test="${data.reason == 2 }">selected</c:if>>비방</option>
		                    			<option value="3" <c:if test="${data.reason == 3 }">selected</c:if>>광고</option>
		                    			<option value="4" <c:if test="${data.reason == 4 }">selected</c:if>>허위</option>
		                    			<option value="5" <c:if test="${data.reason == 5 }">selected</c:if>>기타</option>
		                    		</select>
		                    	</td>
		                    </tr> 
		                    <tr>
		                        <th>신고 유저 닉네임</th>
		                        <td>
		                            ${data.i_nickname }
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>신고 대상</th>
		                        <td>
		                            <c:if test="${data.reply_no == 0 }">${data.target_title }</c:if>
		                            <c:if test="${data.reply_no != 0 }">${data.target_reply }</c:if>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>내용</th>
		                    	<td>
		                            <textarea name="content" id="content" readonly="readonly">${data.content }</textarea>
		                    	</td>
		                    </tr>
			                </tbody>
			            </table>
			            <div class="btnSet"  style="text-align:right;">
			                <a class="btn" href="javascript:;">닫기 </a>
			            </div>
		            </form>
	        </div>    
        </div>
        <!-- id contner -->        
    </div> <!-- div id="wrap" -->
  
    

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