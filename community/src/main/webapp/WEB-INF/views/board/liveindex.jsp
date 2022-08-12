<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>공지사항 | 고객센터 | 투어리스트인투어</title>
    <link rel="stylesheet" href="/pet/css/common.css">
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/pet/js/function.js"></script>
    <script type="text/javascript" src="/pet/js/location.js"></script>
	</head>

<style>
	#columns{
        column-width:200px;
        column-gap: 15px;
      }
      #columns figure{
        display: inline-block;
        border:1px solid rgba(0,0,0,0.2);
        margin:0;
        margin-bottom: 15px;
        padding:10px;
        display: inline-block;
      }
      #columns figure img{
        width:100%;
      }
      #columns figure figcaption{
        border-top:1px solid rgba(0,0,0,0.2);
        padding:10px;
        margin-top:11px;
      }

</style>
  <body>
    <div class="container">
        <!-- 위치(페이지 제목)영역 -->
        <div class="location_area customer">
            <div class="box_inner">
                <h2 class="tit_page">
                    <span>생활게시판</span>
                </h2>
                <p class="location">
                    고객센터
                    <span class="path">/</span> 
                    공지사항
                </p>
            </div>
        </div>
		
		<!-- 공지사항 목록영역 -->
        <div class="bodytext_area box_inner">
            <form action="#" method="post" class="minisrch_form">
                <fieldset>
                    <legend>
                        검색
                    </legend>
                    <input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요." name="">
                    <a href="#" class="btn_srch">검색</a>
                </fieldset>
            </form>
                <p><span><strong>총 ${data.totalCount }개</strong>  |  ${boardVO.page }/${data.totalPage }페이지</span></p>
            <div>
            	<select name="sido1" id="sido1"></select>
				<select name="gugun1" id="gugun1"></select>
            </div>
                
            <div class="btnSet"  style="text-align:right;">
           		<a class="btn" href="livewrite.do">글작성 </a>
            </div>
        	
        	<div id="columns">
        	<c:forEach var="vo" items="${data.list }" varStatus="status">
		      <figure display: inline-block;>
		      	<c:if test="${!empty vo.filename_real }">
		        	<img src="${vo.filename_real }">
		        </c:if>
		        <c:if test="${empty vo.filename_real }">
	                <img src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg">
	            </c:if>
		        	<p>${vo.title }</p>
		      </figure>
		    </c:forEach>   
		    </div>  
    	</div> <!-- /container -->
	</div>
</body>
</html>