<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/pet/js/function.js"></script>
    <script type="text/javascript" src="/pet/js/location.js"></script>
<script>
 	
	$(function() {
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
			
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
			
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		
		})
	}) 
	
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

		<!-- 공지사항 목록영역 -->
		<div class="bodytext_area box_inner" style="width:80%">
			<form action="#" method="post" class="minisrch_form">
				<fieldset>
					<legend> 검색 </legend>
					<input type="text" class="tbox" title="검색어를 입력해주세요"
						placeholder="검색어를 입력해주세요." name=""> <a href="#"
						class="btn_srch">검색</a>
				</fieldset>
			</form>
			<p>
				<span><strong>총 ${pageMaker.totalCount }개</strong> |
					${boardVO.page }/${pageMaker.totalPage }페이지</span>
			</p>
			
			<!-- 탭 부분 -->
			<ul class="tabs">
				<li class="tab-link current" data-tab = "tab-1">음식점</li>
				<li class="tab-link" data-tab = "tab-2">공원</li>
				<li class="tab-link" data-tab = "tab-3">병원</li>
			</ul>
			
			<div id="tab-1" class="tab-content current" >
				음식점입니당
			</div>
			<div id="tab-2" class="tab-content current" >
				공원입니당
			</div>
			<div id="tab-1" class="tab-content current" >
				병원입니당
			</div>
			 
            <c:if test="${empty data.list }">
                <tr>
                    <td class="first" colspan="5">등록된 글이 없습니다.</td>
                </tr>
            </c:if>
			<c:forEach var="vo" items="${data.list}" varStatus="status">
				<div id="list">
					<figure id="figure" style="width:200px" onclick="location.href='view.do?board_no=${vo.board_no }';">
						<c:if test="${!empty vo.filename_org }">
							<img src="${vo.filename_org}" onerror='this.src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"'>
						</c:if> 
					    <c:if test="${empty vo.filename_org}">
							<img src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg" style="">
						</c:if>
						
							<div class="s21_tour_list_tbox">
									<h4 class="list_title">${vo.title }</h4>
									<p class="list_content">${vo.content}</p>

									<!-- <div class="s21_desc" onclick="">
										<div class="s21_d_comment"><p class="icon_comment">댓글</p>0</div>
										<div class="s21_d_heart"><p class="icon_heart">좋아요</p>0</div>
										<div class="s21_d_div">
											<div class="s21_d_location">대전 <p class="icon_location">위치</p>0km</div>
										</div>
								   </div> -->
								</div>
							<div>하트이미지 북마크이미지</div>
					</figure>
				</div>			
			</c:forEach>
			
			<!-- <div class="btnSet"  style="text-align:right;">
           		<a class="btn" href="livewrite.do">글작성 </a>
            </div> -->
			
			<!-- 페이징처리  -->
            
          <div class="pagenation" style="clear: left">
          	 <a style="cursor:pointer" class="firstpage pbtn">
          	 	<img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
          	 </a>
				<c:if test="${pageMaker.prev == true }">
					<a class="prevpage pbtn" href="liveindex.do?page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}"><</a>
					<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
				</c:if>
				<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
					<a href='liveindex.do?page=${p }&stype=${param.stype}&sword=${param.sword}'
						class='pagenum <c:if test="${boardVO.page ==p }">currentpage</c:if>'>${p }</a>
				</c:forEach>
				<c:if test="${pageMaker.next == true }">
					<a class="nextpage pbtn" href="liveindex.do?page=${pageMaker.endPage +1}">
					<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
					</a>
				</c:if>
				<a style="cursor: pointer"  
			    	class="lastpage pbtn">
			        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
   				</a>
		   </div>
		</div>
	</div>
		<!-- /container -->
	</div>
</body>
</html>