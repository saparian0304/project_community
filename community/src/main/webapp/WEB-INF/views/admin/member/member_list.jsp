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
	<script type="text/javascript" src="/pet/js/util/member_shon.js?ver=3"></script>
<style>
.detail {
	display : none;
	clear : both;
	padding : 15px 5px;
	border: 2px solid #2a293e; /* 위치 확인용 */
	border-radius: 5px;
}

.detailbtn {
	width : 100px; 
	height : 30px; 
	float : right;
	text-align : center;
	cursor : pointer;
	margin : 7px 0;
}
input[type="number"] {
	width : 100px;
	height : 32px;
	display : none;
}
.dateSelf {
	display : none;
}

</style>
<script>

$(function () {
	// 초기 셋팅
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
	makeTh('${param.sort}', '${param.order}');
})

</script>
</head>
<body>
<div id="wrap">
	<!-- 컨텐츠 영역 -->
	<div id="container">
		<!-- 공지사항 목록영역 -->
		<div class="bodytext_area box_inner" style="width: 100%">
			<form action="/pet/admin/member/member_list.do" method="post"  id="memberSearch" class="minisrch_form">
				<input type="hidden" id="sort" name="sort" value="${param.sort }">
				<input type="hidden" id="order" name="order" value="${param.order }">
				<div style="float : right;">
				<select name="stype" >
					<option value="all" <c:if test="${param.stype eq 'all' }"> selected</c:if>>전체</option>
					<option value="member_id" <c:if test="${param.stype eq 'member_id' }"> selected</c:if>>ID</option>
					<option value="nickname" <c:if test="${param.stype eq 'nickname' }"> selected</c:if>>닉네임</option>
					<option value="email" <c:if test="${param.stype eq 'email' }"> selected</c:if>>이메일</option>
				</select>
				&emsp;
				<input type="text" name="sword" value="${param.sword }" placeholder="search" >
				<input type="submit" onclick="javascript:gosearch();" value="검색">
				<br>
				<input type="button" class="detailbtn" onclick="javascript:dis();" value="상세 조건">
				</div>
				<br>
				<br>
				<div class="detail">
				<p style="font-size: 15px; display: inline;">성별 : </p>&emsp;
				<select id="gender" name="gender">
					<option value="0" >전체</option>
					<option value="1" <c:if test="${param.gender == 1 }"> selected</c:if>>남자</option>
					<option value="2" <c:if test="${param.gender == 2 }"> selected</c:if>>여자</option>
				</select>
				&emsp;&emsp;
				<p style="font-size: 15px; display: inline;">등급 : </p>&emsp;
				<select class="updown" id="level" name="level">
					<option value="0">전체</option>
					<option value="1">일반회원</option>
				</select>
				<select id="level_order" name="level_order">
					<option value="">--</option>
				</select>
				&emsp;&emsp;
				<p style="font-size: 15px; display: inline;">회원상태 : </p>&emsp;
				<select id="out" name="out">
					<option value="0">전체</option>
					<option value="1">활동중</option>
					<option value="2">탈퇴</option>
					<option value="3">활동중지</option>
				</select>
				<br><br>
				
				<p style="font-size: 15px; display: inline;">기간 설정 : </p>&emsp;
				<select id="dateType" name="dateType">
					<option value="">------선택------</option>
					<option value="birthday">생년월일</option>
					<option value="regdate">가입일</option>
					<option value="curr_login">최근 방문일</option>
					<option value="leavedate">탈퇴/활동중지</option>
				</select>
				&emsp;
				<select id="fromDate" name="fromDate">
					<option value="">---</option>
				</select>
				<p class="dateSelf" >
				&emsp;&emsp;
					<input type="text" name="fromDate2" value="${param.fromDate }" placeholder="시작일자" autocomplete="off">
					&emsp;~&emsp;
					<input type="text" name="toDate" value="${param.toDate }" placeholder="종료일자" autocomplete="off">
					 &emsp;
				</p>
				<br>
				<br>
				<p style="font-size: 15px; display: inline;">게시글 수 : </p> &emsp;
				<select class="updown" id="board_count" name="board_count">
					<option value="0">---</option>
					<option value="50">50개</option>
					<option value="100">100개</option>
					<option value="200">200개</option>
					<option value="500">500개</option>
					<option value="self">직접입력</option>
				</select>
				<input type="number" min="0" step="10" name="board_count2" value="${param.board_count }">		
				<select id="board_order" name="board_order">
					<option value="">--</option>
				</select>
				&emsp;&emsp;
				<p style="font-size: 15px; display: inline;">댓글 수 : </p> &emsp;
				<select class="updown" id="reply_count" name="reply_count">
					<option value="0">---</option>
					<option value="50">50개</option>
					<option value="100">100개</option>
					<option value="200">200개</option>
					<option value="500">500개</option>
					<option value="self">직접입력</option>
				</select>
				<input type="number" min="0" step="10" name="reply_count2" value="${param.reply_count }">
				<select id="reply_order" name="reply_order">
					<option value="">--</option>
				</select>
				&emsp;
				</div>
			</form>
			
			<button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:;">활동중지</button>
			<button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:;">쪽지</button>
			<br>
			<br>
			<p>
				<span><strong>총 ${data.totalCount }개</strong> |
					${adminMemberVO.page }/${pageMaker.totalPage }페이지</span>
			</p>

			<!-- <div class="btnSet" style="text-align: right;">
				<a class="btn" href="freewrite.do">글작성 </a>
			</div> -->
			<!-- **** -->
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">목록</caption>
				<colgroup>
					<col width="45px" />
                    <col width="110px" />
                    <col width="130px" />
                    <col width="150px" />
                    <col width="45px" />
                    <col width="100px" />
                    <col width="100px" />
                    <col width="*" />
                    <col width="70px" />
                    <col width="60px" />
                    <col width="75px" />
                    <col width="75px" />
                    <col width="60px" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><a href="javascript:;">선택</a></th>
						<!-- 테이블 헤더 makeTh()로 작성 -->
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty data.list }">
						<tr>
							<td class="first" colspan="13">등록된 회원이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="vo" items="${data.list }" varStatus="status">
						<tr>
							<td><input type="checkbox" name="select_no" value="${vo.member_no}"><!-- 총개수 - 인덱스-(현재페이지번호-1)*페이지당개수 -->
							</td>
							<td class="writer">
								${vo.member_id }
							</td>
							<td>
								${vo.nickname }
							</td>
							<td class="txt_l">${vo.email }</td>
							<td>
							<c:if test="${vo.gender == 1}">남자</c:if>
							<c:if test="${vo.gender == 2}">여자</c:if>
							</td>
							<td>${vo.birthday }</td>
							<td>
							<c:choose>
								<c:when test="${vo.level == 1 }">일반회원</c:when>
							</c:choose>
							</td>
							<td>
							<c:if test="${vo.out == 1}">활동중</c:if>
							<c:if test="${vo.out == 2}">탈퇴</c:if>
							<c:if test="${vo.out == 3}">활동 중지</c:if>
							</td>
							<td>${vo.board_count }</td>
							<td>${vo.reply_count }</td>
							<td class="date"><fmt:formatDate value="${vo.regdate }"
									pattern="yy-MM-dd" /></td>
							<td class="date"><fmt:formatDate value="${vo.curr_login }"
									pattern="yy-MM-dd" /></td>
							<td>출석수</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${!empty data.list }">
			<div class="pagenation" style="clear: left">
				<a style="cursor: pointer" class="firstpage pbtn"
				 href="/pet/admin/member/member_list.do?page=1&stype=${param.stype}&sword=${param.sword}&gender=${param.gender}&level=${param.level}&level_order=${param.level_order}&out=${param.out}&dateType=${param.dateType}&fromDate=${param.fromDate}&toDate=${param.toDate}&board_count=${param.board_count}&board_order=${param.board_order}&reply_count=${param.reply_count}&reply_order=${param.reply_order}">
			        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
			    </a>
				<c:if test="${pageMaker.prev == true }">
					<a class="prevpage pbtn" href="/pet/admin/member/member_list.do?page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}&gender=${param.gender}&level=${param.level}&level_order=${param.level_order}&out=${param.out}&dateType=${param.dateType}&fromDate=${param.fromDate}&toDate=${param.toDate}&board_count=${param.board_count}&board_order=${param.board_order}&reply_count=${param.reply_count}&reply_order=${param.reply_order}">
					<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
					</a>
				</c:if>
				<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
					<a href='/pet/admin/member/member_list.do?page=${p }&stype=${param.stype}&sword=${param.sword}&gender=${param.gender}&level=${param.level}&level_order=${param.level_order}&out=${param.out}&dateType=${param.dateType}&fromDate=${param.fromDate}&toDate=${param.toDate}&board_count=${param.board_count}&board_order=${param.board_order}&reply_count=${param.reply_count}&reply_order=${param.reply_order}'
						class='pagenum <c:if test="${boardVO.page == p }"> currentpage</c:if>'>${p }</a>
				</c:forEach>
				<c:if test="${pageMaker.next == true }">
					<a class="nextpage pbtn" href="/pet/admin/member/member_list.do?page=${pageMaker.endPage +1}&stype=${param.stype}&sword=${param.sword}&gender=${param.gender}&level=${param.level}&level_order=${param.level_order}&out=${param.out}&dateType=${param.dateType}&fromDate=${param.fromDate}&toDate=${param.toDate}&board_count=${param.board_count}&board_order=${param.board_order}&reply_count=${param.reply_count}&reply_order=${param.reply_order}">
					<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
					</a>
				</c:if>
				<a style="cursor: pointer"  
			    	class="lastpage pbtn" 
			    	 href="/pet/admin/member/member_list.do?page=${pageMaker.totalPage}&stype=${param.stype}&sword=${param.sword}&gender=${param.gender}&level=${param.level}&level_order=${param.level_order}&out=${param.out}&dateType=${param.dateType}&fromDate=${param.fromDate}&toDate=${param.toDate}&board_count=${param.board_count}&board_order=${param.board_order}&reply_count=${param.reply_count}&reply_order=${param.reply_order}">
			        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
			    </a>
			</div>
			</c:if>
			<!-- 페이지처리 -->

		</div>
	</div>
</div>
</body>
</html>