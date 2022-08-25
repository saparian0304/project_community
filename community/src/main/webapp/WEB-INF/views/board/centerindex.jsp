<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<script src="/pet/js/function.js"></script>
<script>

/* 	function loc_search(val){
		if(val == ''){
			$("#sido1").val('');
		}else{
			$("#sodo1").val(val);	
		}
	} */
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
					<span>동물보호소</span>
				</h2>
			</div>
		</div>
		<!-- 목록영역 -->
		<div class="bodytext_area box_inner" style="width: 70%">
			<form action="#" id="minisrch_form" method="get" class="minisrch_form">
				<fieldset>
					<div class="selectSi_gu">
						<select name="sido1" id="sido1"></select>
						<select name="gugun1" id="gugun1"></select>
					</div>
					<span>
					<select id="stype" name="stype" class="dSelect" title="검색분류 선택">
						<option value="all">전체</option>
						<option value="title"<c:if test="${stype eq 'title' }">selected</c:if>>제목</option>
						<option value="content"<c:if test="${stype eq 'content' }">selected</c:if>>내용</option>
					</select> 
					<legend> 검색 </legend>
					<input type="text" class="tbox" id="sval" name="sword" value="${sword }" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요." name=""> 
					<a href="#" class="btn_srch">검색</a>
					</span>
				</fieldset>
			</form>
			<p>
				<span><strong>총 ${pageMaker.totalCount }개</strong> |
					${boardVO.page }/${pageMaker.totalPage }페이지</span>
			</p>

			<c:if test="${empty loginInfo }" >
			</c:if>
			<c:if test="${!empty loginInfo }" >
			<div class="btnSet" style="text-align: right;">
				<a class="btn" href="centerwrite.do">글작성 </a>
			</div>
			</c:if>
			
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
							<td>${data.totalCount-status.index-(boardVO.page-1)*boardVO.pageRow }<!-- 총개수 - 인덱스-(현재페이지번호-1)*페이지당개수 -->
							</td>
							<td class="txt_l"><a href="centerview.do?board_no=${vo.board_no }">${vo.title}
									[${ vo.reply_count}]</a></td>
							<td>${vo.viewcount }</td>
							<td>${vo.nickname }</td>
							<%-- <td class="writer">${vo.memb_nickname }</td> --%>

							<td class="date"><fmt:formatDate value="${vo.regdate }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagenation" style="clear: left">
				<a style="cursor: pointer" class="firstpage pbtn">
			        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
			    </a>
				<c:if test="${pageMaker.prev == true }">
					<a class="prevpage pbtn" href="centerindex.do?page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}">
					<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
					</a>
				</c:if>
				<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
					<a href='centerindex.do?page=${p }&stype=${param.stype}&sword=${param.sword}'
						class='pagenum <c:if test="${boardVO.page == p }"> currentpage</c:if>'>${p }</a>
				</c:forEach>
				<c:if test="${pageMaker.next == true }">
					<a class="nextpage pbtn" href="centerindex.do?page=${pageMaker.endPage +1}">
					<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
					</a>
				</c:if>
				<a style="cursor: pointer"  
			    	class="lastpage pbtn">
			        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
			    </a>
			</div>
			<!-- 페이지처리 -->

		</div>
	</div>
</div>
</body>
</html>