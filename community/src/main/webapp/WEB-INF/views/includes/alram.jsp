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
		//setTimeout(function(){
	//		connectWS();
	//	}, 1000);
	};
	
	ws.onmessage = function(event){
		console.log("onmessage" + event.data);
		var $socketAlert = $('h3#socketAlert');
		$socketAlert.html(event.data);
		$socketAlert.css({
			"display" :  "block",
			"backgorund" : "yellow"
		});
			
		
		setTimeout(function(){
			$socketAlert.css("display", "none");
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