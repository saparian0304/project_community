function seachNick(loginCon, loginMem){
	if(loginCon == null && loginCon == ''){
		 alert('로그인후 댓글작성해주세요');
	}      	
	if($("#read").val()==''){
		alert('닉네임을 입력해주세요.');
		$("#read").focus();
		return;
	}
	$.ajax({
		url : "/pet/message/search.do",
		data : {
			
			searchNick : $("#read").val()
			 			
		}, 
		
		success : function(res) {    				
			if(res == loginMem ) {
				alert($("#read").val()+" 나에게 보내시겠습니까?");
				$("#content").focus();
				$("#read_member").val(res);
			}
			else if(res == 0){
				alert($("#read").val()+" 찾으시는 닉네임이 없습니다.");
				$("#read").focus();
			} 
			
			else{
				alert($("#read").val()+"에게 메세지를 입력해주세요");
				$("#content").focus();
				$("#read_member").val(res);
			}   				 
			   			
		}	
	});     		
} 

// 닉네임 찾기하고 내용없이 보낼때
 function messageWrite() {
	 if(!content.value){
     	content.focus();   
     return false;     
   } 
	  if($("#read_member").val() == ''){
			alert('닉네임 찾기를 해주세요');
			$("#read").focus();
			return false;
		} 
	}

//내용없이 보낼때
function messageWrite1() {
	 if(!content.value){
     alert("내용을 입력하세요");  
     	content.focus();   
     return false;     
   }
} 

// 엔터 
 $('input[type="search"]').keydown(function(){
	    if(event.keyCode === 13)
	        event.preventDefault();
});
