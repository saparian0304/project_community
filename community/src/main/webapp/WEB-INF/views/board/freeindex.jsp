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
			height:250px;
			margin: 10px;
			float: left;
		}
		
		#list figure img {
			width: 100%;
			height: 150px;
		}
			
	</style>
	



<ul class="skipnavi">
	<li><a href="#container">본문내용</a></li>
</ul>
<div id="wrap">
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
	
	
			<c:if test="${empty loginInfo }" >
			<div class="btnSet" style="text-align: right;">
				<a class="btn" href="/pet/member/login.do">글작성 </a>
			</div>
			</c:if>

			<c:if test="${!empty loginInfo }" >
			<div class="btnSet" style="text-align: right;">
				<a class="btn" href="freewrite.do">글작성 </a>
			</div>
			</c:if>
			
			<c:if test="${empty data.list }">
				<tr>
					<td class="first" colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="vo" items="${data.list}" varStatus="status">
				<div id="list">
					<figure id="figure"
						onclick="location.href='freeview.do?board_no=${vo.board_no }';">
						<!-- 이미지가 upload에 들어가 있거나 D:\kdigital\java\workspace1\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\community\upload 여기 경로
						톰캣clear하면 후자 내용 초기화-->
						<c:if test="${!empty vo.filename_real }">
							<img src="/pet/upload/${vo.filename_real }" style="height: 150px"
								onerror='this.onerror=null; this.src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"'>
						</c:if>
						<c:if test="${empty vo.filename_real}">
							<img  
								src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg">
						</c:if>
						<div>${vo.title }</div>
						<div class="leftArea">
							<div>${vo.board_no }</div>
							<div>조회수 : ${vo.viewcount }</div>
							<div>회원 : ${vo.nickname }</div>
						</div>
						<div class="rightArea" style="text-align: right">
							<!-- 좋아요 댓글 이미지 -->
						</div>
					</figure>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- **** -->
<div class="pagenation" style="clear: left">
	<a style="cursor: pointer" class="firstpage pbtn">
        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
    </a>
	<c:if test="${pageMaker.prev == true }">
		<a class="prevpage pbtn" href="freeindex.do?page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}">
		<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
		</a>
	</c:if>
	<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
		<a href='freeindex.do?page=${p }&stype=${param.stype}&sword=${param.sword}'
			class='pagenum <c:if test="${boardVO.page == p }"> currentpage</c:if>'>${p }</a>
	</c:forEach>
	<c:if test="${pageMaker.next == true }">
		<a class="nextpage pbtn" href="freeindex.do?page=${pageMaker.endPage +1}">
		<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
		</a>
	</c:if>
	<a style="cursor: pointer"  
    	class="lastpage pbtn">
        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
    </a>
</div>

<!-- 페이지처리 -->


		<p>
			<span><strong>총 ${data.totalCount }개</strong> | ${boardVO.page }/${data.totalPage }페이지</span>
		</p>





		
</body>
</html>