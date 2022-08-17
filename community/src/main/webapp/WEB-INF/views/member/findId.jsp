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
    <title>이메일찾기</title>
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"/></script>
    <script>
    	function findId(){
    		if ($("#name").val()== ''){
    			alert('이름을 입력해 주세요.');
    			$("#name").focus();
    			return false;
    			
    		}
    		if ($("#email").val()== ''){
    			alert('이메일을 입력해 주세요.');
    			$("#email").focus();
    			return false;
    		}
    		//ajax조회
    		console.log("이름"+$("#name").val());
    		console.log("이메일"+$("#email").val());
    		$.ajax({
    			url : 'findId.do',
    			method : 'post',
    			data : {
    				name : $("#name").val(),
    				email : $("#email").val()
    			},
    			success : function(res){
    				if(res.trim()==''){
    					$("#msg").html('입력하신 정보로 조회된 내용이 없습니다.')
    				}else{
    					$("#msg").html('아이디는 "'+res.trim()+'"입니다.')
    				}
    			}
    		})
    		 return false;
    	}
    </script>
</head>
<body>
    
        <form action="findId.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return findId();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">아이디찾기</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="name" name="name" placeholder="이름"></li>
                                    <li><input type="text" id="email" name="email" placeholder="이메일"></li>
                                    <li id="msg"></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="아이디찾기" alt="아이디찾기" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                    <a href="findPwd.do" class="btn">비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
        
</body>
</html>