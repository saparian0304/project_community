<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/pet/css/admin/common.css">
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/> 
	<script type="text/javascript" src="/pet/js/util/reply_hg.js"></script>
	<style>
	input[type='text']{
		width : 150px;
	}
	
	select {
		border:1px solid #cccccc;
		height:32px;
		box-sizing:border-box;
	}
	th, td {
	white-space : nowrap;
	text-overflow: ellipsis;
	}
	</style>
<script>

$(function () {
	if(${!empty param}) dis();
	
	
	 //초기 셋팅
	change_hair('${param.board_name}')
	$('#horse_hair').val('${param.horse_hair}').prop("selected", true);
	
	var arrColName = ['board_name', 'horse_hair', 'title', 'content', 'reply_count', 'rec_count', 'report_count', 'nickname', 'regdate'];
	var arrHeadName = ['게시판', '말머리', '게시글제목', '댓글 내용', '댓글 수', '좋아요 횟수', '신고 횟수', '작성자', '작성일'];
	makeTh(arrColName, arrHeadName, '#boardSearch', '${param.sort}', '${param.order}');
	
	
	$('#fromDate, #toDate').datepicker({
		dateFormat: 'yy-mm-dd' //달력 날짜 형태
       ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
       ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
       ,changeYear: true //option값 년 선택 가능
       ,changeMonth: true //option값  월 선택 가능                
       ,showOn: "focus" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
       ,buttonText: "선택" //버튼 호버 텍스트              
       ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
       ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
       ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
       ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
       ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
       ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
       ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	});
		
})

function dis(){
    if($('.detail').css('display') == 'none'){
        $('.detail').show();
    }else{
        $('.detail').hide();
    }
}
</script>
<style>
.detail {
	display : none;
	clear : both;
	margin-top: 15px;
	padding : 15px 5px;
	border: 2px solid #2a293e;
	border-radius: 5px;
}

.detailbtn {
	width : 100px; 
	height : 30px; 
	text-align : center;
	cursor : pointer;
}
</style>
</head>
<body>
<div id="wrap">
	<!-- 컨텐츠 영역 -->
	<div id="container">
		<!-- 공지사항 목록영역 -->
		<div class="bodytext_area box_inner" style="width: 100%">
			<form action="/pet/admin/board/reply_list.do" method="post"  id="boardSearch" class="minisrch_form">
				<input type="hidden" id="sort" name="sort" value="${param.sort }">
				<input type="hidden" id="order" name="order" value="${param.order }">
				
				<div>
				<input type="button" class="detailbtn" onclick="javascript:dis();" value="상세 조건">
				&emsp;&emsp;
				<select name="stype">
					<option value="all" <c:if test="${param.stype == 'all'}">selected</c:if>>all</option>
					<option value="title" <c:if test="${param.stype == 'title'}">selected</c:if>>게시글제목</option>
					<option value="content" <c:if test="${param.stype == 'content'}">selected</c:if>>내용</option>
				</select>
				&emsp;
				<input type="text" name="sword" value="${param.sword }" placeholder="검색어 입력">
				&emsp;
				<input type="submit" value="검색">
				</div>
				<div class="detail">
				<select id="board_name" name="board_name" onchange="javascript:change_hair(this.value);">
					<option value="" <c:if test="${param.board_name == ''}">selected="selected"</c:if>>전체 게시판</option>
					<option value="live" <c:if test="${param.board_name == 'live'}">selected="selected"</c:if>>생활</option>
					<option value="free" <c:if test="${param.board_name == 'free'}">selected="selected"</c:if>>자유</option>
					<option value="center" <c:if test="${param.board_name == 'center'}">selected="selected"</c:if>>보호센터</option>
				</select>
				&emsp;
				<select id="horse_hair" name="horse_hair">
					<option value="">말머리</option>
				</select>
				&emsp;
				<input type="text" id="fromDate" name="fromDate" value="${param.fromDate }" placeholder="시작일자" autocomplete="off">
				&emsp;~&emsp;
				<input type="text" id="toDate" name="toDate" value="${param.toDate }" placeholder="종료일자" autocomplete="off">
				<br>
				<br>
				 <p style="font-size: 15px; display: inline;">작성자 닉네임 : </p> &emsp;
				<input type="text" name="nickname" value="${param.nickname }" placeholder="작성자 닉네임 입력">
				 &emsp;
				</div>
			</form>
			<p>
				<span><strong>총 ${data.totalCount }개</strong> |
					${adminBoardVO.page }/${pageMaker.totalPage }페이지</span>
			</p>
			
			<!-- **** -->
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항 목록</caption>
				<thead>
					<tr>	
						<th scope="col"><a href="javascript:;">번호</a></th>
						<!-- 테이블 헤더 makeTh()로 작성 -->
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty data.list }">
						<tr>
							<td class="first" colspan="11">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="vo" items="${data.list }" varStatus="status">
						<tr>
							<td>${data.totalCount-status.index-(adminBoardVO.page-1)*adminBoardVO.pageRow }<!-- 총개수 - 인덱스-(현재페이지번호-1)*페이지당개수 -->
							</td>
							<td>
								<c:choose>
									<c:when test="${vo.board_name == 'free' }">자유</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.board_name == 'live' }">생활</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.board_name == 'center' }">보호센터</c:when>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${vo.horse_hair == '1' }">식당</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.horse_hair == '2' }">관광지</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.horse_hair == '3' }">병원</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.horse_hair == '4' }">잡담</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.horse_hair == '5' }">정보공유</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.horse_hair == '6' }">여행후기</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.horse_hair == '7' }">고민상담</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.horse_hair == '9' }">보호센터</c:when>
								</c:choose>
							</td>
							<td class="txt_l"><a href="javascript: window.open('/pet/${vo.board_name }view.do?board_no=${vo.board_no }', '상세내용', 'width = 800, height = 600, top = 100, left = 100')">${vo.title}
									[${ vo.reply_count}]</a></td>
							<td>${vo.content }</td>
							<td>${vo.reply_count }</td>
							<td>${vo.rec_count }</td>
							<td>${vo.report_count }</td>
							<td class="writer">${vo.nickname }</td>
							<td class="date"><fmt:formatDate value="${vo.regdate }"
									pattern="yy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagenation" style="clear: left">
				<a style="cursor: pointer" class="firstpage pbtn">
			        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
			    </a>
				<c:if test="${pageMaker.prev == true }">
					<a class="prevpage pbtn" href="/pet/admin/board/reply_list.do?page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}&nickname=${param.nickname}&board_name=${param.board_name}&horse_hair=${param.horse_hair}&fromDate=${param.fromDate}&toDate=${param.toDate}&content=${param.content}">
					<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
					</a>
				</c:if>
				<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
					<a href='/pet/admin/board/reply_list.do?page=${p }&stype=${param.stype}&sword=${param.sword}&nickname=${param.nickname}&board_name=${param.board_name}&horse_hair=${param.horse_hair}&fromDate=${param.fromDate}&toDate=${param.toDate}&content=${param.content}'
						class='pagenum <c:if test="${boardVO.page == p }"> currentpage</c:if>'>${p }</a>
				</c:forEach>
				<c:if test="${pageMaker.next == true }">
					<a class="nextpage pbtn" href="/pet/admin/board/reply_list.do?page=${pageMaker.endPage +1}&stype=${param.stype}&sword=${param.sword}&nickname=${param.nickname}&board_name=${param.board_name}&horse_hair=${param.horse_hair}&fromDate=${param.fromDate}&toDate=${param.toDate}&content=${param.content}">
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