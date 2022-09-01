<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오픈채팅목록</title>
<link rel="stylesheet" href="/pet/css/chat.css"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript" src="/pet/js/util/chat.js"></script>
<script type="text/javascript">
	function popup(url, name) {
		var option = "width = 400, height = 520, top = 100, left = 100";
		window.open(url, name, option);
	}


	if (${loginInfo.member_no == null}) {
		alert('로그인 부탁드립니다.');
		location.href='/pet/member/login.do';
	}
	
	var member_no = '${loginInfo.member_no}';
	var nickname = '${loginInfo.nickname}';
	var webSocket = {
			init : function(param) {
				this.url = param.url;
				console.log(param);
				console.log(this.url);
				
				this._initSocket();
			},
			sendChat : function() {
				this._sendMessage('${param.channel}', 'CMD_MSG_SEND', $('#message').val());
				$('#message').val('');
			},
			sendEnter : function() {
				this._sendMessage('${param.channel}', 'CMD_ENTER', $('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(msgData) {
				// 정의된 CMD 코드에 따라서 분기 처리
				if (msgData.cmd == 'CMD_MSG_SEND') {
					$('#divChatData').append('<div>' + msgData.msg + '</data>');
				}
				else if (msgData.cmd == 'CMD_ENTER'){
					$('#divChatData').append('<div>' + msgData.msg + '</data>');
				}
				else if (msgData.cmd == 'CMD_EXIT'){
					$('#divChatData').append('<div>' + msgData.msg + '</data>');
				}
			},
			closeMessage: function(str) {
				$('#divChatData').append('<div> 연결끊김 : ' + str + '</div>');
			},
			disconnect : function() {
				this._socket.close();
			},
			_initSocket : function() {
				this._socket = new SockJS(this.url);
				this._socket.onopen = function(evt) {
					webSocket.sendEnter();
				};
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(JSON.parse(evt.data));
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(JSON.parse(evt.data));
				}
			},
			_sendMessage : function(channel_no, cmd, content) {
				var msgData = {
						channel_no : channel_no,
						cmd : cmd,
						content : content,
						nickname : nickname,
						member_no : member_no,
						type : -1	
				};
				var jsonData = JSON.stringify(msgData);
				this._socket.send(jsonData);
			}
	}
	
	var close_ = '${param.close_}';
	
	$(function() {
		// close_ 값이 있으면 창 종료
		if(close_ == 'true') {
			winClose();	
		}
		
		webSocket.init({url : '/pet/chat'});
		window.resizeTo( 
			400 + (window.outerWidth - window.innerWidth), 
			520 + (window.outerHeight - window.innerHeight));
	})
</script>
</head>
<body>
	<div class="box" >
		<div class="list">
			<span style="margin: 0 0 0 10px; line-height: 50px;"><a href='/pet/chat/index.do' >친구</a></span>
		</div>
		<div class="list">	
			<span style="margin: 0 0 0 10px; line-height: 25px;"><a href='/pet/chat/myOpenChat.do' >참여 중인 오픈채팅방</a></span>
		</div>
		<div class="list">
			<span style="margin: 0 0 0 10px; line-height: 50px;"><a href='/pet/chat/openChat.do' >오픈채팅방</a></span>
			<img src="/pet/img/btn_plus.png" style="width:30px; margin-top:10px; z-index: 10; float: right;" onclick="location.href='/pet/chat/create.do'" >
		</div>
			
	</div>
	
	<div style="overflow-y:auto; clear: both; overflow:hidden;">
		<c:forEach var="list" items="${list }">
		<!-- 
		친구 회원번호 : ${list.friend_no }<br>
		친구 채팅방 번호 : ${list.channel_no }
		 -->
		<div class="chat_channel">
			<div style="height: 50px;">
				<a href="javascript:popup('o/${list.channel_no }', '채팅 - ${list.nickname }')">
				${list.title }
				</a>
				<span style="float: right">${list.num_enter} / ${list.limit }</span><br>
				<span style="float: right"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate }"/></span>
			</div>
		</div>
		</c:forEach>
	</div>
</body>
</html>