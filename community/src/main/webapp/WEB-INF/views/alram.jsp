<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	.socket {
		border : 1px solid black;
		text-align : center;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script>
 var socket = null;
function connect(){
	var ws =  new SockJS("/pet/alram");
	socket = ws;
	
	ws.onopen = function(){
		console.log("Info : connection opened.");
	};
	
	ws.onmessage = function(event){
		console.log("ReceiveMessage: " + event.data + "\n");
	};
	
	ws.onclose = function(event){
		console.log("Info : connection closed.");
		setTimeout(function(){connect();}, 1000);
	};
	
	ws.onerror = function(err){
		console.log("Error : " + err);
	};
}

$(function(){
	$('#btnSend').on('click', function(evt){
		evt.preventDefault();
		if(socket.readyState !== 1) return;
		
		var msg = $('input#msg').val();
		socket.send(msg);
	});
	
	connect();
})

</script>
</head>
<body>
<form>
	<table class="socket">
		<tr>
			<th colspan="2">웹소켓 연습 ${loginInfo.nickname }</th>
		</tr>
		<tr>
			<th><input type="text" id="msg" ></th>
			<th><button id="btnSend">제출</button></th>
		<tr>
	</table>
</form>
</body>
</html>