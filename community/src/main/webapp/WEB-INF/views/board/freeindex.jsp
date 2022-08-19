<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/pet/js/function.js"></script>
    <script type="text/javascript" src="/pet/js/location.js"></script>
	<style>
		#list {
			border: 1px solid;
			width: 200px;
			margin: 10px;
			float: left;
		}
		
		#list figure img {
			width: 100%
		}
			
	</style>
	
	</head>



<ul class="skipnavi">
	<li><a href="#container">본문내용</a></li>
</ul>
<div id="wrap"></div>
<div class="container">
	<!-- 위치(페이지 제목)영역 -->
	<div class="location_area customer">
		<div class="box_inner">
			<h2 class="tit_page">
				<span>자유게시판</span>
			</h2>
		</div>
	</div>

	<!-- 공지사항 목록영역 -->
	<div class="bodytext_area box_inner">
		<form action="#" method="post" class="minisrch_form">
			<fieldset>
				<legend> 검색 </legend>
				<input type="text" class="tbox" title="검색어를 입력해주세요"
					placeholder="검색어를 입력해주세요." name=""> <a href="#"
					class="btn_srch">검색</a>
			</fieldset>
		</form>

		<div>
			<input type="checkbox" name="best" value="4">best <input
				type="checkbox" name="review" value="5">여행후기 <input
				type="checkbox" name="recommand" value="6">맛집추천 <input
				type="checkbox" name="worry" value="7">고민
		</div>

		<p>
			<span><strong>총 ${data.totalCount }개</strong> | ${boardVO.page }/${data.totalPage }페이지</span>
		</p>



		<div class="btnSet" style="text-align: right;">
			<a class="btn" href="freewrite.do">글작성 </a>
		</div>

		<form action="liveindex.do">
			<input type="submit" name="horse_hair" value="3">
		</form>

		<c:forEach var="vo" items="${data.list}" varStatus="status">
			<div id="list">
				<figure id="figure"
					onclick="location.href='freeview.do?board_no=${vo.board_no }';">
					<c:if test="${!empty vo.filename_org }">
						<img src="${vo.filename_org}"
							onerror='this.src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"'>
					</c:if>
					<c:if test="${empty vo.filename_org}">
						<img
							src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg">
					</c:if>
					<div class="leftArea">
						<div>${vo.title }</div>
						<div>${vo.board_no }</div>
					</div>
					<div class="rightArea" style="text-align: right"></div>
				</figure>
			</div>
		</c:forEach>
	</div>
	<!-- /container -->
</div>
<!-- **** -->
<div class="pagenate clear">
	<ul class='paging'>
		<c:if test="${data.prev == true }">
			<li><a
				href="freeindex.do?page=${data.startPage-1 }&stype=${param.stype}&sword=${param.sword}"><</a>
		</c:if>
		<c:forEach var="p" begin="${pageMaker.startPage }"
			end="${pageMaker.endPage}">
			<li><a
				href='freeindex.do?page=${p }&stype=${param.stype}&sword=${param.sword}'
				<c:if test="${boardVO.page == p }">currentpage</c:if>>${p }</a></li>
		</c:forEach>
		<c:if test="${data.next == true }">
			<li><a href="freeindex.do?page=${pageMaker.endPage +1}">></a></li>
		</c:if>
	</ul>
</div>

<!-- 페이지처리 -->
                 
</body>
</html>