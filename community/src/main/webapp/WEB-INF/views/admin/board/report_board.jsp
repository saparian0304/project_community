<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/pet/css/admin/common.css">
<link rel="stylesheet" href="/pet/css/reset.css" />
<link rel="stylesheet" href="/pet/css/contents.css" />
<script type="text/javascript" src="/pet/js/util/admin_an.js"></script>
<style>
input[type='text'] {
	width: 150px;
}

select {
	border: 1px solid #cccccc;
	height: 32px;
	box-sizing: border-box;
}

th, td {
	white-space : nowrap;
	text-overflow: ellipsis;
}
</style>
<script>
$(
	function() {
		if(${!empty param}) dis();
		
		var arrColName = [ 'reason', 'content', 'i_nickname', 'horse_hair', 'target_title', 'you_nickname', 'report_date', 'resdate', 'sumCnt', 'stat'];
		var arrHeadName = [ '신고구분', '신고사유', '신고자', '게시판 구분', '게시물', '피신고자', '신고일자', '처리일자', '누적신고수', '처리구분'];
		makeTh(arrColName, arrHeadName, '#reportSearch','${param.sort}', '${param.order}');
		
		
		$('#fromDate, #toDate, #resFromDate, #resToDate').datepicker({
			dateFormat : 'yy-mm-dd' //달력 날짜 형태,
			,showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시,
			,showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서,
			,changeYear : true //option값 년 선택 가능,
			,changeMonth : true //option값  월 선택 가능                ,
			,showOn : "focus" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  ,
			,buttonText : "선택" //버튼 호버 텍스트              ,
			,yearSuffix : "년" //달력의 년도 부분 뒤 텍스트,
			,monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트,
			,monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip,
			,dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트,
			,dayNames : [ '일요일', '월요일', '화요일', '수요일','목요일', '금요일', '토요일' ] //달력의 요일 Tooltip,
			,minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전),
			,maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
		});
	})
	
