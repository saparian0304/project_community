<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>help!</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
	<link rel="stylesheet" href="/pet/css/common.css">
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="/pet/js/location.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
</head>
<script>
	function popup() {
		var url = '/pet/chat/index.do';
		var name = "채팅목록";
		var option = "width = 500, height = 500, top = 100, left = 100";
		window.open(url, name, option);
	}
</script>
<script>
/* 실시간 알람 */
 var socket = null;
function connectWS(){
	console.log("==============");
	var ws = new SockJS("/pet/alram");
	socket = ws;
	
	ws.onopen = function(){
		console.log("open");
	};
	
	ws.onmessage = function(event){
		console.log("onmessage" + event.data);
		var $socketAlert = $('h3#socketAlert');
		$socketAlert.html(event.data);
		$socketAlert.css({
			"display" :  "block",
			"backgorund" : "yellow"
		});
			
		
		setTimeout(function(){
			$socketAlert.css("display", "none");
		}, 5000);
	};
	
	ws.onclose = function(){
		console.log("close");
	};
};
$(function(){
	/* 실시간 알람 */
	if(${loginInfo != null}){
		connectWS();
	}
})
</script>
<body>
      <header id="header">
		<!-- 로고 네비 로그인 그룹 -->
		<div class="header_area box_inner clear">
			<!-- 로고 -->
			<h1>
				<a href="/pet/board/main.do">Help!</a>
			</h1>
			<!-- 네비 로그인 -->
			<div class="header_cont">
				<!-- 로그인 회원가입 -->
				<ul class="util clear">
					<c:choose>
						<c:when test="${empty loginInfo.member_no }">
							<li><a href="/pet/member/login.do">로그인</a></li>
							<li><a href="/pet/member/join.do">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<h3 id="socketAlert"></h3>
							<li><a href="javascript:popup()">채팅목록</a></li>
							<li><a href="/pet/member/logout.do">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<!-- 네비 -->
				<nav>
					<ul class="gnb clear">
						<li><a href="/pet/board/liveindex.do">생활게시판</a>
							<div class="gnb_depth gnb_depth_2_1">
								<ul class="submenu_list">
									<li><a href="#">국내</a></li>
									<li><a href="#">해외</a></li>
								</ul>
							</div></li>
						<li><a href="/pet/board/centerindex.do">유기견관련</a>
							<div class="gnb_depth gnb_depth_2_2">
								<ul class="submenu_list">
									<li><a href="#">공지사항</a></li>
									<li><a href="#">문의하기</a></li>
								</ul>
							</div></li>
						<li><a href="/pet/board/freeindex.do">자유게시판</a>
							<div class="gnb_depth gnb_depth_2_3">
								<ul class="submenu_list">
									<li><a href="#">프로그램 소개</a></li>
									<li><a href="#">여행자료</a></li>
								</ul>
							</div>
						</li>
					<c:if test="${!empty loginInfo }">
					<li><a
						href="/pet/mypage/main.do?member_no=${loginInfo.member_no }">마이페이지</a>
						<div class="gnb_depth gnb_depth_2_4">
							<ul class="submenu_list">
								<li><a href="#">항공</a></li>
								<li><a href="#">호텔</a></li>
							</ul>
						</div>
					</li>
					</c:if>
					</ul>
				</nav>
				
			</div>
		</div>
	</header>