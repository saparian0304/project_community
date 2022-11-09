<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src="/pet/js/function.js"></script>
	<script>

		
		
		function total_search(sort, order) {
			
			$('#sort').val(sort);
			$('#order').val(order);
			
			$("#minisrch_form").submit();  //form태그만 submit 가능.
			
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
	
		<!--  검색영역 -->
		<div  style="width:1280px; margin:20px auto;">
			<form action="#" id="minisrch_form" method="get" class="minisrch_form">
				 
				<!-- <input type="hidden" name="horse_hair" id="horse_hair" value="">
				  -->
				<input type="hidden" name="sort" id="sort" value="">
				<input type="hidden" name="order" id="order" value="">
				<fieldset>
					<span class="select_all"> 
						
						<select id="horse_hair" name="horse_hair" class="hSelect" title="말머리검색">
							<option value="">전체</option>
 							<option value='5'<c:if test="${param.horse_hair eq '5' }">selected</c:if>>정보공유</option>
							<option value='6'<c:if test="${param.horse_hair eq '6' }">selected</c:if>>여행후기</option>
							<option value='7'<c:if test="${param.horse_hair eq '7' }">selected</c:if>>고민상담</option>
							<option value='4'<c:if test="${param.horse_hair eq '4' }">selected</c:if>>잡담</option>
							
						</select>
					
						<select id="stype" name="stype" class="dSelect" title="검색분류 선택">
							<option value="all">전체</option>
							<option value="title"<c:if test="${stype eq 'title' }">selected</c:if>>제목</option>
							<option value="content"<c:if test="${stype eq 'content' }">selected</c:if>>내용</option>
						</select> 
						<legend> 검색 </legend> 
						<input type="text" class="tbox" id="sval" name="sword" value="${sword }"
								onkeypress="if (event.keyCode==13) total_search();"
								title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요." name=""> 
						<a href="javascript:total_search($('#horse_hair').val())" class="btn_srch">검색</a>
					</span>	
				</fieldset>					
			</form>
		</div>
		<div style="width:1280px; margin: 0 auto;">
			<div  style="width:1260px;">
				<p>
					<span><strong>총 ${pageMaker.totalCount }개</strong> | ${boardVO.page }/${pageMaker.totalPage }페이지</span>
				</p>
			</div>			
				
				<div class="list_up">
				<!-- 검색란 체크시 출력-->
					<p id="search_str" >
						<a id="date_desc" onclick="total_search('regdate', 'desc')" >최신순</a>
						<a id="rec_count" onclick="total_search('rec_count', 'desc')" >추천순</a>
						<a id="reply_count" onclick="total_search('reply_count', 'desc')" >댓글많은순</a>
					</p>
					
				<c:if test="${empty loginInfo }">
					<div class="btnSet" style="float:right;">
						<a class="btn" href="/pet/member/login.do">글작성 </a>
					</div>
					</c:if>
		
					<c:if test="${!empty loginInfo }">
						<div class="btnSet" style="float:right;">
							<a class="btn" href="/pet/board/freewrite.do">글작성 </a>
						</div>
					</c:if>
				</div>
			<div style="clear:both;">		
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
								<p class="list_content"><c:if test="${vo.horse_hair eq '4'}">[잡담]</c:if>
								<c:if test="${vo.horse_hair eq '5'}">[정보공유]</c:if>
								<c:if test="${vo.horse_hair eq '6'}">[여행후기]</c:if>
								<c:if test="${vo.horse_hair eq '7'}">[고민상담]</c:if>  ${vo.title }</p>
							</div>
							<div style="width: 49%; float: right; text-align: right;">
								<i class="fa fa-eye"></i> ${vo.viewcount}
								<img style="width: 15px; height: 15px;" src="https://previews.123rf.com/images/captainvector/captainvector1512/captainvector151209976/81535071-%EB%8C%93%EA%B8%80-%EC%95%84%EC%9D%B4%EC%BD%98.jpg">${vo.reply_count }
								<img style="width: 15px; height: 15px;" src="/pet/img/icon_like_black.png"> ${vo.rec_count }
							</div>
						</figure>
					</div>
				</c:forEach>
			</div>	
		</div>
		<!-- 페이지처리 -->
		<div class="pagenation" style="clear: left;">
			<a style="cursor: pointer" class="firstpage pbtn" href="freeindex.do?horse_hair=${param.horse_hair }&page=1&stype=${param.stype}&sword=${param.sword}&sort=${param.sort}&order=${param.order}">
		        <img src="/pet/img/btn_firstpage.png" alt="제일 페이지로">
		    </a>
			<c:if test="${pageMaker.prev == true}">
				<a class="prevpage pbtn" href="freeindex.do?horse_hair=${param.horse_hair }&page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}&&sort=${param.sort}&order=${param.order}">
				<img src="/pet/img/btn_prevpage.png" alt="앞 페이지로 이동">
				</a>
			</c:if>
			<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
				<a href='freeindex.do?horse_hair=${param.horse_hair }&page=${p }&stype=${param.stype}&sword=${param.sword}&sort=${param.sort}&order=${param.order}'
					class='pagenum <c:if test="${boardVO.page == p }"> currentpage</c:if>'>${p }</a>
			</c:forEach>
			<c:if test="${pageMaker.next == true}">
				<a class="nextpage pbtn" href="freeindex.do?horse_hair=${param.horse_hair }&page=${pageMaker.endPage +1}&stype=${param.stype}&sword=${param.sword}&sort=${param.sort}&order=${param.order}">
				<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
				</a>
			</c:if>
			<a style="cursor: pointer" class="lastpage pbtn" href="freeindex.do?horse_hair=${param.horse_hair }&page=${pageMaker.totalPage}&stype=${param.stype}&sword=${param.sword}">
		        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
		    </a>
		</div>
	</div>
</div>
</body>
</html>