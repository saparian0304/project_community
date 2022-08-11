<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>notice</title>
    <link rel="stylesheet" href="/pet/css/common.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    /* 체크박스 전체체크 */
    function selectAll(selectAll)  {
	    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    checkboxes.forEach((checkbox) => {
	       checkbox.checked = selectAll.checked
	    })
    }
    /* ajax로 마이페이지 메인(?)으로 */
    $(function(){
    	getIndex(${loginInfo.member_no });
    })
    function getIndex(member_no){
    	$.ajax({
    		url : "info.do",
    		data : {
    			member_no : member_no
    		},
    		success : function(res){
    			$("#hi").html(res);
    		}
    	})
    }
    
    /* ajax로 친구요청목록 불러오기 */
    function getFriReq(page, member_no){
    	$.ajax({
    		url : "frireq.do",
    		data : {
    			table_name : 'friend',
    			member_no : member_no,
    			page : page
    		},
    		success : function(res){
    			$("#hi").html(res);
    		}
    	})
    }
    /* ajax로 친구목록 불러오기 */
    function getFriList(page, member_no){
    	$.ajax({
    		url : "frilist.do",
    		data : {
    			table_name : 'friend',
    			member_no : member_no,
    			page : page
    		},
    		success : function(res){
    			$("#hi").html(res);
    		}
    	})
    }
    /* ajax로 내활동목록 불러오기 */
    function getActList(page, member_no, table_name){
    	$.ajax({
    		url : "actlist.do",
    		data : {
    			table_name : table_name,
    			member_no : member_no,
    			page : page
    		},
    		success : function(res){
    			$("#hi").html(res);
    		}
    	})
    }
    /* 선택대상 */
    var select_no;
    /* isdel */
    function isdel(select_no,table_name){
    	$.ajax({
    		url: "actisdel.do",
    		type: 'get',
    		data: {
    			select_no : select_no,
    			table_name : table_name
    		},
    		success : function(res){
    			alert('isdel 성공');
    			getActList(1, ${loginInfo.member_no},table_name);
    		}
    	});
    }
    /* isdel게시글 */
    function isdelBoardMulti(){
    	$("input[name=select_no]:checked").each(function(){
    		select_no = parseInt($(this).val());
    		isdel(select_no,"board");
    	})
    }    
    function isdelBoard(a){
    		select_no = parseInt(a);
    		isdel(select_no,"board");
    }    
    /* 친구 수락 */
    function accept(select_no){
    	$.ajax({
			url : "friaccept.do",
			type : 'get',
			data : {
				select_no : select_no,
				table_name : 'friend'
			},
			success : function(res){
				alert("성공");
			    getFriReq(1, ${loginInfo.member_no });
			}
		}) 
    }
    
    /* 다중 선택 수락 */
    function acceptMulti(){
	    $("input[name=select_no]:checked").each(function(){
	    	select_no = parseInt($(this).val());
			accept(select_no);    	
	    });
    }
	/* 단일선택수락 */
    function acceptSingle(a){
	    	select_no = parseInt(a);
	    	accept(select_no);
    }
	/* 삭제 */
	function del(select_no, rere){
		$.ajax({
			url : "fridel.do",
			type : 'get',
			data : {
				select_no : select_no,
				table_name : 'friend'
			},
			success : function(res){
				alert("성공");
				if (rere == 0){
		    		getFriReq(1, ${loginInfo.member_no });
				} else if (rere == 1){
					getFriList(1, ${loginInfo.member_no });
				}
			}
		})  
	}
	/* 다중 선택 삭제 */
	function delMulti(rere){
	    $("input[name=select_no]:checked").each(function(){
	    	select_no = parseInt($(this).val());
	    	del(select_no, rere);	
	    });
    }
	/* 단일 선택 삭제 */
	function delSingle(a, rere){
    	select_no = parseInt(a);
    	del(select_no, rere);	
	}
    </script> 
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
                <h1><a href="#">Help!</a></h1>
                <!-- 네비 로그인 -->
                <div class="header_cont">
                    <!-- 로그인 회원가입 -->
                    <ul class="util clear">
                    <c:choose>
						<c:when test="${empty loginInfo.member_no }">
	                        <li><a href="/pet/member/login.do">로그인</a></li>
	                        <li><a href="/pet/member/login.do">회원가입</a></li>
						</c:when>
	                    <c:otherwise>
	                        <li><a href="/pet/member/logout.do">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
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
                        <span>MYPAGE</span>
                    </h2>
                </div>
            </div> 
            <!-- 공지사항 목록영역 -->
            <div class="bodytext_area box_inner">
                
                <!-- **** -->
                <button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:getIndex(${loginInfo.member_no});">내정보</button>
                <button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:getFriReq(1,${loginInfo.member_no});">친구페이지</button>
                <button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:getActList(1,${loginInfo.member_no},'board');">내 활동내역</button>
                <br/>
                <br/>
                <div id="hi">
	                
                </div>

                <!-- paging -->
                
            </div>
        </div>
        
        <footer>
            
        </footer>
    </div> <!-- div id="wrap" -->


</body>
</html>