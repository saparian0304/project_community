<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<script>
  
</script>

<div style="width: 980px; margin: 0 auto;">    
	<p style="margin-top:5px;"><span><strong>총 ${reply.replyCount}개</strong> <%-- ${reply.page}/ ${reply.totalPage} 페이지 --%></span></p>
    <table class="list" style="width:920px;">
        <colgroup>
            <col width="80px" />
            <col width="*" />            
            <col width="150px" />
            <col width="200px" />
        </colgroup>
        <tbody >
		<c:if test="${empty reply.replyList}">
            <tr style="height:70px;">
                <td class="first" colspan="8" style="height:70px;">등록된 댓글이 없습니다.</td>                
            </tr>
		</c:if>
        <c:forEach var="vo" items="${reply.replyList}" varStatus="status">
        <c:if test="${vo.isdelete == false}">          	         
            <tr style="height:70px;">
                <td>${(status.index)+1}</td>
                <td class="txt_l">
                    ${vo.content}<c:if test="${loginInfo.member_no == vo.member_no}">
                    <a href="javascript:commentDel(${vo.reply_no});"> &nbsp;&nbsp;[삭제]</a>
                    <a href="javascript:replyEdit(${vo.reply_no})"> &nbsp;&nbsp;[수정]</a>
                    </c:if>
                </td>                                            
                <td class="writer">
                     ${vo.member_nickname}
                </td>
                <td class="date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.regdate}"/></td>
            </tr>                                                                        
         </c:if>                                    
        </c:forEach>
        </tbody>
    </table> 
    
    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
	    <table class="board_write" style="width:100%;">
	        <colgroup>
	            <col width="*" />
	            <col width="100px" />
	        </colgroup>
	        <tbody>
	        <tr>
	            <td>
	                <textarea name="content" id="contents" style="width:900px; height:70px;" placeholder="로그인 후 작성해주세요"></textarea>
	            </td>
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
      
    
   
