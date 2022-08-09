<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script>
 

</script>

<p style="margin-top:5px;"><span><strong>총 ${comment.totalCount}개</strong> ${commentVO.page}/ ${comment.totalPage} 페이지</span></p>
    <table class="list" style="width:920px;">
        <colgroup>
            <col width="80px" />
            <col width="*" />            
            <col width="150px" />
            <col width="200px" />
        </colgroup>
        <tbody >
		<c:if test="${empty comment.list}">
            <tr style="height:70px;">
                <td class="first" colspan="8" style="height:70px;">등록된 댓글이 없습니다.</td>                
            </tr>
		</c:if>
		
        <c:forEach var="vo" items="${comment.list}" varStatus="status">
            <div id="redit"></div>                    	         
            <tr style="height:70px;"  class="rbox">
                <td>${(status.index)+1}</td>
                <td class="txt_l">               
                   <a href="javascript:replyForm(${vo.gno});">
                   <c:if test="${vo.isdelete == true }">
                       삭제된 댓글입니다.
                   </c:if>
                   <c:if test="${vo.isdelete == false }">
                    ${vo.content}</a>                   
                   <c:if test="${loginInfo.member_no == vo.member_no }">
                    	<a href="javascript:commentDel(${vo.reply_no});"> &nbsp;&nbsp;[삭제]</a>
                    	<a href="javascript:replyEdit(${vo.reply_no})"> &nbsp;&nbsp;[수정]</a>
                    </c:if>	
                    </c:if>                   
                	<!-- &nbsp;&nbsp;[답글작성] -->
                	
                </td>                                            
                <td class="writer">
                     ${vo.member_nickname}
                </td>
                <td class="date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.regdate}"/></td>
            </tr>
           <div id="rbox"></div>                                                                    
                                             
        </c:forEach>
        </tbody>
    </table>   
    
    <div class="pagenation">
	    <c:if test="${comment.prev == true}">
	        <a href="javascript:getComment(${comment.startPage});" class="firstpage pbtn">
	            <img src="/project/img/btn_firstpage.png" alt="첫 페이지로 이동">
	        </a>
	    </c:if>
	     <c:forEach var="p" begin="${comment.startPage}" end="${comment.endPage}">    
	        <a href="javascript:getComment(${p});"<c:if test="${commentVO.page == p}"/>>
	            <span class="pagenum currentpage">${p}</span>
	        </a>
	     </c:forEach>  
	     <c:if test="${data.next == true}">   
	        <a href="ijavascript:getComment(${comment.endPage+1});" class="lastpage pbtn">
	            <img src="/project/img/btn_lastpage.png" alt="마지막 페이지 이동">
	        </a>
	     </c:if>
    </div>

                