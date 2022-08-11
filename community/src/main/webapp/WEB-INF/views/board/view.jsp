<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	      function del(no) {
				if(confirm('삭제하시겠습니까?')){
					location.href='/board/delete.do?board_no='+no;
				}
			}
	      
	    /*   $("#sido1 option:selected").val();
	      $("#gugun1 option:selected").val(); */
	      
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
                </div>
            </div> 
            <div class="sub">
            <div class="size">
                <h3 class="sub_title">게시판</h3>
                <div class="bbs">
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
                            
                            
                            <%-- <a href="javascript:del(${data.board_no})" class="btn">삭제</a> --%>
                        </div>
                    </div>
                   </div>
                  </div>
        </div>
        <!-- id contner -->
        
    </div> <!-- div id="wrap" -->

</body>
</html>