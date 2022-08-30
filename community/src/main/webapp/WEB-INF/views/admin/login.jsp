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
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
		 function loginCheck(){
			 if ($("#admin_id").val().trim() ==''){
				 alert('아이디를 입력해주세요');
				 $("#admin_id").focus();
				 return false;
			 }
			 if ($("#pwd").val().trim() ==''){
				 alert('비번을 입력해주세요');
				 $("#pwd").focus();
				 return false;
			 }
			 console.log("login_check")	
		}
	
	</script>
	
</head>
<body>
        <form action="/pet/admin/login.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return loginCheck();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">관리자 페이지 로그인</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="admin_id" name="admin_id" placeholder="아이디"></li>
                                    <li><input type="password" id="pwd" name="pwd" placeholder="비밀번호"></li>
                                </ul>
								    <li>
									</li>
                                <div class="login_btn">
                                	<input type="submit" value="로그인" alt="로그인" />
                                </div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="/pet/admin/join.do" class="btn">관리자 생성</a> 
                                </div>
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
        
</body>
</html>