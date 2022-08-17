<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/head.jsp" %>
	    <script>
	    	function findEmail(){
	    		//var member_id = $("#member_id").val()
	    		if ($("#member_id").val()== ''){
	    			alert('아이디를 입력해 주세요.');
	    			$("#member_id").focus();
	    			return false;
	    			
	    		}
	    	
	    		if ($("#email").val()== ''){
	    			alert('이메일을 입력해 주세요.');
	    			$("#email").focus();
	    			return false;
	    		}
	    		//ajax조회
	    		$.ajax({
	    			url : 'findPwd.do',
	    			method : 'post',
	    			data : {
	    				member_id : $("#member_id").val(),
	    				email : $("#email").val()
	    			},
	    			success : function(res){
	    				if(res.trim()==''){
	    					alert('회원이 존재하지 않습니다.');
	    				}else{
	    					alert('임시비번이 이메일로 발송되었습니다.');
	    					location.href="login.do"
	    				}
	    			}
	    		})
	    		console.log("member_id : "+$("#member_id").val()); //위에처럼 var로 선언해주거나..
	    		 return false;
	    	}
	    </script>
		    
</head>
<body>
    
        <form action="findPwd.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return findEmail();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">비번찾기</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="member_id" name="member_id" placeholder="아이디"></li>
                                    <li><input type="text" id="email" name="email" placeholder="이메일"></li>
                                </ul>
                                <div class="login_btn">
                                	<input type="submit" value="비번찾기" alt="비번찾기"/>
                                </div>
								
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                </div>
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
</body>
</html>