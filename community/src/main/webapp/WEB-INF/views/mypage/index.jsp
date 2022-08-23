<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

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
    /* ajax로 내쪽지목록 불러오기 */
    function getMessReadList(page, member_no){
    	$.ajax({
    		url : "messreadlist.do",
    		data : {
    			member_no : member_no,
    			page : page
    		},
    		success : function(res){
    			$("#hi").html(res);
    		}
    	})
    }
    function getMessSendList(page, member_no){
    	$.ajax({
    		url : "messsendlist.do",
    		data : {
    			member_no : member_no,
    			page : page
    		},
    		success : function(res){
    			$("#hi").html(res);
    		}
    	})
    }
    /* ajax로 내북마크목록 불러오기 */
    function getBookList(page, member_no){
    	$.ajax({
    		url : "booklist.do",
    		data : {
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
    function isdel(select_no,table_name,rere){
    	$.ajax({
    		url: "actisdel.do",
    		type: 'get',
    		data: {
    			select_no : select_no,
    			table_name : table_name
    		},
    		success : function(res){
    			alert('isdel 성공');
    			if (table_name == 'message') {
    				if (rere == 1){
	    				getMessReadList(1, ${loginInfo.member_no});
    				} else {
	    				getMessSendList(1, ${loginInfo.member_no});
    				}
    			} else {
    				getActList(1, ${loginInfo.member_no}, table_name);
    			}
    		}
    	});
    }
    /* isdel게시글 */
    function isdelMulti(table_name,rere){
    	$("input[name=select_no]:checked").each(function(){
    		select_no = parseInt($(this).val());
    		isdel(select_no,table_name,rere);
    	})
    }    
    function isdelSingle(a, table_name){
    		select_no = parseInt(a);
    		isdel(select_no,table_name);
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
	function del(select_no, table_name, rere){
		$.ajax({
			url : "fridel.do",
			type : 'get',
			data : {
				select_no : select_no,
				table_name : table_name
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
	function delMulti(table_name,rere){
	    $("input[name=select_no]:checked").each(function(){
	    	select_no = parseInt($(this).val());
	    	del(select_no, table_name, rere);	
	    });
    }
	/* 단일 선택 삭제 */
	function delSingle(a, table_name, rere){
    	select_no = parseInt(a);
    	del(select_no, table_name, rere);	
	}
	
	// 쪽지보내기
	function popmessage(){
	    var url = "/pet/message/index.do"
	  	var name = "popup message"; 
	    var option = "width = 600, height = 500, top = 100, left = 200, location = no"
	    window.open(url, name, option);  
	    connectWS();
	} 
	
	
	// 아이디 클릭시 나의 활동 내역 	
	$(function(){ 
		${param.add}(1,${loginInfo.member_no},'board');		
	});
	
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