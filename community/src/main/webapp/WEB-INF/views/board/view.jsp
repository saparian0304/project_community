<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ include file= "/WEB-INF/views/includes/header.jsp"%> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>박물관 미션 투어 당첨자 발표 | 공지사항 | 고객센터 | 투어리스트인투어</title>
    <link rel="stylesheet" href="/pet/css/common.css">
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
/* 삭제 할거임 */
function del(no) {
	if(confirm('삭제하시겠습니까?')){
		location.href='delete.do?board_no='+no;
	}
}

/* 댓글 스크립트  */
 

function getComment(page){
	$.ajax({    			
		url : "/pet/reply/list.do",
			data : {
				board_no : ${data.board_no},
				member_no : ${data.member_no},
				page: page				
			},			
			success : function(res) {
				$("#commentArea").html(res);				
			}
	});
}


 
$(function(){
	getComment(1);
});


function goSave(){
	<c:if test="${empty loginInfo}">
		 alert('로그인후 댓글작성해주세요');
	</c:if>
	<c:if test="${!empty loginInfo}"> 
	if (confirm('댓글을 저장하시겠습니까?')){
		$.ajax({			
			url : "/pet/reply/insert.do",
			data : {
				board_no : ${data.board_no},
				content : $("#content").val(),
				member_no : ${loginInfo.member_no}
			},
			success : function(res) {
				if (res.trim() == "1") {
					alert('정상적으로 댓글이 등록되었습니다.');
					$("#content").val('');
					getComment(1);
				}
			}
		});
	}
	</c:if>
}

// 댓글수정
function replyEdit(reply_no){
	$.ajax({    			
		url : "/pet/reply/list.do",
		data : {
			board_no : ${data.board_no},
			reply_no : reply_no				
		},			
		success : function() {
			$("#redit"+reply_no).html('<tr><td colspan="5"><textarea name="content" id="recon" style="width:800px; height:70px;" placeholder=""></textarea></td><td><div class="btnSet"><a href="javascript:replyEditgo(' + reply_no + ');"  style="  text-align: center;" >수정</a></div></td></tr>');				
		}
	});
	$("#redit"+reply_no).toggle();
}

function replyEditgo(reply_no){
<c:if test="${!empty loginInfo}">
	if (confirm('댓글을 수정하시겠습니까?')){
		$.ajax({			
			url : "/pet/reply/replyEdit.do",
			data : {
				board_no: ${data.board_no},
				reply_no : reply_no,
				content : $("#recon").val(),
				member_no : ${loginInfo.member_no}
			},
			success : function(res) {
				if (res.trim() == "1") {
					alert('정상적으로 댓글이 수정되었습니다.');
					$("#recon").val('');
					getComment(1);
				}
			}
		});
	}
</c:if>
}

// 대댓글작성
function replySave(gno){
	<c:if test="${empty loginInfo}">
		 alert('로그인후 댓글작성해주세요');
	</c:if>
	<c:if test="${!empty loginInfo}">
	if (confirm('댓글을 저장하시겠습니까?')){
		$.ajax({			
			url : "/pet/reply/reply.do",
			data : {
				board_no: ${data.board_no},
				gno : gno,				
				content : $("#contents").val(),
				member_no : ${loginInfo.member_no}
			},
			success : function(res) {
				if (res.trim() == "1") {
					alert('정상적으로 댓글이 등록되었습니다.');
					$("#contents").val('');
					getComment(1);
				}
			}
		});
	}
	</c:if>
} 

// 대댓글 리스트
function replyForm(gno){	
	$.ajax({    			
		url : "/pet/reply/replylist.do",
			data : {
				board_no : ${data.board_no},
				member_no : ${data.member_no},
				gno : gno,
				page: 1				
			},			
			success : function(res) {
				$("#rbox"+gno).html(res);
				
		}
	});
		$("#rbox"+gno).toggle();
	
}   