function multiReport(stat) {
	$("input[name=select_no]:checked").each(function(){
		var isWait = $(this).closest('tr').find('td:last').text().trim();
		if( !(isWait == 'accept' || isWait == 'reject')){
			report_no = parseInt($(this).val());
			
			$.ajax({
				url : '/pet/report/multiHandle.do',
				data : {
					report_no : report_no,
					stat : stat
				},
				async: false,
				success : function(res) {
					if(res == 0) {
						alert('에러 발생');
						return;
					}
				}
			})
		}
		
	
	})
	location.reload();
}

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
				<form action="/pet/admin/board/report_board.do" method="post"
					id="reportSearch" class="minisrch_form">
					<input type="hidden" id="sort" name="sort" value="${param.sort }">
					<input type="hidden" id="order" name="order" value="${param.order }"> 
					<input type="hidden" id="targetType" name="targetType" value="${param.targetType }"> 
					
					<div>
					<input type="button" class="detailbtn" onclick="javascript:dis();" value="상세 조건">
					</div>
					<div class="detail">
					<select id="reason" name="reason">
						<option value="0"
							<c:if test="${param.reason == '0'}">selected="selected"</c:if>>신고구분</option>
						<option value="1"
							<c:if test="${param.reason == '1'}">selected="selected"</c:if>>욕설</option>
						<option value="2"
							<c:if test="${param.reason == '2'}">selected="selected"</c:if>>비방</option>
						<option value="3"
							<c:if test="${param.reason == '3'}">selected="selected"</c:if>>광고</option>
						<option value="4"
							<c:if test="${param.reason == '4'}">selected="selected"</c:if>>허위</option>
						<option value="5"
							<c:if test="${param.reason == '5'}">selected="selected"</c:if>>기타</option>
					</select> &emsp; 신고일자 : &emsp; 
					<input type="text" id="fromDate"
						name="fromDate" value="${param.fromDate }" placeholder="시작일자"
						autocomplete="off"> &emsp;~&emsp; <input type="text"
						id="toDate" name="toDate" value="${param.toDate }"
						placeholder="종료일자" autocomplete="off"> &emsp;
					<p style="font-size: 15px; display: inline;">신고자 :</p>
					&emsp;&emsp; <input type="text" name="i_nickname"
						value="${param.i_nickname }" placeholder="신고자 닉네임 입력"> 
					&emsp;&emsp;&emsp;&emsp;&nbsp;
					<br>
					<br> 
					<select name="stat">
						<option value="">처리구분</option>
						<option value="wait"
							<c:if test="${param.stat == 'wait'}">selected</c:if>>wait</option>
						<option value="accept"
							<c:if test="${param.stat == 'accept'}">selected</c:if>>accept</option>
						<option value="reject"
							<c:if test="${param.stat == 'reject'}">selected</c:if>>reject</option>
					</select> &emsp; 처리일자 : &emsp; 
					<input type="text" id="resFromDate"
						name="resFromDate" value="${param.resFromDate }"
						placeholder="시작일자" autocomplete="off"> &emsp;~&emsp; 
					<input	type="text" id="resToDate" name="resToDate"
						value="${param.resToDate }" placeholder="종료일자" autocomplete="off">
					&emsp;
					<p style="font-size: 15px; display: inline;">피신고자 :</p>
					&emsp; 
					<input type="text" name="you_nickname" value="${param.you_nickname }" placeholder="피신고자 닉네임 입력">
					&emsp; <input type="submit" value="검색">
					</div>
				</form>
				
				
				<button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:setTargetType('');">전체</button>
				<button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:setTargetType('board');">게시글</button>
				<button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:setTargetType('reply');">댓글</button>
				
				<p>
					<span><strong>총 ${data.totalCount }개</strong> | ${data.page }/${pageMaker.totalPage }페이지</span>
					<span style="float: right; margin-right: 20px;"><a class="reqbtn danger" href="javascript:multiReport('reject');">거절</a></span>
					<span style="float: right; margin-right: 7px;"><a class="reqbtn success" href="javascript:multiReport('accept');">승인</a></span>
					<span style="float: right;"> 체크박스 : &emsp;</span>
				</p>

				<!-- <div class="btnSet" style="text-align: right;">
				<a class="btn" href="freewrite.do">글작성 </a>
			</div> -->
				<!-- **** -->
				<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
					<caption class="hdd">공지사항 목록</caption>
					<thead>
						<tr>
							<th><label><input type="checkbox" name="allChk" onclick="selectAll(this)" ></label></th>
							<th scope="col"><a href="javascript:;">번호</a></th>
							<!-- 테이블 헤더 makeTh1()로 작성 -->
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty data.list }">
							<tr>
								<td class="first" colspan="12">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="vo" items="${data.list }" varStatus="status">
							<tr>
								<td><label><input type="checkbox" name="select_no" value="${vo.report_no }"></label></td>
								<td>${data.totalCount-status.index-(reportVO.page-1)*reportVO.pageRow }<!-- 총개수 - 인덱스-(현재페이지번호-1)*페이지당개수 -->
								</td>

								<td>
									<c:choose>
										<c:when test="${vo.reason == '1' }">욕설</c:when>
										<c:when test="${vo.reason == '2' }">비방</c:when>
										<c:when test="${vo.reason == '3' }">광고</c:when>
										<c:when test="${vo.reason == '4' }">허위</c:when>
										<c:when test="${vo.reason == '5' }">기타</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose>
								</td>
								<td>
									<a href="javascript: window.open('/pet/report/view.do?report_no=${vo.report_no }', '상세내용', 'width = 800, height = 600, top = 100, left = 100')">${vo.content }</a></td>
								<td class="txt_l">${vo.i_nickname}</td>
								<td><c:choose>
										<c:when test="${vo.horse_hair == '1' }">자유/식당</c:when>
										<c:when test="${vo.horse_hair == '2' }">자유/관광지</c:when>
										<c:when test="${vo.horse_hair == '3' }">자유/병원</c:when>
										<c:when test="${vo.horse_hair == '4' }">자유/여행후기</c:when>
										<c:when test="${vo.horse_hair == '5' }">자유/추천</c:when>
										<c:when test="${vo.horse_hair == '6' }">자유/고민</c:when>
										<c:when test="${vo.horse_hair == '7' }">자유/보호센터</c:when>
										<c:otherwise>기타</c:otherwise>
									</c:choose></td>
								<td class="txt_l"><a
									href="javascript: window.open('/pet/board/${vo.board_name }view.do?board_no=${vo.board_no }', '상세내용', 'width = 800, height = 600, top = 100, left = 100')">${vo.target_title}</a></td>
								<td class="txt_l">${vo.you_nickname}</td>
								<td class="date"><fmt:formatDate value="${vo.report_date }"
										pattern="yy-MM-dd HH:mm" /></td>
								<td class="date"><fmt:formatDate value="${vo.resdate }"
										pattern="yy-MM-dd" /></td>
								<td>${vo.sumCnt }</td>
								<c:if test="${vo.stat == 'wait'}">
									<td><a class="reqbtn success"
										href="/pet/report/handle.do?report_no=${vo.report_no}&stat=accept">승인</a>
										&nbsp; <a class="reqbtn danger"
										href="/pet/report/handle.do?report_no=${vo.report_no}&stat=reject">거절</a>
									</td>
								</c:if>
								<c:if test="${vo.stat != 'wait'}">
									<td>${vo.stat }</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pagenation" style="clear: left">
					<a style="cursor: pointer" class="firstpage pbtn"> <img
						src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
					</a>
					<c:if test="${pageMaker.prev == true }">
						<a class="prevpage pbtn"
							href="/pet/admin/board/report_board.do?page=${pageMaker.startPage-1 }&targetType=${param.targetType}&reason=${empty param.reason ? 0 : param.reason }&i_nickname=${param.i_nickname}&you_nickname=${param.you_nickname}&stat=${param.stat}&resFromDate=${param.resFromDate}&resToDate=${param.resToDate}&fromDate=${param.fromDate}&toDate=${param.toDate}">
							<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
						</a>
					</c:if>
					<c:forEach var="p" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage}">
						<a
							href='/pet/admin/board/report_board.do?page=${p }&targetType=${param.targetType}&reason=${empty param.reason ? 0 : param.reason}&i_nickname=${param.i_nickname}&you_nickname=${param.you_nickname}&stat=${param.stat}&resFromDate=${param.resFromDate}&resToDate=${param.resToDate}&fromDate=${param.fromDate}&toDate=${param.toDate}'
							class='pagenum <c:if test="${boardVO.page == p }"> currentpage</c:if>'>${p }</a>
					</c:forEach>
					<c:if test="${pageMaker.next == true }">
						<a class="nextpage pbtn"
							href="/pet/admin/board/report_board.do?page=${pageMaker.endPage +1}&targetType=${param.targetType}&reason=${empty param.reason ? 0 : param.reason}&i_nickname=${param.i_nickname}&you_nickname=${param.you_nickname}&stat=${param.stat}&resFromDate=${param.resFromDate}&resToDate=${param.resToDate}&fromDate=${param.fromDate}&toDate=${param.toDate}">
							<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
						</a>
					</c:if>
					<a style="cursor: pointer" class="lastpage pbtn"> <img
						src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
					</a>
				</div>
				<!-- 페이지처리 -->

			</div>
		</div>
	</div>
</body>
</html>