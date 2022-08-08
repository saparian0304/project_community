<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>게시판목록</title>
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    .reqbtn {
		  border: 2px solid black;
		  cursor: pointer;
		  border-radius: 5px;
	}
		
	.success {
		  border-color: #04AA6D;
		  color: green;
	}
		
	.success:hover {
		  background-color: #04AA6D;
		  color: white;
	}
	
	.danger {
		  border-color: #f44336;
		  color: red
	}

	.danger:hover {
		  background: #f44336;
		  color: white;
	}
    </style>
    <script>
    /* 체크박스 전체체크 */
    function selectAll(selectAll)  {
	    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    checkboxes.forEach((checkbox) => {
	       checkbox.checked = selectAll.checked
	    })
    }
    /* ajax로 친구요청목록 불러오기 */
    function getFriReq(page, member_no){
    	$.ajax({
    		url : "frireq.do",
    		data : {
    			tablename : 'friend',
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
    			tablename : 'friend',
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
    /* 다중 선택 수락 */
    function acceptMulti(){
	    $("input[name=select_no]:checked").each(function(){
	    	select_no = parseInt($(this).val());
			$.ajax({
				url : "friaccept.do",
				type : 'get',
				data : {
					select_no : select_no,
					tablename : 'friend'
				},
				success : function(res){
					alert("성공");
				    getFriReq(1, ${member_no});
				}
			})    	
	    });
	    console.log(select_no);
    }
	/* 단일선택수락 */
    function accept(a){
	    	select_no = parseInt(a);
			$.ajax({
				url : "friaccept.do",
				type : 'get',
				data : {
					select_no : select_no,
					tablename : 'friend'
				},
				success : function(res){
					alert("성공");
					getFriReq(1, ${member_no});
					
				}
			})    	
	    
	    console.log(select_no);
    }
    </script>
</head>
<body>
    
        <div class="sub">
            <div class="size">
                
    
                <div class="bbs">
                	<div><button style="width : 200px; height : 50px;" class="reqbtn success" onclick="javascript:getFriReq(1,${member_no});">친구요청목록</button>
                		<button style="width : 200px; height : 50px;" class="reqbtn success" onclick="javascript:getFriList(1,${member_no});">친구목록</button></div>
                    <div id="hi"><h1>hi~</h1></div>
                    
                
                    <!-- 페이지처리 -->
                    
                </div>
            </div>
        </div>
        
</body>
</html>