<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

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
                        <span>동물보호소</span>
                    </h2>
                </div>
            </div> 
            <!-- 공지사항 목록영역 -->
            <div class="bodytext_area box_inner" style="width: 70%">
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
               <!--  <div>
                	<select name="sido1" id="sido1"></select>
					<select name="gugun1" id="gugun1"></select>
                </div> -->
                
                <div class="btnSet"  style="text-align:right;">
               		<a class="btn" href="freewrite.do">글작성 </a>
                </div>
                <!-- **** -->
                <table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
                    <caption class="hdd">공지사항 목록</caption>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">조회수</th>
                            <th scope="col">작성자</th>
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
                            <td>${data.totalCount-status.index-(boardVO.page-1)*boardVO.pageRow }<!-- 총개수 - 인덱스-(현재페이지번호-1)*페이지당개수 --> </td>
                            <td class="txt_l">
                                <a href="view.do?board_no=${vo.board_no }">${vo.title} [${ vo.reply_count}]</a>
                            </td>
                            <td>
                            	${vo.viewcount }
                            </td>
                            <td class="writer">
                            	${vo.memb_nickname }
                            </td>
                            
                            <td class="date"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        </tr>
						</c:forEach>
                    </tbody>
                </table>
                    <div class="pagenate clear">
                        <ul class='paging'>
                        <c:if test="${data.prev == true }">
                        	<li><a href="freeindex.do?page=${data.startPage-1 }&stype=${param.stype}&sword=${param.sword}"><</a>
                        </c:if>
                        <c:forEach var="p" begin="${data.startPage }" end="${data.endPage -1}">
                            <li><a href='freeindex.do?page=${p }&stype=${param.stype}&sword=${param.sword}' <c:if test="${boardVO.page == p }">class='current'</c:if>>${p }</a></li>
                        </c:forEach>
                        <c:if test="${data.next == true }">
                        	<li><a href="freeindex.do?page=${data.endPage+1 }">></a></li>
                        </c:if>
                        </ul> 
                    </div>
                
                    <!-- 페이지처리 -->
                 
                </div>
            </div>
        </div> 
</body>
</html>