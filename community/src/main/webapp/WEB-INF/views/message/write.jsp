<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/head.jsp" %>    
    <script>
    
    	function seachNick(){
    		<c:if test="${empty loginInfo}">
    			alert('로그인후 작성해주세요');
       		</c:if>
    		$.ajax({
    			url : "/pet/message/search.do",
    			data : {
    				
    				searchNick : $("#read").val()
    				 			
    			}, 
    			
    			success : function(res) {
    				if(res == 0){
    					alert('찾으시는 아이디가 없습니다.');
    					$("#read").focus();
    				}
    				else{
    					alert('내용을 입력해주세요');
    					$("#content").focus();
    					
    				}
    				 $("#read_member").val(res);
    				  console.log(res);   				
    			
    			}	
    		});     		
    	} 
    	
    </script>
<body>
	<form method="post" name="frm" id="frm" action="insert.do" style="width:800px; margin:0 auto;">
		<table>	
			<tr>
				<td>받는사람</td>				
				<td>
					<input type="hidden" name="read_member" id="read_member">
					<input type="search" name="read" id="read"> 			
					<button type="button" onclick="seachNick();">찾기</button>
				<td>
			</tr>			
			<tr>
				<td>보내는사람</td>
				<td><input type="hidden" name="send_member" value="${loginInfo.member_no}">${loginInfo.nickname}</td>		
			<tr>
				<td>보내실 말씀</td>
				<td><textarea cols="40" rows="10" name="content" id="content" placeholder="메세지를 입력해주세요"  style="width: 320px; height: 150px;"></textarea></td>
			</tr>
			<tr>
				<td>
					<input type="submit" name="" value="전송">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>