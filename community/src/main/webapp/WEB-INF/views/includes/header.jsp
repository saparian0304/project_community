<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 | 고객센터 | 투어리스트인투어</title>
      <link rel="stylesheet" href="/pet/css/common.css">
      <link rel="stylesheet" href="/pet/css/layout_base.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
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
                <h1><a href="#">Tourist in tour</a></h1>
                <!-- 모바일 햄버거버튼 -->
                <p class="openMOgnb">
                    <a href="#">
                        <!-- 클래스hdd=> 히든 -->
                        <b class="hdd">메뉴열기</b>
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </p>
                <!-- 네비 로그인 -->
                <div class="header_cont">
                    <!-- 로그인 회원가입 -->
                    <ul class="util clear">
                        <li><a href="/project/member/login.do">로그인</a></li>
                        <li><a href="#">회원가입</a></li>
                    </ul>
                    <!-- 네비 -->
                    <nav>
                        <ul class="gnb clear">
                            <li><a href="#">여행정보</a>
                                <div class="gnb_depth gnb_depth_2_1">
                                    <ul class="submenu_list">
                                        <li><a href="#">국내</a></li>
                                        <li><a href="#">해외</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li><a href="#">고객센터</a>
                                <div class="gnb_depth gnb_depth_2_2">
                                    <ul class="submenu_list">
                                        <li><a href="#">공지사항</a></li>
                                        <li><a href="#">문의하기</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li><a href="#">상품투어</a>
                                <div class="gnb_depth gnb_depth_2_3">
                                    <ul class="submenu_list">
                                        <li><a href="#">프로그램 소개</a></li>
                                        <li><a href="#">여행자료</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li><a href="#">티켓/가이드</a>
                                <div class="gnb_depth gnb_depth_2_4">
                                    <ul class="submenu_list">
                                        <li><a href="#">항공</a></li>
                                        <li><a href="#">호텔</a></li>
                                    </ul>
                                </div>
                            </li>
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
                        <span>TOURIST</span>
                        <span class="in">in</span>
                        <!-- <span class="in">IN</span> -->
                        <span>TOUR</span>
                    </h2>
                    <p class="location">
                        고객센터
                        <span class="path">/</span> 
                        공지사항
                    </p>
                    <!-- 모바일 -->
                    <ul class="page_menu clear">
                        <li>
                            <a href="#" class="on">공지사항<a>
                        </li>
                        <li>
                            <a href="#">문의하기</a>
                        </li>
                    </ul>
                </div>
            </div> 