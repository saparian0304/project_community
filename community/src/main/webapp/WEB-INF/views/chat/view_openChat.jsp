<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 - ${param.name }</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<style>
#chatbox, .inputBox{
	background-color: #fcd7d6  ;

}
.msg {
	width: 220px;
	height: auto;
	margin-bottom: 15px;
	border-radius: 20px;
	background-color: #8dcdcc;
	
	padding : 10px;
	float:left;
}
.msgDate {
	float: right;
}
.myMsg {
	background-color: #ffff49;
	float: right;
}
.space {
	height : 5px;
}
</style>
<script type="text/javascript">
	if (${empty loginInfo}) {
		alert('로그인 부탁드립니다.')
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
			kick : function(nickname) {
				this._sendMessage('${channel_no}', 'CMD_MSG_KICK', nickname);
				$('#message').val('');
			},
			sendChat : function() {
				this._sendMessage('${channel_no}', 'CMD_MSG_SEND', $('#message').val());
				$('#message').val('');
			},
			sendEnter : function() {
				this._sendMessage('${channel_no}', 'CMD_ENTER', $('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(msgData) {
				// 정의된 CMD 코드에 따라서 분기 처리
				if (msgData.cmd == 'CMD_MSG_SEND') {
					if (msgData.member_no == member_no){
						$('#divChatData').append('<div class="msg myMsg">' + msgData.content+'<br><span class="msgDate">' +msgData.date + '</span></div>');
					} else {
						$('#divChatData').append('<div class="msg">' + msgData.content +'<br><span class="msgDate">' +msgData.date + '</span></div>');
					}
					$('#divChatData').scrollTop($('#divChatData')[0].scrollHeight);
				}
				else if (msgData.cmd == 'CMD_ENTER'){
					//$('#divChatData').append('<div>' + msgData.content + '</div>');
					//$('#divChatData').scrollTop($('#divChatData')[0].scrollHeight);
				}
				else if (msgData.cmd == 'CMD_EXIT'){
					$('#divChatData').append('<div>' + msgData.content + '</div>');
					$('#divChatData').scrollTop($('#divChatData')[0].scrollHeight);
				}
				else if (msgData.cmd == 'CMD_MSG_KICK'){
					alert('방장에 의해 강제 퇴장되었습니다.');
					winClose();
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
						type : 1
				};
				var jsonData = JSON.stringify(msgData);
				this._socket.send(jsonData);
			}
	}
	
	var close_ = '${close_}';
	function winClose(){
	  window.open('','_self').close(); 
	};
		
	$(function() {
		
		// close_ 값이 있으면 창 종료
		if(close_ == 'true') {
			winClose();	
		}
		
		webSocket.init({url : '/pet/chat'});
		$('#chatbox').css('display', 'block');
		$('#divChatData').scrollTop($('#divChatData')[0].scrollHeight);
		window.resizeTo( 
			400 + (window.outerWidth - window.innerWidth), 
			550 + (window.outerHeight - window.innerHeight));
		
		// 강퇴 버튼 생성
		$('.kick_img').on('click', function () {
			var inputNickname = document.createElement('input');
			inputNickname.setAttribute("type", "text");
			inputNickname.setAttribute("name", "nickname");
			inputNickname.setAttribute("value", "");
			inputNickname.className += 'nickname';

			var btn = document.createElement('input');
			btn.setAttribute("type", "button");
			btn.setAttribute("value", "강퇴");
			btn.className += 'kick_btn';
			
			$('.kick_img').append(inputNickname);
			$('.kick_img').append(btn);
			$(".kick_img").off("click");
			
			$('.kick_btn').on('click', function () {
				webSocket.kick($('.nickname').val());
			})
		})
		
		// 강퇴 버튼 확인
		
	})
</script>
</head>
<body>
	<div class="inputBox" style='width: 94%; padding:0 10px 0 0'>
		<c:if test="${member_no == channelInfo.master_no }">
			<span class="kick_img">
				<img src="/pet/img/btn_kick.png" width="30px" style='padding:0 0 0 10px' >
			</span>
		</c:if>
		<a href="/pet/chat/exit.do?channel_no=${channel_no }"><img src="/pet/img/btn_exit.png" width="30px" style="float: right; margin-right: 5px;"></a>
	</div>
	<div id='chatbox' style='width: 350px; height: 80%;  display: none;'>
		<div id="divChatData" style='width: 100%; height: 420px; padding:10px; border:solid 1px #e1e3e9; overflow-y:auto;'>
			<c:forEach  var="map" items="${data}">
				<!-- (회원번호 : ${map.member_no } ) -->
				<c:if test="${map.member_no == loginInfo.member_no}">
					<div class="msg myMsg">${map.nickname } : ${map.content } 
				</c:if>
				<c:if test="${map.member_no != loginInfo.member_no}">
					<div class="msg">${map.nickname } : ${map.content }  
				</c:if>
					<br>
					<span class="msgDate"><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${map.regdate }"/></span> 
				</div>
			</c:forEach>
		</div>
		<div class="inputBox" style="width:100%; height:20%; padding: 10px;">
			<input type="text" id="message" onkeypress="if(event.keyCode == 13) {webSocket.sendChat();}" style='width: 65%; height: 20px; font-size: 20px;'>
			<input type="button" id="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" style='width: 30%; float: right; height: 27px; font-size: 15px;'>
		</div>
	</div>
</body>

</html>