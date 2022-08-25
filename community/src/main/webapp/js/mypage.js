// 체크박스 전체 체크
function selectAll(selectAll)  {
	var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	checkboxes.forEach((checkbox) => {
	   checkbox.checked = selectAll.checked
	})
}

// 기본정보 불러오기
function getIndex(member_no){
	$.ajax({
		url : "info.do",
		data : {
			member_no : member_no
		},
		success : function(res){
			$("#hi").html(res);
		}
	})
}

// 친구요청목록 불러오기
function getFriReq(page, member_no){
	$.ajax({
		url : "frireq.do",
		data : {
			table_name : 'friend',
			member_no : member_no,
			page : page
		},
		success : function(res){
			$("#hi").html(res);
		}
	})
}

// 친구목록 불러오기
function getFriList(page, member_no){
	$.ajax({
		url : "frilist.do",
		data : {
			table_name : 'friend',
			member_no : member_no,
			page : page
		},
		success : function(res){
			$("#hi").html(res);
		}
	})
}

// 팔로우 목록 불러오기
function getFollList(page, member_no){
	$.ajax({
		url : "followlist.do",
		data : {
			table_name : 'follow',
			member_no : member_no,
			page : page
		},
		success : function(res){
			$("#hi").html(res);
		}
	});
}

// 차단목록 불러오기
function getBlockList(page, member_no){
	$.ajax({
		url : "blocklist.do",
		data : {
			table_name : 'follow',
			member_no : member_no,
			page : page
		},
		success : function(res){
			$("#hi").html(res);
		}
	});
}

// 내 활동 목록 불러오기
function getActList(page, member_no, table_name){
	$.ajax({
		url : "actlist.do",
		data : {
			table_name : table_name,
			member_no : member_no,
			page : page
		},
		success : function(res){
			$("#hi").html(res);
		}
	})
}

// 받은 쪽지 불러오기
function getMessReadList(page, member_no){
	$.ajax({
		url : "messreadlist.do",
		data : {
			member_no : member_no,
			page : page
		},
		success : function(res){
			$("#hi").html(res);
		}
	})
}

// 보낸 쪽지 불러오기
function getMessSendList(page, member_no){
	$.ajax({
		url : "messsendlist.do",
		data : {
			member_no : member_no,
			page : page
		},
		success : function(res){
			$("#hi").html(res);
		}
	})
}

// 북마크 목록 불러오기
function getBookList(page, member_no){
	$.ajax({
		url : "booklist.do",
		data : {
			member_no : member_no,
			page : page
		},
		success : function(res){
			$("#hi").html(res);
		}
	})
}

// isdel 하기
function isdel(select_no,table_name,rere){
	$.ajax({
		url: "actisdel.do",
		type: 'get',
		data: {
			select_no : select_no,
			table_name : table_name
		},
		success : function(res){
			alert('isdel 성공');
			if (table_name == 'message') {
				if (rere == 1){
    				getMessReadList(1, mymember_no);
				} else {
    				getMessSendList(1, mymember_no);
				}
			} else {
				getActList(1, mymember_no, table_name);
			}
		}
	});
}

// 단일 isdel
function isdelSingle(a, table_name){
	select_no = parseInt(a);
	isdel(select_no,table_name);
} 

// 다중 isdel
function isdelMulti(table_name,rere){
	$("input[name=select_no]:checked").each(function(){
		select_no = parseInt($(this).val());
		isdel(select_no,table_name,rere);
	})
}  

// 친구 수락하기
function accept(select_no){
	$.ajax({
		url : "friaccept.do",
		type : 'get',
		data : {
			select_no : select_no,
			table_name : 'friend'
		},
		success : function(res){
			alert("성공");
		    getFriReq(1, mymember_no);
		}
	}) 
}

// 단일 수락
function acceptSingle(a){
	select_no = parseInt(a);
	accept(select_no);
}

// 다중 수락
function acceptMulti(){
    $("input[name=select_no]:checked").each(function(){
    	select_no = parseInt($(this).val());
		accept(select_no);    	
    });
}

// 삭제
function del(select_no, table_name, rere){
	$.ajax({
		url : "fridel.do",
		type : 'get',
		data : {
			select_no : select_no,
			table_name : table_name
		},
		success : function(res){
			alert("성공");
			if (rere == 0){
	    		getFriReq(1, mymember_no);
			} else if (rere == 1){
				getFriList(1, mymember_no);
			}
		}
	})  
}

// 단일 삭제
function delSingle(a, table_name, rere){
	select_no = parseInt(a);
	del(select_no, table_name, rere);	
}

// 다중 삭제
function delMulti(table_name,rere){
    $("input[name=select_no]:checked").each(function(){
    	select_no = parseInt($(this).val());
    	del(select_no, table_name, rere);	
    });
}

// 쪽지보내기
function popmessage(){
    var url = "/pet/message/index.do"
  	var name = "popup message"; 
    var option = "width = 600, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);  
    connectWS();
} 
