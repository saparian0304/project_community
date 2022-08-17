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
    <title>공지사항 | 고객센터 | 투어리스트인투어</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
	<link rel="stylesheet" href="/pet/css/common.css">
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="/pet/js/location.js"></script>
	<style type="text/css">
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: opacity;
      }
      
h2 {
  display: block;
  font-size: 1.5em;
  margin-top: 0.83em;
  margin-bottom: 0.83em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
}
	</style>
</head>
<body>
	<ul class="skipnavi">
        <li><a href="#container">본문내용</a></li>
    </ul>
	<div id="wrap">
		<header id="header">
			<!-- 로고 네비 로그인 그룹 -->
			<div class="header_area box_inner clear">
				<!-- 로고 -->
				<h1>
					<a href="/pet/board/index.do">Help!</a>
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
								<li><a href="/pet/member/logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<!-- 네비 -->
					<nav>
						<c:choose>
							<c:when test="${empty loginInfo.member_no }">
								<ul class="gnb clear">
									<li><a href="/pet/board/liveindex.do">생활게시판</a>
										<div class="gnb_depth gnb_depth_2_1">
											<ul class="submenu_list">
												<li><a href="#">국내</a></li>
												<li><a href="#">해외</a></li>
											</ul>
										</div></li>
									<li><a href="#">유기견관련</a>
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
										</div></li>
									</ul>
							</c:when>
							<c:otherwise><!-- 여기만 if사용하기 -->
								<li><a
									href="/pet/mypage/index.do?member_no=${loginInfo.member_no }">마이페이지</a>
									<div class="gnb_depth gnb_depth_2_4">
										<ul class="submenu_list">
											<li><a href="#">항공</a></li>
											<li><a href="#">호텔</a></li>
										</ul>
									</div></li>
							</c:otherwise>
						</c:choose>
						</ul>
					</nav>
					<p class="closePop">
						<a href="#">닫기</a>
					</p>
				</div>
			</div>
		</header>

		<!-- 컨텐츠 영역 -->
		<div id="container">
			<!-- 위치(페이지 제목)영역 -->
			<div class="location_area customer">
				<div class="box_inner">
					<h2 class="tit_page">
						<span>반려동물 커뮤니티</span>
					</h2>
				</div>
			</div>
			<!-- 공지사항 목록영역 -->
			<div class="bodytext_area box_inner" style="width: 70%">
				<form action="#" method="post" class="minisrch_form">
					<fieldset>
						<legend> 검색 </legend>
						<input type="text" class="tbox" title="검색어를 입력해주세요"
							placeholder="검색어를 입력해주세요." name=""> <a href="#"
							class="btn_srch">검색</a>
					</fieldset>
				</form>
				<p>
					<span><strong>총 ${data.totalCount }개</strong> |
						${boardVO.page }/${data.totalPage }페이지</span>
				</p>
				<div>
					<select name="sido1" id="sido1"></select> <select name="gugun1"
						id="gugun1"></select>
				</div>

				<div class="btnSet" style="text-align: right;">
					<a class="btn" href="livewrite.do">글작성 </a>
				</div>

				<!-- 스와이퍼 -->
				<div class="swiper mySwiper">
					<h2 class="">자유게시판</h2>
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img alt="" src="https://w.namu.la/s/bd55811ebd0c36a4101051b17f16299f307ff9176f902e578f0904f9e328e4f3f04cdc1534464126960d6906cc686ee0de55eaece19cbc19f94334e11bdae8c10351f6891bbbc455a4f761fac6a9a8f99852ff7644103fd6ac889ced70a28cbdfcb775b5cafba147bda95b1c06d66ee2">						
						</div>
						<div class="swiper-slide">Slide 2</div>
						<div class="swiper-slide">Slide 3</div>
						<div class="swiper-slide">Slide 4</div>
						<div class="swiper-slide">Slide 5</div>
					</div>

					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-scrollbar"></div>
				</div>

				<div class="swiper mySwiper">
					<h2>생활게시판</h2>
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img alt="" src="http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg">
						</div>
						<div class="swiper-slide">Slide 2</div>
						<div class="swiper-slide">Slide 3</div>
						<div class="swiper-slide">Slide 4</div>
						<div class="swiper-slide">Slide 5</div>
					</div>

					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-scrollbar"></div>
				</div>

				<div class="swiper mySwiper">
					<h2>동물병원</h2>
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img alt="" src="https://cdn.salgoonews.com/news/photo/202112/13967_36181_3811.jpg">
						</div>
						<div class="swiper-slide">
							<img alt="" src="https://pbs.twimg.com/profile_images/1181902209698582528/PVU-fj8z_400x400.jpg">
						</div>
						<div class="swiper-slide">Slide 3</div>
						<div class="swiper-slide">Slide 4</div>
						<div class="swiper-slide">Slide 5</div>
					</div>

					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-scrollbar"></div>
				</div>

				<!-- Swiper JS -->
				<script
					src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

				<!-- Initialize Swiper -->
				<script>
			      var swiper = new Swiper(".mySwiper", {
			    	slidesPerView: 4,
			        centeredSlides: true,
			        spaceBetween: 30,
			        observer: true,
			        observeParents: true,
			        loop : true,
			    	scrollbar: {
			          el: ".swiper-scrollbar",
			          hide: true,
			          clickable: true,
			        },
			        navigation: {
			          nextEl: ".swiper-button-next",
			          prevEl: ".swiper-button-prev",
			        },
			      });
			    </script>
			</div>
		</div>
	</div>
</body>

</html>