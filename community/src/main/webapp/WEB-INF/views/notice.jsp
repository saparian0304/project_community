<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 | 고객센터 | 투어리스트인투어</title>
      <link rel="stylesheet" href="/pet/css/common.css"> 
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
						<li><a href="/pet/member/logout.do">로그아웃</a></li>
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
                            <li><a href="/pet/mypage/index.do?member_no=${loginInfo.member_no }">마이페이지</a>
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
            <!-- 공지사항 목록영역 -->
            <div class="bodytext_area box_inner">
                <form action="#" method="post" class="minisrch_form">
                    <fieldset>
                        <legend>
                            검색
                        </legend>
                        <input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요." name="">
                        <a href="#" class="btn_srch">검색</a>
                    </fieldset>
                </form>
                <!-- **** -->
                <table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
                    <caption class="hdd">공지사항 목록</caption>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">조회수</th>
                            <th scope="col">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td class="tit_notice"><a href="#">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td class="tit_notice"><a href="#">박물관 미션 투어 응모 당첨자 발표</a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td class="tit_notice"><a href="#">추석 연휴 티켓/투어 배송 및 직접 수령 안내 </a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                        <tr>
                            <td>4</td>
                            <td class="tit_notice"><a href="#">하롱베이 서비스 OPEN!(여행정보, 가이드북, 가이드맵)</a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                        <tr>
                            <td>5</td>
                            <td class="tit_notice"><a href="#">어리스트인투어 서비스 점검 안내 - 투어리스트인투어에서 매월 실시하는 정기점검 안내</a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                        <tr>
                            <td>6</td>
                            <td class="tit_notice"><a href="#">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                        <tr>
                            <td>7</td>
                            <td class="tit_notice"><a href="#">박물관 미션 투어 응모 당첨자 발표</a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                        <tr>
                            <td>8</td>
                            <td class="tit_notice"><a href="#">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                        <tr>
                            <td>9</td>
                            <td class="tit_notice"><a href="#">하롱베이 서비스 OPEN! (여행정보, 가이드북, 가이드맵)</a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                        <tr>
                            <td>10</td>
                            <td class="tit_notice"><a href="#">투어리스트인투어 서비스 점검 안내</a></td>
                            <td>123</td>
                            <td>2021-08-01</td>
                        </tr>

                    </tbody>
                </table>

                <!-- pagenation -->
                <div class="pagenation">
                    <a href="#" class="firstpage pbtn">
                        <img src="../img/btn_firstpage.png" alt="첫 페이지로 이동">
                    </a>
                    <a href="#" class="prevpage pbtn">
                        <img src="../img/btn_prevpage.png" alt="이전 페이지로 이동">
                    </a>
                    <a href="#">
                        <span class="pagenum currentpage">1</span>
                    </a>
                    <a href="#">
                        <span class="pagenum">2</span>
                    </a>
                    <a href="#">
                        <span class="pagenum">3</span>
                    </a>
                    <a href="#">
                        <span class="pagenum">4</span>
                    </a>
                    <a href="#">
                        <span class="pagenum">5</span>
                    </a>
                    <a href="#" class="nextpage pbtn">
                        <img src="../img/btn_nextpage.png" alt="다음 페이지로 이동">
                    </a>
                    <a href="#" class="lastpage pbtn">
                        <img src="../img/btn_lastpage.png" alt="마지막 페이지 이동">
                    </a>
                </div>
            </div>
        </div>
        
        <footer>
            <div class="foot_area box_inner">
                <ul class="foot_list clear">
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보취급방침</a></li>
                </ul>
                <h2>투어리스인투어</h2>
                <p class="addr">
                     서울특별시 종로구 관철동 4층 
                    <span class="gubun">/</span>
                    <span class="br_line">대표전화 
                        <span class="space0">02-1234-5678</span>
                        <span class="gubun">/</span>
                        <span class="br_line">E-mail : 
                            <span class="space0">abc@daum.net</span>
                        </span>

                    </span>
                </p>
                <p class="copy box_inner">Copyright TourristInTour all right reseved</p>

                <!-- SNS아이콘 -->
                <ul class="snslink clear">
                    <li><a href="#">blog</a></li>
                    <li><a href="#">facebook</a></li>
                    <li><a href="#">instargram</a></li>
                </ul>
            </div>
        </footer>
    </div> <!-- div id="wrap" -->

    <!-- 퀵메뉴 -->
    <h2 class="hdd">빠른 링크 : 전화문의, 카카오톡, 오시는 길, 꼭대기로 가기</h2>
    <div class="quick_area">
        <ul class="quick_list">
            <li>
                <a href="tel:010-1234-5678">
                    <h3>전화문의</h3>
                    <p>010-1234-5678</p>
                </a>
            </li>

            <li>
                <a href="#">
                    <h3>카카오톡<em>상담</em></h3>
                    <p>1대1상담</p>
                </a>
            </li>

            <li>
                <a href="#">
                    <h3 class="to_contact">오시는 길</h3>   
                </a>
            </li>
        </ul>
        <p class="to_top">
            <a href="#layout0" class="s_point">TOP</a>
        </p>
    </div>

</body>
</html>