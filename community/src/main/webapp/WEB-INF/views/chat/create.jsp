<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/>
    <style>
    body {
    	width : 330px;
    	height: 330px;
    	padding-top: 10px;
    }
    div {
    	height: auto;
    }
    .container {
    	width : 300px;
    	height: 300px;
    }
    p {
    	text-align: center;
    	font-size: 12px;
    	height: 35px;
    	vertical-align: middle; 
    	line-height: 35px;
    }
    input {
    	width : auto;
    	float: right;
    	line-height: 30px;
    }
    input[type='number'] {
    	margin : 0;
    	border : 1px solid #d1d1d1;
    	padding : 0;
    }
    </style>
	<script>
	$(function() {
		window.resizeTo( 
				$('body').width() + (window.outerWidth - window.innerWidth), 
				$('body').height() + 10 + (window.outerHeight - window.innerHeight));
	})
		function submit_() {
			
			$('#type').val('1');
			$('form').submit();
		}
	</script>
	<title>Home</title>
</head>
<body>
	<div class="container">
	    <div class="box">
			<div >
			    <form id="form" method="post" action="/pet/chat/create.do">
			        <div>
			            <p><strong>유형 : </strong><input type="text"  name="type"	 id="type" readonly="readonly" placeholder="오픈채팅"></p>
			        </div>
			        <div>
			            <p><strong>제목 : </strong><input type="text"  name="title" placeholder="제목" autofocus></p>
			        </div>
			        <div>
			            <p><strong>최대 참여 인원 : </strong><input type="number"  name="limit" min="3" max="20" value="3"></p>
			        </div>
			        <div style="margin : 20px; text-align: center;">
			            <button class="btn" type="submit" onclick="submit_();" style="text-align: center;">오픈채팅방 생성</button>
			        </div>
			    </form>
			</div>
	    </div>
	</div>
</body>
</html>