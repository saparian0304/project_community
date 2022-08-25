<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<script type="text/javascript" src="/pet/js/mypage.js"></script>
    <script>
    var mymember_no = "${loginInfo.member_no}";
    /* ajax로 마이페이지 메인(?)으로 */
    $(function(){
    	getIndex(${loginInfo.member_no });
		${param.add}(1,${loginInfo.member_no},'board');		
    })
    /* 선택대상 */
    var select_no;
	// 아이디 클릭시 나의 활동 내역 	
	
    </script> 
</head>
<body>
    <ul class="skipnavi">
        <li><a href="#container">본문내용</a></li>
    </ul>
    <div id="wrap">
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
                <button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:getActList(1,${loginInfo.member_no},'board');">내 활동내역</button>
                <button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:getMessReadList(1, ${loginInfo.member_no});">쪽지 내역</button>
                <button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:getBookList(1, ${loginInfo.member_no});">북마크 내역</button>
                <button style="width : 100px; height : 30px;" class="reqbtn default" onclick="javascript:getFriReq(1,${loginInfo.member_no});">친구페이지</button>
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