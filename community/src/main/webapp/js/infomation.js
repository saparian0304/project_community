//닉네임 눌렀을때 정보 열림
function info(gno, loginCon){	
	if(loginCon == null && loginCon == ''){
		  alert('로그인 후 사용해주세요');
	}
	if(loginCon != null && loginCon != ''){
		if($(".activityForm"+gno).css("display")=="none"){
			$(".activityForm").hide();
			$(".activityForm2").hide();
			$(".activityForm"+gno).toggle();
		} else{
			$(".activityForm"+gno).hide();
		}
	}
}

// 닉네임 클릭시 정보 보임
function info2(ono, loginCon){
	if(loginCon == null && loginCon == ''){
		  alert('로그인 후 사용해주세요');
	}
	if(loginCon != null && loginCon != ''){
		if($(".activityForm2"+ono).css("display")=="none"){
			$(".activityForm2").hide();
			$(".activityForm").hide();
			$(".activityForm2"+ono).toggle();
		} else{
			$(".activityForm2"+ono).hide();
		}
	}
}

// 쪽지보내기 팝업
function popmessage(member_no, member_nickname){
    var url = "/pet/message/send.do?member_no="+member_no+"&nickname="+member_nickname;
  	var name = "popup message"; 
    var option = "width = 600, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);   
}

// 쪽지보내고 나면 닫힘	
	function winclose(){	
		  window.open('','_self').close();
		  alert("발송 완료 되었습니다.");
		  
	}	
	
// 팔로우	
function follow(member_no, i_no){
	if(i_no == null && i_no == ''){
		  alert('로그인 후 사용해주세요');
	} 
	
	 $.ajax({
		url :"/pet/follow/insert.do",
		data : {
			you_no : member_no,
			i_no : i_no
		},
		success : function(res){	
			$(".followGo"+member_no).replaceWith('<p class="followNo'+member_no+'"><button onclick="unfollow(' + member_no + ');">팔로우해제</button></p>');			 
		}		
	}); 
}

//팔로우 해제 
function unfollow(member_no, i_no){
	if(i_no == null && i_no == ''){
		 alert('로그인 후 사용해주세요');
	} 
	
	 $.ajax({
		url :"/pet/follow/insert.do",
		data : {
			you_no : member_no,
			i_no : i_no
		},
		success : function(){
			$(".followNo"+member_no).replaceWith('<p class="followGo'+member_no+'"><button onclick="follow(' + member_no + ');">팔로우</button></p>');
			
		}
		
	}); 
} 

// 차단
function block(member_no,  i_no){
	if(i_no == null && i_no == ''){
		 alert('로그인 후 사용해주세요');
	} 
	if(i_no != null && i_no != ''){ 
		if (confirm('차단 하시겠습니까?')){	
			 $.ajax({
				url :"/pet/follow/blockinsert.do",
				data : {
					you_no : member_no,
					i_no : i_no
				},
				success : function(res){	
					alert("차단하였습니다.");
					 document.location.reload();
				}		
			});
		}
	}
} 

// 친구요청
function friinsert(member_no, i_no){
	if(i_no == null && i_no == ''){
		 alert('로그인 후 사용해주세요');
	} 
	if(i_no != null && i_no != ''){ 
			if (confirm('친구 요청을 하시겠습니다?')){			
			 $.ajax({
				url :"/pet/mypage/friinsert.do",
				data : {
					you_no : member_no,
					i_no : i_no
				},
				success : function(res){	
					if (res == 1) {
					alert("친구요청이 완료되었습니다.");
					if(socket){
						socket.send("fri,"+login_no+","+member_no+",0,0");
					}
					} else if(res == 0){
						alert("이미 요청한 사용자입니다.");
					}
				}		
			});
		}
	}
} 

