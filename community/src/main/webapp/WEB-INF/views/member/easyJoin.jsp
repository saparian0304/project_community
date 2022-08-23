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
    <script>
    function checkNick(){
    	if ($("#nickname").val().trim() == ''){
    		$('.nick_ok').css("display","none"); 
            $('.nick_already').css("display", "none");
			$("#nickname").focus();
			return;
    	}
        var nickname = $('#nickname').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'nickname.do', //Controller에서 요청 받을 주소
            method:'post', //POST 방식으로 전달
            data:{"nickname": nickname},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                 if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 닉네임 
                    $('.nick_ok').css("display","inline-block"); 
                    $('.nick_already').css("display", "none");
               	 } else { // cnt가 1일 경우 -> 이미 존재하는 닉네임
                    $('.nick_already').css("display","inline-block");
                    $('.nick_ok').css("display", "none");
                }
            },
            error:function(){
                alert("에러입니다");
            }
        })
    }
    
    function goeasy(){
    	
    	if($("#agree") != true){
    		alert('약관에 동의하지 않았습니다')
    		$("#agree").focus();
    		return false;
    	}else{
    		alert('약관에 동의하셨습니다')
    		
    	}
    	
    	if ($("#nickname").val().trim() == ''){
			   alert('닉네임을 입력해 주세요.');
			   $("#nickname").focus();
			   return;   
	   	
	   	}
    	
    	$(".btn").attr("href", "/pet/member/easyJoin.do?nickname="+$('#nickname').val());
    }
    </script>
    
    <style>

	.nick_ok{
		display:none;
	}
	
	.nick_already{
		display:none;
	}

	
</style>
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
                           		<div>개인정보 수집, 이용에 동의 하십니까?</div>
                           			<input type="checkbox" id="agree" name="agree" value="1">
                           			<span><label for="agree" onclick="return agree() ">동의</label></span>
                           			<br>
                            	
                            	<div scope="row">닉네임은 필수입력사항입니다</div>
									<td><input type="text" name="nickname" id="nickname" oninput="checkNick()"style="float: left;">
										<span class="nick_ok">사용가능한 닉네임입니다.</span>
									 	<span class="nick_already">이미 사용중인 닉네임입니다.</span>
									</td><br>
                               <div><a href="#" class="btn" onclick="goeasy();">회원가입</a></div>
                             </fieldset>
						</div>
                     </div>	
                </div>
            </div>
        </form>
        
</body>
</html>