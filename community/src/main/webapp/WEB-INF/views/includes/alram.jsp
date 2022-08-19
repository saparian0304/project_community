<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
    
<script>
/* 실시간 알람 */
var socket = null;
function connectWS(){
	console.log("==============");
	var ws = new SockJS("/pet/alram");
	socket = ws;
	
	ws.onopen = function(){
		console.log("open");
	};
	
	ws.onmessage = function(event){
		console.log("onmessage" + event.data);
		var $socketAlert = $('li#socketAlert');
		$socketAlert.html("<img src='/pet/img/isalram.png' style='width: 27px'>");
//		$socketAlert.css({
//			"display" :  "block",
//		});
			
		
		setTimeout(function(){
			$socketAlert.html("<img src='/pet/img/alram.png' style='width: 27px'>");
		}, 5000);
	};
	
	ws.onclose = function(){
		console.log("close");
		setTimeout(function(){
			connectWS();
		}, 1000);
	};
};
$(function(){
	/* 실시간 알람 */
	if(${loginInfo != null}){
		connectWS();
	}
})
</script>