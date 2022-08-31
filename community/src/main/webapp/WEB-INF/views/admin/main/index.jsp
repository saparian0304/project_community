<%@ page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title%></title>      
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<style>
	.todayT{
		width:100%;
		height: 50px;
		line-height: 50px;
		background-color: #FFF8DC; 
	}
	
	.todayC{
		width:100%;
		margin-top:20px;
		height:300px;
	}
	
	.todayP{
		width: 100%;
		height: 80px;
		margin-top: 5px;		
	}
	.todayP:nth-child(1){
		background-color: #87f5f5;			
	}
	
	.todayP:nth-child(2){
		background-color: #beefff;			
	}
	
	.todayP:nth-child(3){
		background-color: #c8ffff;			
	}
	
	.todayP:nth-child(4){
		background-color: #ccffcc;			
	}
	
	.todaySpan{
	 	display: inline-block;
		font-family: 'Noto Sans KR', sans-serif;
		width: 300px;
		height: 60px; line-height:50px;
		font-size: 18px; font-weight: bold;
		text-align: center;
		margin: 10px 10px 10px 30px;
		background-color: rgba(255,0,0,0.1);
		
		border-radius: 20px;
	}
	
	.todaySpanC{
		font-size: 25px;
		color: #F08080;
	}
	
	
</style>
<script>
	$(document).ready(function(){
		/* date = new Date();
		year = date.getFullYear();
		month = date.getMonth() + 1;
		day = date.getDate(); */
		
		date = new Date();
		year = date.getFullYear();
		month = ((date.getMonth() + 1) >= 10) ? (date.getMonth() + 1) : '0' + (date.getMonth() + 1);
		day = ((date.getDate())>=10) ? (date.getDate()) : '0' + (date.getDate()) ;
		
		document.getElementById("current_date").innerHTML = "[ " + year  + "-" + month + "-" + day + " ]" ;
	});
</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="main">
		<div class="wid48 fl_l">
			<div class="box notice">
				<div class="todayT">
					<h2>Today <span id="current_date"></span></h2>													
				</div>
				<div class="todayC">
					<p class="todayP"><span class="todaySpan">총 방문수 : <span class="todaySpanC">${total.vt.todaytotal}</span></span> <span class="todaySpan">회원 방문수 : <span class="todaySpanC">${total.vt.mtoday}</span></span> <span class="todaySpan">비회원 방문수 : <span class="todaySpanC">${total.vt.nonmtoday}</span></span></p>
					<p class="todayP"><span class="todaySpan">가입자 수 : <span class="todaySpanC">${total.cur.rdate}</span></span> <span class="todaySpan">출석한 회원 : <span class="todaySpanC">${total.cur.clogin}</span></span>
					<p class="todayP"><span class="todaySpan">총 게시글 수 : <span class="todaySpanC">${total.boardToday}</span></span></p>
					<p class="todayP"><span class="todaySpan">총 댓글 수 : <span class="todaySpanC">${total.replyToday}</span></span></p>						
				</div>
			</div>
		</div>				
	</div>
</div>
<!--//contentsWrap-->
</body>
</html>