// 댓글삭제
function commentDel(reply_no) {
	
	if(confirm("댓글을 삭제하시겠습니까?")) {
		$.ajax({
			url : '/pet/reply/update.do?reply_no='+reply_no,
			success : function(res)	{
				if(res.trim() == '1') {
					alert('댓글이 정상적으로 삭제되었습니다.');
					getComment(1);		
				
				}
			}	
		})
	}
}

function report(member_no, board_no, reply_no) {
	<c:if test="${empty loginInfo}">
		alert('로그인후 댓글작성해주세요');
	 	return;
	</c:if>
	var isReply;
	if (reply_no == '' || reply_no == null) {
		isReply = 0;
	} else {
		isReply = 1
	}

	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', '/pet/report/write.do');
	document.charset = "uft-8";
	var list = { 
			'you_no' : member_no, 
			'board_no' : board_no, 
			'reply_no' : reply_no,
			'isReply' : isReply}
	for ( var key in list) {
		var field = document.createElement('input');
		field.setAttribute('type', 'hidden');
		field.setAttribute('name', key);
		field.setAttribute('value', list[key]);
		form.appendChild(field);
	}
	document.body.appendChild(form);
	form.submit();
}

//이미지 슬라이드
$(document).ready(function(){
  $('.slider').bxSlider({
	  slideWidth: 500,
	  slideheight: 500,
	  autoHover: true,
	  infiniteLoop: true,
	  auto: true,
	  responsive: true
  });
});






</script>


