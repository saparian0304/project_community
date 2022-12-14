<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>쪽지보내기</title>
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/common.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/>
    <script src="/pet/smarteditor/js/HuskyEZCreator.js"></script>
    <script src="/pet/js/function.js"></script>
    <script type="text/javascript" src="/pet/js/message.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
<%@ include file="/WEB-INF/views/includes/alram.jsp" %>    
<script>
function soSend(){
	var readMember = $('#read_member').val().trim();
	var soMsg = "message,"+${loginInfo.member_no}+","+readMember+",0,0";
	if(socket){
		socket.send(soMsg);
	}
}
<% session.setAttribute("plus", "message"); %>

// message.js 변수
var loginCon = "${loginInfo}";
var loginMem = "${loginInfo.member_no}";

</script>

<body>
<div style="width:500px;margin:40px auto;">
	<form method="post" name="frm" id="frm" action="insert.do" onsubmit="return messageWrite()"> <!-- onsubmit="return messageWrite()" -->
		<table>	
			<tr>
				<td>받는사람</td>				
				<td>
					<input type="hidden" name="read_member" id="read_member">
					<input type="search" name="read" id="read" onkeypress="if (event.keyCode==13) seachNick();"> 			
					<button type="button" onclick="seachNick();" style="width : 100px; height : 25px; margin-left: 5px;" class="reqbtn mymess">닉네임 찾기</button>
				<td>
			</tr>			
			<tr>
				<td>보내는사람</td>
				<td>
					<input type="hidden" name="send_member" value="${loginInfo.member_no}">
					<input type="text" name="send" id="send" value=" ${loginInfo.nickname}">
				</td>		
			<tr>
				<td>보내실 말씀</td>
				<td><textarea cols="40" rows="10" name="content" id="content" placeholder="메세지를 입력해주세요"  style="width: 320px; height: 150px;"></textarea></td>
			</tr>
			<tr>

				<td colspan="2" style="text-align: center;">
					<button style="width : 80px; height : 30px; position: center; margin-top:5px;" class="reqbtn mymess">
						<input type="submit" name="" value="보내기" onclick="soSend();" style="background-color:transparent; border:0px transparent solid;">
					</button>					
				</td>
			</tr>
		</table>
	</form>
</div>	
</body>
</html>