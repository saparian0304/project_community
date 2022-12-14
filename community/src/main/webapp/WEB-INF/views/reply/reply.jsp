<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/alram.jsp" %> 
<script type="text/javascript" src="/pet/js/infomation.js"></script>
<script type="text/javascript" src="/pet/js/reply.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
<script>
var login_no = "";
<c:if test="${!empty loginInfo.member_no}">
	login_no = ${loginInfo.member_no};
</c:if>

</script>

<div style="width: 980px; margin: 0 auto;" class="replyshow" >	
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
                	<button id="relike${vo.reply_no }" onclick="javascript:recommendReply(${param.board_no}, ${vo.reply_no },'${loginInfo.member_no}');" style="width:35px; height:20px;border-radius: 5px; background: pink; color: #fff; line-height: 13px">
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
                </td>
                <td class="txt_l">
	                <c:if test="${vo.isdelete == 2 }">
	                       관리자에 의해 삭제된 댓글입니다.
	                </c:if>
	                <c:if test="${vo.isdelete == 1 }">
	                       삭제된 댓글입니다.
	                </c:if>
	                <c:if test="${vo.isdelete == 0}"> 
	                   ${vo.content}&nbsp;&nbsp;
	                   
	                <input type="hidden" value="${vo.member_no}" id="no${vo.reply_no }">
                	<input type="hidden" value="${vo.content}" id="content${vo.reply_no }">
	                   
	                   
	                   
	                   <c:choose>
                    		<c:when test="${loginInfo.member_no == vo.member_no }">
                    			<a href="javascript:commentDel('${vo.reply_no}');"> &nbsp;&nbsp;[삭제]</a>
	                   		 	<a href="javascript:replyEdit(${vo.reply_no}, '${vo.board_no}', '${vo.content}','${loginInfo.member_no}', '${param.member_no}')"> &nbsp;&nbsp;[수정]</a>
                    		</c:when>
	                  		<c:otherwise>
			                    <span style="border:1px; background-color: #d3d3d3; border-radius: 3px; text-align: center; line-height: center; color: white;">
		                        <a href="javascript:report(${vo.member_no}, ${param.board_no}, ${vo.reply_no });">&nbsp;[신고]&nbsp;&nbsp;</a>
		                        </span>  
                    		</c:otherwise>
                       </c:choose> 
	                </c:if>                                        
                </td>
		<c:choose>
			<c:when test="${loginInfo.member_no == vo.member_no }">       
             <c:if test="${param.member_no == vo.member_no}">                                            
                 <td class="writer${vo.gno}" style="color:blue; font-weight:bold;">
                	<a href="javascript:info2('${vo.ono}', '${loginInfo}')">[나]&nbsp;&nbsp;[글쓴이]</a>
                	<div class="activityForm2${vo.ono} activityForm2" style="display:none;">	                     
	                     <p><button onclick="location.href='/pet/mypage/index.do?member_no=${loginInfo.member_no}&add=getActList'";>나의 활동내역</button></p>	                     
                    </div>
                </td>
         	</c:if> 
            <c:if test="${param.member_no != vo.member_no}">                                                 
                <td class="writer${vo.gno}" style="cursor:pointer;">
                     <a href="javascript:info2('${vo.ono}', '${loginInfo}')" style="font-weight:bold;"> [나]&nbsp;&nbsp;${vo.member_nickname} </a>
                     <div class="activityForm2${vo.ono} activityForm2" style="display:none;">	                    
	                     <p><button onclick="location.href='/pet/mypage/index.do?member_no=${loginInfo.member_no}&add=getActList'";>나의 활동내역</button></p>
                     </div>
                </td>
            </c:if>
            </c:when> 
                
            <c:otherwise>                                                 
             <c:if test="${param.member_no == vo.member_no}">                                            
                 <td class="writer${vo.gno}" style="color:blue; font-weight:bold;">
                	<a href="javascript:info2('${vo.ono}', '${loginInfo}')">[글쓴이]&nbsp;&nbsp;${vo.member_nickname}</a>
                	<!-- 실시간 알람 -->
                	<input type="hidden" value="${vo.member_no}" id="no${vo.reply_no }">
                	<input type="hidden" value="${vo.content}" id="content${vo.reply_no }">
                	<!-- 실시간 알람 -->
                	<div class="activityForm2${vo.ono} activityForm2" style="display:none;">
	                     <p><button onclick="popmessage(${vo.member_no},'${vo.member_nickname}');">쪽지</button></p>
	                     <p><button>활동내역</button></p>
	                     <p><button>친구신청</button></p>
	                <c:if test="${empty vo.relation }">           	                   
	                     <p class="followGo${vo.member_no}"><button onclick="follow('${vo.member_no}', '${loginInfo.member_no}');">팔로우</button></p>
           			</c:if>        
           			<c:if test="${vo.relation == 0}">        
	                     <p class="followNo${vo.member_no}"><button onclick="unfollow('${vo.member_no}', '${loginInfo.member_no}');">팔로우해제</button></p>
           			</c:if>     
	                     <p><button onclick="block('${vo.member_no}', '${loginInfo.member_no}');">차단</button></p>
                    </div>
                </td>
         	</c:if> 
            <c:if test="${param.member_no != vo.member_no}">                                                 
                <td class="writer${vo.gno}" style="cursor:pointer;">
                    <a href="javascript:info2('${vo.ono}', '${loginInfo}')"> ${vo.member_nickname} </a>
                    <div class="activityForm2${vo.ono} activityForm2" style="display:none;">
	                     <p><button onclick="popmessage(${vo.member_no},'${vo.member_nickname}');">쪽지</button></p>
	                     <p><button>활동내역</button></p>
	                     <p><button>친구신청</button></p>
	                <c:if test="${empty vo.relation }">             
	                     <p class="followGo${vo.member_no}"><button onclick="follow('${vo.member_no}', '${loginInfo.member_no}');">팔로우</button></p>
	         		</c:if>             
	         		<c:if test="${vo.relation == 0}">            
	                     <p class="followNo${vo.member_no}"><button onclick="unfollow('${vo.member_no}', '${loginInfo.member_no}');">팔로우해제</button></p>
	         		</c:if>     
	                     <p><button onclick="block('${vo.member_no}', '${loginInfo.member_no}');">차단</button></p>
                     </div>
                </td>
            </c:if>
            </c:otherwise>
		</c:choose>             
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
	                    <a href="javascript:replySave('${param.gno}', '${param.board_no}','${loginInfo.member_no}', '${param.member_no}');"  style="  text-align: center;">저장</a>
	                </div>
	            </td>
	        </tr>
	        </tbody>
	    </table>
	</form>
</div>		
      
    
   
