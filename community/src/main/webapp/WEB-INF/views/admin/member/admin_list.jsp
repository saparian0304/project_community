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
	<script type="text/javascript" src="/pet/js/util/admin_an.js"></script>
<style>
.detail {
	display : none;
	clear : both;
	padding : 15px 5px;
	border: 2px solid #2a293e;
	border-radius: 5px;
}

.detailbtn {
	width : 100px; 
	height : 30px; 
	float : right;
	text-align : center;
	cursor : pointer;
}
</style>
<script>

$(function () {
	var arrColName = [ 'admin_no', 'admin_id', 'name', 'pwd'];
	var arrHeadName = [ '번호', '아이디', '이름', '비밀번호 초기화'];
	makeTh(arrColName, arrHeadName, '#adminList_form','${param.sort}', '${param.order}');
	
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
})

function dis(){
    if($('.detail').css('display') == 'none'){
        $('.detail').show();
    }else{
        $('.detail').hide();
    }
}
</script>
</head>
<body>
<div id="wrap">
	<!-- 컨텐츠 영역 -->
	<div id="container">
		<!-- 공지사항 목록영역 -->
		<div class="bodytext_area box_inner" style="width: 100%">
			<form action="/pet/admin/member/admin_list.do" method="post"  id="adminList_form" class="adminList_form">
				<input type="hidden" id="sort" name="sort" value="${param.sort }">
				<input type="hidden" id="order" name="order" value="${param.order }">
				<select name="stype">
					<option value="all" <c:if test="${param.stype == 'all'}">selected</c:if>>all</option>
					<option value="admin_id" <c:if test="${param.stype == 'admin_id'}">selected</c:if>>아이디</option>
					<option value="name" <c:if test="${param.stype == 'name'}">selected</c:if>>이름</option>
				</select>
				&emsp;
				<input type="text" name="sword" value="${param.sword }" placeholder="검색어 입력">
				&emsp;
				<input type="submit" value="검색">
			</form>
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
					<col width="5px" />
					<col width="45px" />
                    <col width="85px" />
                    <col width="60px" />
                    <col width="60px" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><label><input type="checkbox" name="allChk" onclick="selectAll(this)" ></label></th>
						<!-- 테이블 헤더 makeTh()로 작성 -->
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty data.list }">
						<tr>
							<td class="first" colspan="5">등록된 회원이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="vo" items="${data.list }" varStatus="status">
						<tr>
							<td><label><input type="checkbox" name="select_no" value="${vo.admin_no }"></label></td>
							<td>${vo.admin_no }</td>
							<td class="writer">
								${vo.admin_id }
							</td>
							<td>
								${vo.name }
							</td>
							<td>
								<a href="/pet/admin/defalutPwd.do?admin_no=${vo.admin_no }">초기화</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagenation" style="clear: left">
				<a style="cursor: pointer" class="firstpage pbtn">
			        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
			    </a>
				<c:if test="${pageMaker.prev == true }">
					<a class="prevpage pbtn" href="/admin/member/admin_list.do?page=${pageMaker.startPage-1 }&stype=${param.stype}&sword=${param.sword}">
					<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
					</a>
				</c:if>
				<c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
					<a href='/admin/member/admin_list.do?page=${p }&stype=${param.stype}&sword=${param.sword}'
						class='pagenum <c:if test="${boardVO.page == p }"> currentpage</c:if>'>${p }</a>
				</c:forEach>
				<c:if test="${pageMaker.next == true }">
					<a class="nextpage pbtn" href="/admin/member/admin_list.do?page=${pageMaker.endPage +1}&stype=${param.stype}&sword=${param.sword}">
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