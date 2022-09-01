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
    <link rel="stylesheet" href="/pet/css/common.css"/>
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/>
    <script src="/pet/smarteditor/js/HuskyEZCreator.js"></script>
    <script src="/pet/js/function.js"></script>
    <script type="text/javascript" src="/pet/js/message.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/includes/alram.jsp" %>  
  
<script>
function soSend(){
	var soMsg = "message,"+${loginInfo.member_no}+","+${param.member_no}+",0,0";
	if(socket){
		socket.send(soMsg);
	}
}
<% session.setAttribute("plus", "message"); %>

</script>
 
</head>
<body>
<div style="width:500px;margin:40px auto;">
	<form method="post" name="frm" id="frm" action="resend.do?member_no=${param.member_no}&nickname=${param.nickname}" onsubmit="return messageWrite1()">
		<table>
			<tr>
				<td>보낸 사람</td>		
				<td>  
					<input type="hidden" name="read_member" id="read_member" value="${param.member_no}">
					<input type="text" name="read" id="read" value=" ${empty param.nickname ? '관리자' : param.nickname}"> 				
				<td>							 
			</tr>			
			<tr>
				<td>받은 사람</td>
				<td>
					<input type="hidden" name="send_member" value="${loginInfo.member_no}">
					<input type="text" name="send" id="send" value="${loginInfo.nickname}"><%-- ${loginInfo.nickname} --%>
				</td>		
			<tr>
				<td>내용</td>
				<td>
					<textarea cols="40" rows="10" name="content" id="content" style="width: 320px; height: 150px;">${param.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<c:if test="${!empty param.nickname }">
					<button style="width : 80px; height : 30px; position: center; margin-top:5px;" class="reqbtn mymess">
						<input type="submit" name="" value="답장하기" ; style="background-color:transparent; border:0px transparent solid;">
					</button>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</div>	
</body>
</html>