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
		
		if ($("#member_id").val().trim() == ''){
			   alert('아이디를 입력해주세요.');
			   $("#member_id").focus();
			   return;   
	   	
	   	}
		
		if ($("#pwd").val().trim() == ''){
			   alert('비번을 입력해주세요.');
			   $("#pwd").focus();
			   return;   
	   	
	   	}
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if( !reg.test($("#pwd").val())) {
		       alert("비번조합 틀렸음여!!");
		       return;
		   }
		  
		if($("#pwd").val().trim() != $("#pwd_check").val()){
   			alert('비밀번호를 확인 해 주세요');
   			$("#pwd_check").focus();
   			return;
   		}
		if ($("#email").val().trim() == '') {
			alert('이메일을 입력 해 주세요.');
			$("#email").focus();
			
			return;
		}
		var regExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!regExp.test($("#email").val())) {
			alert("이메일 형식이 아닙니다.");
			return;
		} 
		if ($("#name").val().trim() == ''){
			   alert('이름을 입력해주세요.');
			   $("#name").focus();
			   return;   
	   	
	   	}

		console.log("member_id : "+ member_id);
		console.log("email : "+ email);
		console.log("name : "+ name);
		console.log("pwd : "+ pwd);
		$('#frm').submit();
	}
	function checkemail(){
		var email = $('#email').val();
		console.log("email : "+ email);
		
		$.ajax({
			url : 'emailCheck.do',
			type : 'get',
			data : {"email" : email}, // data:{"email":$("#email).val()} 이렇게쓰거나.. email값을 받아오는 코드를 작성해줘야됨.
			success : function(cnt) {
				if ($("#email").val().trim() == '') {
					alert('이메일을 입력 해 주세요.');
					$("#email").focus();
				}else{
					if (cnt == 'true') {
						alert('입력한 이멜이 중복임. 다시 try');
						$("#email").val('');
						$("#email").focus();
						emailCheck = false;
						
					}else{
						alert('인증번호발송되었습니다');
					
					}	
				}
			}
		})
	}
	
	 function checkPwd(){
		var reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if( reg_pwd.test($("#pwd").val())) {
		    $('.ptxt').css("display","none");
		    return;
		} 
	}
    function checkId(){
    	var member_id = $('#member_id').val();
    	if ($("#member_id").val().trim() == ''){
    		//alert('아이디 입력하셈.');
    		$('.id_ok').css("display","none"); 
            $('.id_already').css("display", "none");
			$("#member_id").focus();
			return;
    	}
    	
         //id값이 "id"인 값을 받아와서 저장
        $.ajax({
            url:'idCheck.do', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{"member_id": member_id},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                 if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                    $('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                    //alert("아이디를 다시 입력해주세요");
                    //$('#member_id').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        
    };
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
    function certification(){
    	var certi = $('#e_certification').val();
		console.log("e_certification : "+ certi);
		if ($("#e_certification").val().trim() == '') {
			alert('인증번호를 입력해주세요.');
			$("#e_certification").focus();
			return;
		}
		$.ajax({
			url : 'Certification.do',
			method : 'get',
			data : {"certi" : certi}, // data:{"email":$("#email).val()} 이렇게쓰거나.. email값을 받아오는 코드를 작성해줘야됨.
			success : function(res) {
				if(res.trim() != ''){
						//$("#e_certification").val('');
						//$("#e_certification").focus();
						alert('인증완료');
				
				}else{
					alert('인증번호를 다시 확인해주세요');
					$("#e_certification").val('');
					$("#e_certification").focus();
					console.log("###"+res+"###")
				}
			},
			error:function(){
                alert("에러");
			}
		})
    
    }
    

</script>

<script>
    function zipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("zipcode").value = extraAddr;
                    addr += extraAddr;
                } 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
            
            }
        }).open();
    }
</script>
<script>
   $(function() {
       //input을 datepicker로 선언
       $("#birthday").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: '-100Y' //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       	   ,yearRange: 'c-99:c+99'
       });                    
       
      // 초기값을 오늘 날짜로 설정해줘야 합니다.
       //$('#birthday').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>
<style>
	.id_ok{
		display:none;
	}
	
	.id_already{
		display:none;
	}
	.nick_ok{
		display:none;
	}
	
	.nick_already{
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
			<h3 class="sub_title">회원가입</h3>
			<form name="frm" id="frm" action="join.do" method="post">
				<!-- enctype="multipart/form-data" -->
				<table class="board_write">
					<caption>회원가입</caption>
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>*아이디</th>
							<td><input type="text" name="member_id" id="member_id" oninput="checkId()" style="float: left;">
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
							<th>*이메일</th>
							<td><input type="text" name="email" id="email" class="inNextBtn" style="float: left;"> 
								<span class="emailCheck"><a href="javascript: checkemail();" class="btn bgGray" style="float: left; width: auto; clear: none;">인증번호발송</a>	</span>
							</td>
						</tr>
						<tr>
							<th>*이메일인증번호</th>
							<td><input type="text" name="e_certification" id="e_certification" class="inNextBtn" style="float: left;"> 
								<span class="e_certification"><a href="javascript: certification();" class="btn bgGray" style="float: left; width: auto; clear: none;">확인</a></span>
							</td>
						</tr>

						<tr>
							<th>*이름</th>
							<td><input type="text" name="name" id="name"
								style="float: left;"></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input type="text" name="nickname" id="nickname" oninput="checkNick()"style="float: left;">
								<span class="nick_ok">사용가능한 닉네임입니다.</span>
							 	<span class="nick_already">이미 사용중인 닉네임입니다.</span>
							</td>
						</tr>
						<tr>
							<th>성별</th>
							<td><select name="gender" id="gender">
									<option value="1">남성</option>
									<option value="2">여성</option>
							</select></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" name="birthday" id="birthday" style="float: left;" autocomplete="off"></td>
						</tr>
						<tr>
							<th rowspan="3">주소</th>
							<td>
								<input type="text" name="zipcode" id="zipcode" class="inNextBtn" style="float: left;" readonly> 
								<span class="email_check"><a href="javascript:zipcode();" class="btn bgGray"
										style="float: left; width: auto; clear: none;">우편번호</a>
								</span>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="addr" id="addr"
								style="width: 80%" readonly></td>
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