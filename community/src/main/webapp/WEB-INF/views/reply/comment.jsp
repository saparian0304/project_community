<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/includes/alram.jsp" %>    
<script>

// 닉네임 눌렀을때 정보 열림
function info(gno){	
	if($(".activityForm"+gno).css("display")=="none"){
		$(".activityForm").hide();
		$(".activityForm2").hide();
		$(".activityForm"+gno).toggle();
	} else{
		$(".activityForm"+gno).hide();
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
	var close1 = "${off}";
	
	function winclose(){	
		  window.open('','_self').close();
		  alert("발송 완료 되었습니다.");
		  
	}
	
	$(function(){
		if (close1 == "yes"){
			winclose();
		}
	});
	
	// 좋아요
	function recommendReply(board_no, reply_no) {
		<c:if test="${empty loginInfo}">
		 alert('로그인 상태에서 이용할 수 있습니다.');
		console.log(reply_no);
		 return;
		</c:if>
		$.ajax({
			url : "/pet/recommend/recommend.do",
			data : {
				board_no : board_no,
				reply_no : reply_no,
			},			
			type : 'post',
			dataType : "JSON",
			success : function(res) {
				console.log(res)
				console.log(res.recommendCount);
				console.log(res.recommended);
				if (res.recommended) {
					var icon_img = '<img alt="좋아요" src="/pet/img/icon_like_black_2.png" width="13px"> '+res.recommendCount;
					$('#relike'+res.reply_no).html(icon_img);
					if(socket){
						var bno = window.location.href.split("=");
						socket.send("recommend,"+${loginInfo.member_no}+","+$("#no"+reply_no).val()+","+board_no+",[댓글]"+$("#content"+reply_no).val());
					}
				} else {
					var icon_img = '<img alt="좋아요" src="/pet/img/icon_like_white_2.png" width="13px"> '+res.recommendCount;
					$('#relike'+res.reply_no).html(icon_img);
				}
			}	
		})
	}
	
	// 팔로우	

function follow(member_no){
	<c:if test="${empty loginInfo}">
	 alert('로그인 후 사용해 주세요');
	</c:if>
	var i_no='${loginInfo.member_no}';
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
 
 function unfollow(member_no){
	<c:if test="${empty loginInfo}">
	 alert('로그인 후 사용해 주세요');
	</c:if>
	var i_no='${loginInfo.member_no}';
	
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


</script>

<p style="margin-top:5px;"><span><strong>총 ${pageMaker.totalCount}개</strong> ${replyVO.page}/ ${pageMaker.totalPage} 페이지</span></p>
    <table class="list" style="width:920px;">
        <colgroup>
            <col width="80px" />
            <col width="*" />            
            <col width="150px" />
            <col width="200px" />
        </colgroup>
        <tbody>
		<c:if test="${empty comment.list}">
            <tr style="height:70px;">
                <td class="first" colspan="8" style="height:70px;">등록된 댓글이 없습니다.</td>                
            </tr>
		</c:if>
        <c:forEach var="vo" items="${comment.list}" varStatus="status">                                	         
            <tr style="height:70px;"  class="rbox">
                <td>${(status.index)+1}</td>
                <td class="txt_l">               
                   <button onclick="javascript:replyForm(${vo.gno});" id="recount" style="width:80px; height:20px;border-radius: 5px; background: #b0d0df; color: #fff;">[댓글수:  ${vo.reply_count} ] </button>
                   <!-- 실시간 알람용 -->
                   <input type="hidden" value="${vo.member_no}" id="no${vo.gno }">
                   <input type="hidden" value="${vo.content}" id="content${vo.gno }">
                   <button id="relike${vo.reply_no }" onclick="javascript:recommendReply(${param.board_no}, ${vo.reply_no });" style="width:35px; height:20px;border-radius: 5px; background: pink; color: #fff; line-height: 13px">
					<c:choose>
						<c:when test="${vo.recommended == '1'}">
							<img alt="좋아요" src="/pet/img/icon_like_black_2.png" width="13px"> 
							${ vo.recommendCount}
						</c:when>
						<c:otherwise>
							<img alt="좋아요" src="/pet/img/icon_like_white_2.png" width="13px"> 
							${vo.recommendCount}
						</c:otherwise>
					</c:choose>
                   </button>
                   
                   <c:if test="${vo.isdelete == true }">
                       &emsp;&emsp; 삭제된 댓글입니다.
                   </c:if>
                   <c:if test="${vo.isdelete == false }">
                    &emsp;&emsp; ${vo.content} &nbsp;&nbsp;
                    	<c:choose>
                    		<c:when test="${loginInfo.member_no == vo.member_no }">
		                    	<a href="javascript:commentDel(${vo.reply_no});"> &nbsp;&nbsp;[삭제]</a>
		                    	<a href="javascript:replyEdit(${vo.reply_no}, '${vo.content}' );"> &nbsp;&nbsp;[수정]</a>
                    		</c:when>
                    		<c:otherwise>
	                    		<span style="border:1px; background-color: #d3d3d3; border-radius: 3px; text-align: center; line-height: center; color: white;">
			                    	<a href="javascript:report(${vo.member_no}, ${param.board_no}, ${vo.reply_no });">&nbsp;[신고]&nbsp;&nbsp;</a>
			                    </span> 
                    		</c:otherwise>
                    	</c:choose>        
                    </c:if>                	
                </td>
    		<c:if test="${param.member_no == vo.member_no}">                                            
                <td class="writer${vo.gno}" style="color:blue; font-weight:bold;">
                	<a href="javascript:info(${vo.gno})"> ${vo.member_nickname}</a>
                	<a class="ficon"></a>
                	<div class="activityForm${vo.gno} activityForm" style="display:none;">
	                     <p><button onclick="popmessage(${vo.member_no},'${vo.member_nickname}');">쪽지</button></p>
	                     <p><button>활동내역</button></p>
	                     <p><button>친구신청</button></p>	                      
            <c:if test="${empty vo.relation }">           	                   
	                     <p class="followGo${vo.member_no}"><button onclick="follow(${vo.member_no});">팔로우</button></p>
            </c:if>        
            <c:if test="${vo.relation == 0}">        
	                     <p class="followNo${vo.member_no}"><button onclick="follow(${vo.member_no});">팔로우해제</button></p>
            </c:if>         
	                     <p><button>차단 </button></p>
                    </div>
                </td>
         	</c:if> 
            <c:if test="${param.member_no != vo.member_no}">                                                
                <td class="writer${vo.gno}" style="cursor:pointer;">
                     <a href="javascript:info(${vo.gno})"> ${vo.member_nickname} </a>
                     <div class="activityForm${vo.gno} activityForm" style="display:none;">
	                     <p><button onclick="popmessage(${vo.member_no},'${vo.member_nickname}');">쪽지</button></p>
	                     <p><button>활동내역</button></p>
	                     <p><button>친구신청</button></p>
	         <c:if test="${empty vo.relation }">             
	                     <p class="followGo${vo.member_no}"><button onclick="follow(${vo.member_no});">팔로우</button></p>
	         </c:if>             
	         <c:if test="${vo.relation == 0}">            
	                     <p class="followNo${vo.member_no}"><button onclick="unfollow(${vo.member_no});">팔로우해제</button></p>
	         </c:if> 
	                     <p><button>차단</button></p>
                     </div>
                </td>
            </c:if>                       
                <td class="date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.regdate}"/></td>
            </tr>           
           	<tr>
            	<td colspan="5">
            		<div id="redit${vo.reply_no}"></div>
            	</td>
            </tr>
            <tr>
            	<td colspan="5">
           			<div class="rbox${vo.gno} rbox"></div>
           		</td>
           	</tr>                                                                                       
        </c:forEach>
        </tbody>      
    </table>   
    
    
    
    
    <div class="pagenation">
    	<a style="cursor:pointer" class="firstpage pbth" href="javascript:getComment(${pageMaker.startPage});">
    		<img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
    	</a>
	    <c:if test="${pageMaker.prev == true}">
	        <a href="javascript:getComment(${pageMaker.startPage-1});" class="firstpage pbtn">
	            <img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
	        </a>
	    </c:if>
	     <c:forEach var="p" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">    
	        <a href="javascript:getComment(${p});"<c:if test="${replyVO.page == p}"/>>
	            <span class="pagenum currentpage">${p}</span>
	        </a>
	     </c:forEach>  
	     <c:if test="${data.next == true}">   
	        <a href="ijavascript:getComment(${pageMaker.endPage+1});" class="lastpage pbtn">
	            <img src="/pet/img/btn_nextpage.png" alt="다음 페이지 이동">
	        </a>
	     </c:if>
	     <a style="cursor:poiner"  href="javascript:getComment(${pageMaker.totalPage});" class="lastpage pbtn">
	     		<img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
	     </a>
    </div>

                