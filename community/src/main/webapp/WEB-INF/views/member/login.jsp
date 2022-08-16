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
		Kakao.init('559a5c15295281d3e0cf6c7390c0d790'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		
		//sns간편가입
		function loginBySns() {
		    Kakao.Auth.login({
		    	scope: 'account_email, profile_nickname', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                            var email = kakao_account.email;
                    		var nickname = kakao_account.nickname;
                            console.log(res.id);
                            console.log(kakao_account.email);
                            console.log(kakao_account.profile.nickname);
                            $.ajax({
                            	url:'loginBySns.do',
                            	data : {
                            		id : res.id,
                            		/* email : email,
                            		nickname : nickname,*/
                            		type:'K' 
                            	},
                            	method : 'post',
                            	success:function(res) {
                            		console.log(res);
                            		location.href="/pet/board/index.do"
                            	}
                            })
                        }
                    });
                    //location.href='../member/login.do' //리다이렉트 되는 코드
                },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		   // console.log("kakao_login")
		  }
		//sns로그아웃  
		function logoutBySns() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
	</script>
	<script>
		 function loginCheck1(){
			 if ($("#member_id1").val().trim() ==''){
				 console.log("member_id : "+member_id);
				 alert('아이디를 입력해주세요');
				 $("#member_id1").focus();
				 return false;
			 }
			 if ($("#pwd1").val().trim() ==''){
				 console.log("pwd : "+ pwd);
				 alert('비번을 입력해주세요');
				 $("#pwd1").focus();
				 return false;
			 }
			 console.log("login_check")	
			}
	
	</script>
	
</head>
<body>
        <form action="login.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return loginCheck1();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">로그인</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="member_id1" name="member_id" placeholder="아이디"></li>
                                    <li><input type="password" id="pwd1" name="pwd" placeholder="비밀번호"></li>
                           		</ul>
                           		<ul>
									<li onclick="loginBySns();" class="btn">
								      <a href="javascript:void(0)">
								          <span>카카오 로그인</span>
								      </a>
									</li>
								</ul>
								<ul>
									<li onclick="logoutBySns();" class="btn">
								      <a href="javascript:void(0)">
								          <span>카카오 로그아웃</span>
								      </a>
									</li>
								</ul>
                                    <li><label><input type="checkbox" name="reg1" id="reg1"/> 아이디저장</label></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                    <a href="findId.do" class="btn">아이디/비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
        
</body>
</html>