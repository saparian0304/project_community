<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>공지사항 | 고객센터 | 투어리스트인투어</title>
      <link rel="stylesheet" href="/pet/css/common.css">
      <link rel="stylesheet" href="/pet/css/reset.css"/>
      <link rel="stylesheet" href="/pet/css/contents.css"/> 
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script type="text/javascript" src="/pet/js/location.js"></script>
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
                        <span>자유게시판</span>
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
                <!-- **** -->
                <table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
                    <caption class="hdd">공지사항 목록</caption>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">조회수</th>
                            <th scope="col">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty data.list }">
                            <tr>
                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="vo" items="${data.list }" varStatus="status">
                        <tr>
                            <td>${data.totalCount-status.index-(boardVO.page-1)*boardVO.pageRow }<!-- 총개수 - 인덱스-(현재페이지번호-1)*페이지당개수 --></td>
                            <td class="txt_l">
                                <a href="view.do?board_no=${vo.board_no }">${vo.title} ["댓글 수"]</a><%-- ${ vo.comment_count} --%>
                            </td>
                            <td>
                            	${vo.viewcount }
                            </td>
                            <td class="date"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        </tr>
						</c:forEach>
                    </tbody>
                </table>

                    <div class="pagenate clear">
                        <ul class='paging'>
                        <c:if test="${data.prev == true }">
                        	<li><a href="index.do?page=${data.startPage-1 }&stype=${param.stype}&sword=${param.sword}"><</a>
                        </c:if>
                        <c:forEach var="p" begin="${data.startPage }" end="${data.endPage }">
                            <li><a href='index.do?page=${p }&stype=${param.stype}&sword=${param.sword}' <c:if test="${boardVO.page == p }">class='current'</c:if>>${p }</a></li>
                        </c:forEach>
                        <c:if test="${data.next == true }">
                        	<li><a href="index.do?page=${data.endPage+1 }&stype=${param.stype}&sword=${param.sword}">></a>
                        </c:if>
                        </ul> 
                    </div>
                
                    <!-- 페이지처리 -->
                    <div class="bbsSearch">
                        <form method="get" name="searchForm" id="searchForm" action="">
                            <span class="srchSelect">
                                <select id="stype" name="stype" class="dSelect" title="검색분류 선택">
                                    <option value="all">전체</option>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                            </span>
                            <span class="searchWord">
                                <input type="text" id="sval" name="sword" value="${param.sword }"  title="검색어 입력">
                                <input type="button" id="" value="검색" title="검색">
                            </span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>