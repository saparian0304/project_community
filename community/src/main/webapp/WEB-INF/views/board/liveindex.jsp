<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var loc = "${param.sido1}";  //지역 selectbox에서 선택값 유지
	var loc_gugun ="${param.gugun1}";  //지역 selectbox에서 선택값 유지
</script>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <script src="/pet/js/function.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <!-- header에 js파일 있음. 확인해보고 script 쓰기!!!! -->
<script>
	$(function() {
		$("select[name=sido1]").trigger("change"); // '구/군'선택값 유지하기위해 강제로 '시/도'바꿔주는 역할.
	})
	function total_search(sort, order) {
		
		if($("#sido1").val() == "시/도 선택"){
			
			$('#sido1').val(""); //  "시/도 선택"이라는 값이 선택되면 sido1이 동작을 멈추게 하는 코드
		}
		if($("#gugun1").val() == "구/군 선택"){
			
			$('#gugun1').val("");
		}
		$('#sort').val(sort);
		$('#order').val(order);
		
		$("#minisrch_form").submit(); // 폼을 전송. 파라미터를 폼안에 있는 히든에 넣어주기(+검색어까지 같이 사용하기위해)
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
			width: 250px;
		}
		ul.tabs{
			margin: 0px;
			padding: 0px;
			list-style: none;
		}
		ul.tabs li{
			background: none;
			 color: #222;
			  display: inline-block;
			  padding: 10px 15px;
			  cursor: pointer;
		}
		ul.tabs li.current{
		  background: #ededed;
		  color: #222;
		}
		
		.tab-content{
		  display: none;  
		  padding: 15px 0;
		  border-top:3px solid #eee;
		}
		
		.tab-content.current{
		  display: inherit;
		}
		
		
		
		
	</style>
	
	</head>
	
	<!-- <ul class="skipnavi">
		<li><a href="#container">본문내용</a></li>
	</ul> -->
