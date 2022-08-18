<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/pet/js/function.js"></script>
    <script type="text/javascript" src="/pet/js/location.js"></script>
	<script>
		$("#columns").click(function(){
			alert("되나요?")
		});
	</script>
	
	
	</head>

<!--이미지 4줄로 나오게 함-->
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
        height:300px;
        width:100%;
        box-sizing: border-box;
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
		<div class="bodytext_area box_inner">
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
			
		
			<div id="columns">
				<c:forEach var="vo" items="${data.list }" varStatus="status">
					<figure id="figure"
						onclick="location.href='view.do?board_no=${vo.board_no }';">
						<c:if test="${!empty vo.filename_org }">
							<img src="${vo.filename_org}">
						</c:if>
						<c:if test="${empty vo.filename_org}">
							<img
								src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg">
						</c:if>
						<div class="leftArea">
						<div>제목 : ${vo.title }</div>
						<div>글번호 : ${vo.board_no }</div>
						<div>조회수 : ${vo.viewcount }</div>
						<div>작성자 : ${vo.memb_nickname }</div>
						<div>등록일자 : ${vo.regdate }<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
						<div class="rightArea" style="text-align: right">
						<i class="fa-solid fa-list"></i>
						</div>
					</figure>
				</c:forEach>
				  <tbody>
                        <c:if test="${empty data.list }">
                            <tr>
                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:if test="${!empty data.list }">
	                        <c:forEach var="vo" items="${data.list }" varStatus="status">
	                        <tr>
	                        <td>${data.totalCount-status.index-(boardVO.page-1)*boardVO.pageRow}<!--" 총개수-인덱스-(현재페이지번호-1)*페이지당개수 "--></td>
	                          
	                        </tr>
							</c:forEach>
						</c:if>
                    </tbody>
			</div>
			
			<div class="btnSet" style="text-align: right;">
				<a class="btn" href="livewrite.do">글작성 </a>
			</div>

		</div>
		<!-- /container -->
	</div>
</body>
</html>