<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<script>
		$("#columns").click(function(){
			alert("되나요?")
		});
	</script>
	
	
	</head>

<!--이미지 4줄로 나오게 함-->
<style>
	#columns{
        column-width:300px;
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
	<ul class="skipnavi">
		<li><a href="#container">본문내용</a></li>
	</ul>
	<div id="wrap">
	</div>
	<div class="container">
		<!-- 위치(페이지 제목)영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">
					<span>생활게시판</span>
				</h2>
			</div>
		</div>

		<!-- 공지사항 목록영역 -->
		<div class="bodytext_area box_inner" style="width: 70%">
			<form action="#" method="post" class="minisrch_form">
				<fieldset>
					<legend> 검색 </legend>
					<input type="text" class="tbox" title="검색어를 입력해주세요"
						placeholder="검색어를 입력해주세요." name=""> <a href="#"
						class="btn_srch">검색</a>
				</fieldset>
			</form>
			<p>
				<span><strong>총 ${data.totalCount }개</strong> |
					${boardVO.page }/${data.totalPage }페이지</span>
			</p>
			<div>
				<select name="sido1" id="sido1"></select> <select name="gugun1"
					id="gugun1"></select>
			</div>

			<div class="btnSet" style="text-align: right;">
				<a class="btn" href="livewrite.do">글작성 </a>
			</div>

			<div id="columns">
				<c:forEach var="vo" items="${data.list }" varStatus="status">
					<figure id="figure"
						onclick="location.href='view.do?board_no=${vo.board_no }';">
						<c:if test="${!empty vo.filename_real }">
							<img src="${vo.filename_real }">
						</c:if>
						<c:if test="${empty vo.filename_real }">
							<img
								src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg">
						</c:if>
						<p>${vo.title }</p>
					</figure>
				</c:forEach>
			</div>
		</div>
		<!-- /container -->
	</div>
</body>
</html>