<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script>


function message(gno){
	
	if($(".activityForm"+gno).css("display")=="none"){
		$(".activityForm").hide();
		$(".activityForm"+gno).toggle();
	} else{
		$(".activityForm"+gno).hide();
	}
	
	
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
                   <c:if test="${vo.isdelete == true }">
                       &emsp;&emsp; 삭제된 댓글입니다.
                   </c:if>
                   <c:if test="${vo.isdelete == false }">
                    &emsp;&emsp; ${vo.content}                  
	                   <c:if test="${loginInfo.member_no == vo.member_no }">
	                    	<a href="javascript:commentDel(${vo.reply_no});"> &nbsp;&nbsp;[삭제]</a>
	                    	<a href="javascript:replyEdit(${vo.reply_no})"> &nbsp;&nbsp;[수정]</a>
	                    </c:if>	
                    </c:if>                	
                </td>
    		<c:if test="${param.member_no == vo.member_no}">                                            
                <td class="writer${vo.gno}" style="color:blue; font-weight:bold;">
                	<a href="javascript:message(${vo.gno})">${vo.member_nickname}</a>
                	<div class="activityForm${vo.gno} activityForm" style="display:none;">
	                     <p><button onclick="window.open('/pet/message/send.do?member_no=${vo.member_no}&nickname=${vo.member_nickname}&board_no=${board_no}');">쪽지</button></p>
	                     <p><button>활동내역</button></p>
	                     <p><button>친구신청</button></p>
	                     <p><button>차단</button></p>
                    </div>
                </td>
         	</c:if> 
            <c:if test="${param.member_no != vo.member_no}">                                                 
                <td class="writer${vo.gno}" style="cursor:pointer;">
                     <a href="javascript:message(${vo.gno})"> ${vo.member_nickname} </a>
                     <div class="activityForm${vo.gno} activityForm" style="display:none;">
	                     <p><button onclick="window.open('/pet/message/send.do?member_no=${vo.member_no}&nickname=${vo.member_nickname}&board_no=${vo.board_no}');">쪽지</button></p>
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

                