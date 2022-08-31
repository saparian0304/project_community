<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection"
	content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>회원가입</title>
<link rel="stylesheet" href="/pet/css/reset.css" />
<link rel="stylesheet" href="/pet/css/contents.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" /></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	function goSave() {
		
		if ($("#admin_id").val().trim() == ''){
			   alert('아이디를 입력해주세요.');
			   $("#admin_id").focus();
			   return; 
		}
		
		if ($("#pwd").val().trim() == ''){
			   alert('비번을 입력해주세요.');
			   $("#pwd").focus();
			   return;   
	   	
	   	}
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if( !reg.test($("#pwd").val())) {
		       alert("비밀번호는 숫자, 영문, 특수문자조합으로 8자 이상으로 입력해주세요.");
		       return;
		   }
		  
		if($("#pwd").val().trim() != $("#pwd_check").val()){
   			alert('비밀번호를 확인 해 주세요');
   			$("#pwd_check").focus();
   			return;
   		}
		
		if ($("#name").val().trim() == ''){
			   alert('이름을 입력해주세요.');
			   $("#name").focus();
			   return;   
	   	
	   	}
		
		
		$('#frm').submit();
	}
	
	 function checkPwd(){
		var reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if( reg_pwd.test($("#pwd").val())) {
		    $('.ptxt').css("display","none");
		    return;
		} 
	}
    function checkId(){
    	
    	var admin_id = $('#admin_id').val();
    	if ($("#admin_id").val().trim() == ''){
    		//alert('아이디 입력하셈.');
    		$('.id_ok').css("display","none"); 
            $('.id_already').css("display", "none");
			$("#admin_id").focus();
			return;
    	}
    	
         //id값이 "id"인 값을 받아와서 저장
        $.ajax({
            url:'/pet/admin/idCheck.do', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{"admin_id": admin_id},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                 if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                    $('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                    $('#admin_id').val(''); 
                    //alert("아이디를 다시 입력해주세요");
                    
                }
            
            },
            error:function(){
                alert("에러입니다");
            }
        });
     
        }

</script>

<style>
	.id_ok{
		display:none;
	}
	
	.id_already{
		display:none;
	}
	.ptxt{
		display:inline-block;
	}
	
</style>
</head>
<body>

	<div class="sub">
		<div class="size">
			<h3 class="sub_title">관리자 생성</h3>
			<form name="frm" id="frm" action="join.do" method="post">
				<!-- enctype="multipart/form-data" -->
				<table class="board_write">
					<caption>관리자 생성</caption>
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>*아이디</th>
							<td><input type="text" name="admin_id" id="admin_id" onfocusout="checkId()" style="float: left;">
							<span class="id_ok">사용 가능한 아이디입니다.</span>
							<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
							</td>
						</tr>
						<tr>
							<th>*비밀번호</th>
							<td><input type="password" name="pwd" id="pwd"  onfocusout="checkPwd()" style="float: left;"> 
							<span class="ptxt">비밀번호는 숫자, 영문, 특수문자조합으로 8자 이상으로 입력해주세요.</span>
							</td>
						</tr>
						<tr>
							<th>*비밀번호<span>확인</span></th>
							<td><input type="password" name="pwd_check" id="pwd_check" style="float: left;">
							</td>
						</tr>
						<tr>
						<tr>
							<th>*이름</th>
							<td><input type="text" name="name" id="name"
								style="float: left;"></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" name="cmd" value="write.do" /> 
				<input type="hidden" name="checkEmail" id="checkEmail" value="0" />
			</form>
			<!-- //write--->
			<div class="btnSet clear">
				<div>
					<a href="javascript:;" class="btn" onclick="goSave();">가입</a> 
					<a href="javascript:;" class="btn" onclick="history.back();">취소</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>