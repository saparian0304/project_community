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
    <title>help!..wow so cute!!!!</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
	<link rel="stylesheet" href="/pet/css/common.css">
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/> 
    <link rel="shortcut icon" href="/pet/img/favi/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/pet/img/favi/favicon.ico" type="image/x-icon">
	<!-- i class -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="/pet/js/location.js"></script>
	<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
	</style>
</head>
	<%@ include file="/WEB-INF/views/includes/alram.jsp" %>  
<script>
	function popup() {
		var url = '/pet/chat/index.do';
		var name = "채팅목록";
		var option = "width = 500, height = 500, top = 100, left = 100";
		window.open(url, name, option);
	}
	
	function isRead(read_no, cmd, board_no){
		$.ajax({
			url : '/pet/isread',
			type : 'get',
			data : {
				read_no : read_no,
				cmd : cmd,
				board_no : board_no					
			},
			success : function(){
			},
			error : function(){
			}
		})
	}
	
	$(function(){
		$(".socketAlert").on("click", function(){
			dis($(".alramList"));
		});
		
		if(${!empty loginInfo}){
			$.ajax({
				url : '/pet/alramlist',
				type : 'get',
				success : function(res){
					$('div.socketAlert').html(res);
					if ($('div.alrList').val() != null){
						$('img.socketAlert').attr("src", "/pet/img/isalram.png");
					}	
				}
			})
		
		}
		
	});
	
    function dis(obj){
        if($(obj).css('display') == 'none'){
	        $(obj).show();
	    }else{
	        $(obj).hide();
	    }
    }
    
</script>
<style>
.alramList  {
 	right: 10px; top:43px; 
 	width : 400px;
	position:absolute;
	text-align : left;
	display : none;
	background-color: gray;
	font-size : 16px;
}
.alramList #first {
	border-bottom : 3px solid white;
	text-align : center;
	font-weight : bold;
	font-size : 20px;

}

.alramList > * {
	padding : 2.5px 5px;
}
</style>
<body>
      <header id="header">
		<!-- 로고 네비 로그인 그룹 -->
		<div class="header_area box_inner clear">
			<!-- 로고 -->
			<h1>
				<a href="/pet/main.do">Help!</a>
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
							<!-- <h3 id="socketAlert"></h3> -->
							<li><a href="javascript:popup()">채팅목록</a></li>
							<li><a href="/pet/member/logout.do">로그아웃</a></li>
							<li>
								<img src="/pet/img/alram.png" style="width: 27px" class="socketAlert" >
								<div class="alramList" style="color : white">
									<div id="first">[ 실시간 알람 내역 ]</div>
									<div class="socketAlert"></div>
								</div>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
				<!-- 네비 -->
				<nav>
					<ul class="gnb clear">
						<li><a href="/pet/liveindex.do">생활게시판</a>
							<div class="gnb_depth gnb_depth_2_1">
		
							</div></li>
						<li><a href="/pet/centerindex.do">유기견관련</a>
							<div class="gnb_depth gnb_depth_2_2">
							
							</div></li>
						<li><a href="/pet/freeindex.do">자유게시판</a>
							<div class="gnb_depth gnb_depth_2_3">
							
							</div>
						</li>
					<c:if test="${!empty loginInfo }">
					<li><a
						href="/pet/mypage/index.do?member_no=${loginInfo.member_no }">마이페이지</a>
						<div class="gnb_depth gnb_depth_2_4">
							
						</div>
					</li>
					</c:if>
					</ul>
				</nav>
				
			</div>
		</div>
	</header>