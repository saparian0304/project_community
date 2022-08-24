<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<link rel="stylesheet" href="/pet/css/tab.css"/>
<script type="text/javascript" src="/pet/js/util/board_an.js"></script>
<script>
var login_no = "";
<c:if test="${!empty loginInfo.member_no}">
	login_no = ${loginInfo.member_no};
</c:if>

/* 삭제 할거임 */
function del(no) {
	if(confirm('삭제하시겠습니까?')){
		location.href='delete.do?board_no='+no;
	}
}

/* 댓글 스크립트  */

 
var boardWriter = ${data.member_no};
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
				if(socket){
				 socket.send("reply,"+${loginInfo.member_no}+","+boardWriter+","+${data.board_no}+","+'${data.title}');
				}
			}
		});
	}
	</c:if>
}

// 댓글수정
function replyEdit(reply_no, content){
	$.ajax({    			
		url : "/pet/reply/list.do",
		data : {
			board_no : ${data.board_no},
			reply_no : reply_no,
			content : content
			
		},			
		success : function() {
			$("#redit"+reply_no).html('<tr><td colspan="5"><textarea name="content" id="recon" style="width:800px; height:70px;">'+content+'</textarea></td><td><div class="btnSet"><a href="javascript:replyEditgo(' + reply_no + ');"  style="  text-align: center;" >&nbsp;&nbsp;수정</a></div></td></tr>');				
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
				if(socket){
					socket.send("rereply,"+${loginInfo.member_no}+","+$("#no"+gno).val()+","+${data.board_no}+","+$("#content"+gno).val());
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
				$(".rbox"+gno).html(res);
				
		}
	});
	$(".replyshow").hide();
	$(".rbox"+gno).toggle();	
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



//탭
$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
	 
	})
</script>
    
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
                        <span>반려동물 커뮤니티</span>
                    </h2>
                </div>
            </div> 
            <div class="sub">
	            <div class="size">
	                <h3 class="sub_title">게시판</h3>
	                <div class="bbs">
	                	<div style="text-align: right">
	                    	<span style="border:1px; background-color: #d3d3d3; border-radius: 3px; text-align: center; line-height: center; color: white;">
			                    <a href="javascript:report(${data.member_no}, ${param.board_no}, 0, '${loginInfo.member_no }');">&nbsp;[게시글 신고]&nbsp;&nbsp;</a>
			                </span> 
	                	</div>
	                    <div class="view">
	                        <div class="title">
	                            <dl>
	                                <dt>${data.title } </dt>
	                                <dd class="date">작성일 : ${data.regdate } </dd>
	                            </dl>
	                        </div>
	                        <div class="leftArea">
	                        	<ul class="tabs">
	                        		<li class="tab-link current" data-tab="tab-1">지도</li>
    								<li class="tab-link" data-tab="tab-2">이미지</li>
	                        	</ul>
	                        	
	                        	<div id="tab-1" class="tab-content current">
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
								  
							      <div id="tab-2" class="tab-content">
							      	<div class="swiper mySwiper" style="width:500px;height:400px;">
								      <div class="swiper-wrapper" >
								        <c:if test="${!empty fdata }">
								        <c:forEach items="${fdata }" var="list">
								        <div class="swiper-slide">
								          <img style="width:500px;height:400px;" src="${list.filename_org }" onerror='this.src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"'/>
								        </div>
								        </c:forEach>
								        </c:if>
								        <c:if test="${empty fdata }">
								        <div class="swiper-slide">
								          <img src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"/>
								        </div>
								        </c:if>
								        
								      </div>
								      <div class="swiper-button-next"></div>
								      <div class="swiper-button-prev"></div>
								      <div class="swiper-pagination"></div>
								    </div>
								
								    <!-- Swiper JS -->
								    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
								
								    <!-- Initialize Swiper -->
								    <script>
								      var swiper = new Swiper(".mySwiper", {
								    	loop: true,
								    	spaceBetween: 30,
								        effect: "fade",
								        navigation: {
								          nextEl: ".swiper-button-next",
								          prevEl: ".swiper-button-prev",
								        },
								        pagination: {
								          loop: true,
								          el: ".swiper-pagination",
								          clickable: true,
								        }
								      });
								    </script>
								 </div>
	                        </div>
					        
					        <div class="sContainer">
					        
	                        <div>
			                    <div class="rightArea" >
			                        <ul class="wrap">
		                       			<div style="height:40px; margin : 10px 10px 0 0;">
			                            <span style="float: right; text-align: center;">
			                               		<a id="book" href="javascript:bookmark(${param.board_no }, '${loginInfo.member_no }');">
			                               		<c:choose>
			                               			<c:when test="${bookdata== true}">
			                               				<img alt="북마크" src="/pet/img/icon_bookmark_black.png" width="45px">
			                               			</c:when>
			                               			<c:otherwise>
			                               				<img alt="북마크" src="/pet/img/icon_bookmark_white.png" width="45px">
			                               			</c:otherwise>
			                               		</c:choose>
			                               		</a>
			                            </span>
	                       				<span style="float: right; text-align: center;">
		                               		<a id="like" href="javascript:recommend(${param.board_no },0,'${data.member_no }','${loginInfo.member_no }', '${data.title }');">
		                               		<c:choose>
		                               			<c:when test="${recdata.recommended == '1'}">
													<img alt="좋아요" src="/pet/img/icon_like_black.png" width="50px">
													<br>${recdata.recommendCnt}
		                               			</c:when>
		                               			<c:otherwise>
		                               				<img alt="좋아요" src="/pet/img/icon_like_white.png" width="50px">
		                               				<br>${recdata.recommendCnt}
		                               			</c:otherwise>
		                               		</c:choose>
		                               		</a>
                               			</span>
	                               		</div>
		                       			<li>
			                               		<span>주소 : ${ldata.addr }</span>
			                            </li>
		                       			<li>
			                               		<span>내용 : ${data.content }</span>
			                            </li>
		                       			<li>
			                               		<span>전화번호 : ${data.tel }</span>
			                            </li>
		                       			<li>
			                               		<span>홈페이지 : ${data.link }</span>
			                            </li>
	                            	</ul>
			                    </div>
			                </div>
	                        
	                        <div class="btnSet clear" style="clear:both">
	                            <div class="fl_l">
		                            <a href="liveindex.do" class="btn">목록으로</a>
		                            
		                            <c:if test="${data.member_no == loginInfo.member_no }">
			                            <a href="/pet/board/liveedit.do?board_no=${data.board_no }" class="btn">수정</a>
			                            <a href="javascript:del(${data.board_no})" class="btn">삭제</a>
		                            </c:if>
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
				<c:if test="${empty loginInfo}">
					<td>
						<textarea name="content" id="content" style="width:900px;height: 70px;" placeholder="로그인 후 작성해주세요"></textarea>
					</td>
				</c:if>
				<c:if test="${!empty loginInfo}">
					<td>
						<textarea name="content" id="content" style="width:900px;height: 70px;" placeholder="댓글을 작성해주세요"></textarea>
					</td>
				</c:if>		
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
    

    

</body>
</html>