<div id="wrap">
	
	<div class="container">
		<!-- 위치(페이지 제목)영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">
					<span>생활게시판</span>
				</h2>
			</div>
		</div>

		<!-- 검색영역 -->
		<div  style="width:1280px; margin:20px auto;"><!-- class="bodytext_area box_inner" -->
			<form action="#" id="minisrch_form" method="get" class="minisrch_form">
				<!-- <input type="hidden" name="horse_hair" id="horse_hair" value="">		 -->	
				<input type="hidden" name="sort" id="sort" value="">
				<input type="hidden" name="order" id="order" value="">
				<fieldset>
					<span class="select_all">
						<select name="sido1" id="sido1" title="시/도"></select>
						<select name="gugun1" id="gugun1" title="구/군"></select>
				 	
						<select id="horse_hair" name="horse_hair" class="hSelect" title="말머리검색">
							<option value="">전체</option>
							<option value='1'<c:if test="${param.horse_hair eq '1' }">selected</c:if>>음식점</option>
							<option value='2'<c:if test="${param.horse_hair eq '2' }">selected</c:if>>관광지</option>
							<option value='3'<c:if test="${param.horse_hair eq '3' }">selected</c:if>>병원</option>
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
					<span><strong>총 ${pageMaker.totalCount }개</strong> |
						${boardVO.page }/${pageMaker.totalPage }페이지</span>
				</p>			
			</div>
			
			
			<!-- 탭 부분 -->
			
			<!-- 순 -->
			<div class="list_up" >
					<!-- 검색란 체크시 출력-->
					<p id="search_str" >
						<a id="date_desc" onclick="total_search('regdate', 'desc')" >최신순</a>
						<a id="rec_count" onclick="total_search('rec_count', 'desc')" >추천순</a>
						<a id="reply_count" onclick="total_search('reply_count', 'desc')" >댓글많은순</a>
					</p>
				
					<%-- <c:if test="${!empty loginInfo }">
					</c:if>
					<c:if test="${loginInfo.member_no == 1}">
						<div class="btnSet"  style="float:right;">
			           		<a class="btn" href="livewrite.do">글작성 </a>
			            </div>
			        </c:if> --%>
		        
			</div>
			<div style="clear:both;">
	            <c:if test="${empty data.list }">
	                <tr>
	                    <td class="first" colspan="5">등록된 글이 없습니다.</td>
	                </tr>
	            </c:if>
				<c:forEach var="vo" items="${data.list}" varStatus="status">
					<div id="list">
						<figure id="figure" onclick="location.href='liveview.do?board_no=${vo.board_no }';">
							<c:if test="${!empty vo.filename_real }">
								<img src="${vo.filename_real}" 
									onerror='this.src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"'>
							</c:if> 
							<c:if test="${empty vo.filename_real}">
								<img  
									src="/pet/img/manggo1.jpg">
							</c:if>
						    <%-- <c:if test="${empty vo.filename_real}">
								<img src="/pet/upload/${vo.filename_real }"
									onerror='this.onerror=null; this.src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"'>
							</c:if> --%>
	
							<div class="s21_tour_list_tbox" style="width: 50%; float: left;">
								<p class="list_content"><c:if test="${vo.horse_hair eq '1'}">[음식점]</c:if>
								<c:if test="${vo.horse_hair eq '2'}">[관광지]</c:if>
								<c:if test="${vo.horse_hair eq '3'}">[병원]</c:if>  ${vo.title }</p>
							<%-- 	<p class="list_content"><c:if test="${vo.horse_hair eq '2'}">[관광지]</c:if>${vo.title }</p>
								<p class="list_content"><c:if test="${vo.horse_hair eq '3'}">[병원]</c:if>${vo.title }</p> --%>
								<p class="list_content">${vo.content}</p>
								
							</div>
							<div style="width: 49%; float: right; text-align: right;">
								<i class="fa fa-eye"></i> ${vo.viewcount}
								<img style="width: 15px; height: 15px;" src="https://previews.123rf.com/images/captainvector/captainvector1512/captainvector151209976/81535071-%EB%8C%93%EA%B8%80-%EC%95%84%EC%9D%B4%EC%BD%98.jpg">${vo.reply_count }
								<img style="width: 15px; height: 15px;" src="/pet/img/icon_like_black.png">${vo.reply_count }
								
							</div>
						</figure>
					</div>			
				</c:forEach>
			</div>
		</div>		
			
			<!-- 페이징처리  -->
            
          <div class="pagenation" style="clear: left;">
          <c:if test ="${!empty data.list }">
          	 <a style="cursor:pointer" href="liveindex.do?horse_hair=${param.horse_hair }&page=1&stype=${param.stype}&sword=${param.sword}&sort=${param.sort}&order=${param.order}" class="firstpage pbtn">
          	 	<img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 ">
          	 </a>
			 <c:if test="${pageMaker.prev == true }">
				<a class="prevpage pbtn" href="liveindex.do?horse_hair=${param.horse_hair}&page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}&sort=${param.sort}&order=${param.order}">
				<img src="/pet/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
			</c:if>
			<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
				<a href='liveindex.do?horse_hair=${param.horse_hair}&page=${p }&stype=${param.stype}&sword=${param.sword}&sort=${param.sort}&order=${param.order}'
					class='pagenum <c:if test="${boardVO.page ==p }">currentpage</c:if>'>${p }</a>
			</c:forEach>
			<c:if test="${pageMaker.next == true }">
				<a class="nextpage pbtn" href="liveindex.do?horse_hair=${param.horse_hair}&page=${pageMaker.endPage+1}&stype=${param.stype}&sword=${param.sword}&sort=${param.sort}&order=${param.order}">
				<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
				</a>
			</c:if>
			<a style="cursor: pointer" class="lastpage pbtn" href="liveindex.do?horse_hair=${param.horse_hair }&page=${pageMaker.totalPage}&stype=${param.stype}&sword=${param.sword}">
			    <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지로 ">
	  		</a>
	  	   </c:if>
		   </div>
		</div>
	</div>
		<!-- /container -->
	
</body>
</html>