</head>
<body>
    <ul class="skipnavi">
        <li><a href="#container">본문내용</a></li>
    </ul>


    <div id="wrap">
        <!-- 컨텐츠 영역 -->
        <div id="container">
            <!-- 위치(페이지 제목)영역 -->
            <div class="location_area customer">
                <div class="box_inner">
                    <h2 class="tit_page">
                        <span>TOURIST</span>
                        <span class="in">in</span>
                        <!-- <span class="in">IN</span> -->
                        <span>TOUR</span>
                    </h2>
                    <p class="location">
                        고객센터
                        <span class="path">/</span> 
                        공지사항
                    </p>
                </div>
            </div> 
            <div class="sub">
	            <div class="size">
	                <h3 class="sub_title">게시판</h3>
	                <div class="bbs">
	                	<div style="text-align: right">
	                    	작성자 : ${data.member_no } <a href="javascript:report(${data.member_no}, ${data.board_no }, 0)">[게시글 신고버튼 예]</a><br>  
							<a href="javascript:report(${data.member_no}, ${data.board_no }, 1)">[댓글 신고버튼 예]</a>
	                	</div>
	                    <div class="view">
	                        <div class="title">
	                            <dl>
	                                <dt>${data.title } </dt>
	                                <dd class="date">작성일 : ${data.regdate } </dd>
	                            </dl>
	                        </div>
	                        <div class="leftArea">
								<!-- 카카오 api -->
		                        <div id="map" style="width:500px;height:400px;"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d27f0849a07d99e4a90f3bcd6edd63d&libraries=services"></script>
								<script>
									var container = document.getElementById('map');
									var options = {
										center: new kakao.maps.LatLng(33.450701, 126.570667),
										level: 3
									};
									var map = new kakao.maps.Map(container, options);
									
									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new kakao.maps.services.Geocoder();

									var addr = '${ldata.addr}';
									// 주소로 좌표를 검색합니다
									geocoder.addressSearch(addr, function(result, status) {

									    // 정상적으로 검색이 완료됐으면 
									     if (status === kakao.maps.services.Status.OK) {

									        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

									        // 결과값으로 받은 위치를 마커로 표시합니다
									        var marker = new kakao.maps.Marker({
									            map: map,
									            position: coords
									        });

									        // 인포윈도우로 장소에 대한 설명을 표시합니다
									        var infowindow = new kakao.maps.InfoWindow({
									            content: '<div style="width:150px;text-align:center;padding:6px 0;">${data.title}</div>'
									        });
									        infowindow.open(map, marker);

									        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									        map.setCenter(coords);
									    } 
									});    
								</script>
	                        </div>
	                        
	                        <div class="rightArea">
                       			<!--  스마트 에디터쓰면 p태그가 자동으로 들어감 수정해 주실 분 구함 -->
                       			
                       			<dl>
	                               	<dt>주소 : ${ldata.addr } </dt>
	                            </dl>
                       			<dl>
	                               	<dt>내용 : ${data.content } </dt>
	                            </dl>
                       			<dl>
	                               	<dt>전화번호 : ${data.tel } </dt>
	                            </dl>
                       			<dl>
	                               	<dt>홈페이지 : ${data.link } </dt>
	                            </dl>
	                        </div>
							<div class="slider">
							  <div style="width: 500"><img src="https://cdn.pixabay.com/photo/2017/09/25/13/12/cocker-spaniel-2785074__480.jpg" title="Funky roots"></div>
							  <div style="width: 500"><img src="https://image.news1.kr/system/photos/2018/8/3/3239143/article.jpg/dims/optimize" title="The long and winding road"></div>
							  <div style="width: 500"><img src="http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg" title="Happy trees"></div>
							</div>

							<%-- 첨부파일을 뷰에서 보일 필요가 없어서 주석처리해둠 - 박- 
	                        <dl class="file" style="clear:both">
	                            <dt>첨부파일 </dt>
	                            <dd>
	                            <a href="/pet/common/download.jsp?oName=${ URLEncoder.encode(fdata.filename_org,'UTF-8')}&sName=${fdata.filename_real}"  
	                            target="_blank">${fdata.filename_org}</a></dd>
	                        </dl> --%>
	                        
	                        <div class="btnSet clear" style="clear:both">
	                            <div class="fl_l">
		                            <a href="index.do" class="btn">목록으로</a>
		                            <a href="/pet/board/edit.do?board_no=${data.board_no }" class="btn">수정</a>
		                            <a href="javascript:del(${data.board_no})" class="btn">삭제</a>
		                            <a href="reply.do?board_no=${data.board_no }" class="btn">답변</a>
	                            </div>
	                        </div>
	                    </div><!-- view -->
	                </div><!-- bbs -->
	            </div><!-- size -->
	        </div><!-- sub -->
        </div>
        <!-- id contner -->
        
    </div> <!-- div id="wrap" -->

  
 <!-- 댓글 폼 -->   
    <div style="width: 980px; margin: 0 auto;">
	<form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
		<table class="board_write" style="width:100%;">
			<colgroup>
				<col width="*" />
				<col width="100px" />
			</colgroup>
			<tbody>
				<tr id="test">
					<td>
						<textarea name="content" id="content" style="width:900px;height: 70px;" placeholder="로그인 후 작성해주세요"></textarea>
					</td>
					<td>
						<div class="btnSet">
							<a href="javascript:goSave();"  style="  text-align: center;">저장</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
	<div id="commentArea"></div>
</div>
    

    <!-- 퀵메뉴 -->
    <h2 class="hdd">빠른 링크 : 전화문의, 카카오톡, 오시는 길, 꼭대기로 가기</h2>
    <div class="quick_area">
        <ul class="quick_list">
            <li>
                <a href="tel:010-1234-5678">
                    <h3>전화문의</h3>
                    <p>010-1234-5678</p>
                </a>
            </li>

            <li>
                <a href="#">
                    <h3>카카오톡<em>상담</em></h3>
                    <p>1대1상담</p>
                </a>
            </li>

            <li>
                <a href="#">
                    <h3 class="to_contact">오시는 길</h3>   
                </a>
            </li>
        </ul>
        <p class="to_top">
            <a href="#layout0" class="s_point">TOP</a>
        </p>
    </div>

</body>
</html>