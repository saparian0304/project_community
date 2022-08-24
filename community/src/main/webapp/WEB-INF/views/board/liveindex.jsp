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
			width: 200px;
			margin: 10px;
			float: left;
		}
		
		#list figure img {
			width: 100%
		}
		
		.list_content {
			overflow:hidden;
			text-overflow:ellipsis;
			white-space:nowrap;
			width: 170px;
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

		<!-- 목록영역 -->
		<div>
			<select name="sido1" id="sido1"></select>
			<select name="gugun1" id="gugun1"></select>
		</div>
		<div class="bodytext_area box_inner" style="width:80%">
			<form action="#" id="minisrch_form" method="get" class="minisrch_form">
			<input type="hidden" name="horse_hair" id="horse_hair" value="">
				<fieldset>
				<span>
				   <select id="stype" name="stype" class="dSelect" title="검색분류 선택">
                       <option value="all">전체</option>
                       <option value="title">제목</option>
                       <option value="content">내용</option>
                   </select>
				
				   <legend> 검색 </legend>
				   <input type="text" class="tbox" id="sval" name="sword" value="" onkeypress="if (event.keyCode==13) horse_hairSearch('${param.horse_hair }');" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요." name=""> 
				   <a href="javascript:horse_hairSearch('${param.horse_hair }')" class="btn_srch">검색</a>
                </span>
				</fieldset>
			</form>
			<p>
				<span><strong>총 ${pageMaker.totalCount }개</strong> |
					${boardVO.page }/${pageMaker.totalPage }페이지</span>
			</p>
			
			<div>
				<select name="sido1" id="sido1"></select>
				<select name="gugun1" id="gugun1"></select>
			</div>

			<c:if test="${!empty loginInfo }">
			</c:if>
			<c:if test="${loginInfo.member_no == 1}">
			<div class="btnSet"  style="text-align:right;">
           		<a class="btn" href="livewrite.do">글작성 </a>
            </div>
			
			</c:if>
			<!-- 탭 부분 -->
			
			<DIV>
				 <table  style="margin-top: 30px; width:707px; cellspacing:0; cellpadding:0; border:0; align:center;" >
				  <tr>
				  
				   <td><a href="javascript:horse_hairSearch('');">전체</a></td>
				   <td><a href="javascript:horse_hairSearch('1');">음식점</a></td>
				   <td><a href="javascript:horse_hairSearch('2');">관광지</a></td>
				   <td><a href="javascript:horse_hairSearch('3');">병원</a></td>
				       
				  </tr>
				  <tr><td  colspan=4 align=center style='padding-top:20px;'></td></tr>
				</table>
			</DIV>
			
            <c:if test="${empty data.list }">
                <tr>
                    <td class="first" colspan="5">등록된 글이 없습니다.</td>
                </tr>
            </c:if>
			<c:forEach var="vo" items="${data.list}" varStatus="status">
				<div id="list">
					<figure id="figure" onclick="location.href='liveview.do?board_no=${vo.board_no }';">
						<c:if test="${!empty vo.filename_real }">
							<img src="${vo.filename_real}" onerror='this.src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"'>
						</c:if> 
					    <c:if test="${empty vo.filename_real}">
							<img src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg" style="">
						</c:if>
						
							<div class="s21_tour_list_tbox">
									<h4 class="list_title">${vo.title }</h4>
									<p class="list_content">${vo.content}</p>

									 <div class="s21_desc" onclick="">
										<div class="s21_d_comment"><p class="icon_comment">댓글</p>0</div>
										<div class="s21_d_heart"><p class="icon_heart">좋아요</p>0</div>
								   </div>
								</div>
							<div>하트이미지 북마크이미지</div>
					</figure>
				</div>			
			</c:forEach>
			
			<!-- 페이징처리  -->
            
          <div class="pagenation" style="clear: left">
          	 <a style="cursor:pointer" class="firstpage pbtn">
          	 	<img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 ">
          	 </a>
				<c:if test="${pageMaker.prev == true }">
					<a class="prevpage pbtn" href="liveindex.do?horse_hair=${param.horse_hair}&page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}"><</a>
					<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
				</c:if>
				<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
					<a href='liveindex.do?horse_hair=${param.horse_hair}&page=${p }&stype=${param.stype}&sword=${param.sword}'
						class='pagenum <c:if test="${boardVO.page ==p }">currentpage</c:if>'>${p }</a>
				</c:forEach>
				<c:if test="${pageMaker.next == true }">
					<a class="nextpage pbtn" href="liveindex.do?horse_hair=${param.horse_hair}&page=${pageMaker.endPage +1}">
					<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
					</a>
				</c:if>
				<a style="cursor: pointer" class="lastpage pbtn">
			        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지로 ">
   				</a>
		   </div>
		</div>
	</div>
		<!-- /container -->
	
</body>
</html>