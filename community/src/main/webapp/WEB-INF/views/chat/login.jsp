<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/head.jsp" %>
<%@ page session="false" %>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<style>
	    body {
	        background: #f8f8f8;
	        padding: 60px 0;
	    }
	    
	    #login-form > div {
	        margin: 15px 0;
	    }
	
	</style>
	<title>Home</title>
</head>
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">환영합니다!</div>
            </div>
            <div class="panel-body">
                <form id="login-form" method="post" action="/pet/chat.do">
                    <div>
                        <input type="text"  name="Uname"	class="form-control" placeholder="Username" autofocus>
                        <input type="text"  name="channel"	class="form-control" placeholder="채팅방 번호">
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary">로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</html>