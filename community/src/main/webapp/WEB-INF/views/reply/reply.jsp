<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 

<script>

// 닉네임 클릭시 정보 보임
function info2(ono){
	
	if($(".activityForm2"+ono).css("display")=="none"){
		$(".activityForm2").hide();
		$(".activityForm").hide();
		$(".activityForm2"+ono).toggle();
	} else{
		$(".activityForm2"+ono).hide();
	}	
}
</script>

<div style="width: 980px; margin: 0 auto;" class="replyshow" >    
	<%-- <p style="margin-top:5px;"><span><strong>총 ${reply.replyCount}개</strong> ${reply.page}/ ${reply.totalPage} 페이지</span></p> --%>
    <table class="list" style="width:920px;">
        <colgroup>
            <col width="150px" />
            <col width="*" />            
            <col width="150px" />
            <col width="200px" />
        </colgroup>
        <c:forEach var="vo" items="${reply.replyList}" varStatus="status">
        
                 	         
            <tr style=" height:70px;">
                <td>
                	<c:if test="${vo.ono > 0}">&emsp;&emsp;&emsp;&emsp;&emsp;<img src="/pet/img/reply-ico.png"  width="25px" height="25px"></c:if>
                </td>
                <td class="txt_l">
	                <c:if test="${vo.isdelete == true }">
	                       삭제된 댓글입니다.
	                </c:if>
	                <c:if test="${vo.isdelete == false}"> 
	                   ${vo.content}<c:if test="${loginInfo.member_no == vo.member_no}">
	                    <a href="javascript:commentDel(${vo.reply_no});"> &nbsp;&nbsp;[삭제]</a>
	                    <a href="javascript:replyEdit(${vo.reply_no}, '${vo.content}')"> &nbsp;&nbsp;[수정]</a>	              
	                    </c:if>
	                </c:if>                                        
                </td>                                            
             <c:if test="${param.member_no == vo.member_no}">                                            
                 <td class="writer${vo.gno}" style="color:blue; font-weight:bold;">
                	<a href="javascript:info2(${vo.ono})">${vo.member_nickname}</a>
                	<div class="activityForm2${vo.ono} activityForm2" style="display:none;">
	                     <p><button onclick="popmessage(${vo.member_no},'${vo.member_nickname}');">쪽지</button></p>
	                     <p><button>활동내역</button></p>
	                     <p><button>친구신청</button></p>
	                     <p><button>차단</button></p>
                    </div>
                </td>
         	</c:if> 
            <c:if test="${param.member_no != vo.member_no}">                                                 
                <td class="writer${vo.gno}" style="cursor:pointer;">
                     <a href="javascript:info2(${vo.ono})"> ${vo.member_nickname} </a>
                     <div class="activityForm2${vo.ono} activityForm2" style="display:none;">
	                     <p><button onclick="popmessage(${vo.member_no},'${vo.member_nickname}');">쪽지</button></p>
	                     <p><button>활동내역</button></p>
	                     <p><button>친구신청</button></p>
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
         
        </c:forEach>
       
    </table> 
    
    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
	    <table class="board_write" style="width:100%;">
	        <colgroup>
	            <col width="*" />
	            <col width="100px" />
	        </colgroup>
	        <tbody>
	        <tr>
	        <c:if test="${empty loginInfo}">
	            <td>
	                <textarea name="content" id="contents" style="width:900px; height:70px;" placeholder="로그인 후 작성해주세요"></textarea>
	            </td>
	        </c:if>
	        <c:if test="${!empty loginInfo}">
	            <td>
	                <textarea name="content" id="contents" style="width:900px; height:70px;" placeholder="댓글을 작성해주세요"></textarea>
	            </td>
	        </c:if>     
	            <td>
	                <div class="btnSet">
	                    <a href="javascript:replySave(${param.gno});"  style="  text-align: center;">저장</a>
	                </div>
	            </td>
	        </tr>
	        </tbody>
	    </table>
	</form>
</div>		
      
    
   
