<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <script src="/pet/js/function.js"></script>
	<script>

		function horse_hairSearch(val) {
			if(val == '') {
				$("#horse_hair").val('');
			} else {
				$("#horse_hair").val(val); // 파라미터를 폼안에 있는 히든에 넣어주기(말머리+검색어까지 같이 사용하기위해)
			}
			
			$("#minisrch_form").submit(); // 폼을 전송
		}
		
	</script>
	
	<style>
		#list {
			border-style : block;
			width: 300px;
			margin: 10px;
			float: left;
		}
		
		#list figure img {
			width: 100%;
			height: 200px;
			cursor: pointer;
		}
		
		.list_content {
			overflow:hidden;
			text-overflow:ellipsis;
			white-space:nowrap;
			width: 170px;
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
	
		<!--  목록영역 -->
	<div class="bodytext_area box_inner" style="width:80%">
		<form action="#" id="minisrch_form" method="get" class="minisrch_form">
			<input type="hidden" name="horse_hair" id="horse_hair" value="">
			<fieldset>
				<span> 
				<select id="stype" name="stype" class="dSelect" title="검색분류 선택">
						<option value="all">전체</option>
						<option value="title"<c:if test="${stype eq 'title' }">selected</c:if>>제목</option>
						<option value="content"<c:if test="${stype eq 'content' }">selected</c:if>>내용</option>
				</select> 
				<legend> 검색 </legend> 
				<input type="text" class="tbox" id="sval" name="sword" value="${sword }"
					onkeypress="if (event.keyCode==13) horse_hairSearch('${param.horse_hair }');"
					title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요." name=""> 
				<a href="javascript:horse_hairSearch('${param.horse_hair }')" class="btn_srch">검색</a>
				</span>

				</fieldset>
				
				
			</form>
			<DIV>

		<p>
			<span><strong>총 ${pageMaker.totalCount }개</strong> | ${boardVO.page }/${pageMaker.totalPage }페이지</span>
		</p>

		<!-- 탭 부분 -->		
		
				 <table style="width: 707px; cellspacing:0; cellpadding:0; border:0; align:center; margin-top: 30px;" >
				  <tr>
				  
				   <td><a href="javascript:horse_hairSearch('');">전체</a></td>
				   <td><a href="javascript:horse_hairSearch('6');">여행후기</a></td>
				   <td><a href="javascript:horse_hairSearch('5');">정보공유</a></td>
				   <td><a href="javascript:horse_hairSearch('7');">고민상담</a></td>
				   <td><a href="javascript:horse_hairSearch('4');">잡담</a></td>
				       
				  </tr>
				  <tr><td  colspan=4 align=center style='padding-top:20px;'></td></tr>
				</table>
			</DIV>

		<c:if test="${empty loginInfo }">
			<div class="btnSet" style="text-align: right;">
				<a class="btn" href="/pet/member/login.do">글작성 </a>
			</div>
		</c:if>

		<c:if test="${!empty loginInfo }">
			<div class="btnSet" style="text-align: right;">
				<a class="btn" href="/pet/board/freewrite.do">글작성 </a>
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
							<img src="/pet/upload/${vo.filename_real }"
								onerror='this.onerror=null; this.src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"'>
						</c:if>
						<c:if test="${empty vo.filename_real}">
							<img  
								src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg">
						</c:if>
						<div class="s21_tour_list_tbox" style="width: 50%; float: left;">
							<p class="list_content">제목 : ${vo.title }</p>
							<p class="list_content">조회수 : ${vo.viewcount }</p>
						</div>
						<div style="width: 49%; float: right; text-align: right;">
							<img style="width: 15px; height: 15px;" src="https://previews.123rf.com/images/captainvector/captainvector1512/captainvector151209976/81535071-%EB%8C%93%EA%B8%80-%EC%95%84%EC%9D%B4%EC%BD%98.jpg">${vo.rep }
							<img style="width: 15px; height: 15px;" src="/pet/img/icon_like_black.png">${vo.rec }
						</div>
					</figure>
				</div>
			</c:forEach>
		</div>
		<div class="pagenation" style="clear: left">
			<a style="cursor: pointer" class="firstpage pbtn">
		        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
		    </a>
			<c:if test="${pageMaker.prev == true }">
				<a class="prevpage pbtn" href="freeindex.do?horse_hair=${param.horse_hair }&page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}">
				<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
				</a>
			</c:if>
			<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
				<a href='freeindex.do?horse_hair=${param.horse_hair }&page=${p }&stype=${param.stype}&sword=${param.sword}'
					class='pagenum <c:if test="${boardVO.page == p }"> currentpage</c:if>'>${p }</a>
			</c:forEach>
			<c:if test="${pageMaker.next == true }">
				<a class="nextpage pbtn" href="freeindex.do?horse_hair=${param.horse_hair }&page=${pageMaker.endPage +1}">
				<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
				</a>
			</c:if>
			<a style="cursor: pointer" class="lastpage pbtn">
		        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
		    </a>
		</div>
	</div>
</div>

<!-- 페이지처리 -->


<!-- -->

</body>
</html>