<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>로그인</title>
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"/></script>
</head>
<body>
        <form action="index.do" method="get" id="loginFrm1" name="loginFrm1" onsubmit="return loginCheck1();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">간편회원가입</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                           		<div scope="row">개인정보이용동의</div>
                           		<div>개인정보 수집, 이용에 동의 하십니까?
                           			<input type="checkbox" id="agree" name="agree" value="y">
                           			<span><label for="agree">동의</label></span>
                           		</div>	
                           		<div><a href="/pet/member/easyJoin.do" class="btn">회원가입</a></div>
                            </fieldset>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
        
</body>
</html>