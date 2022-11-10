<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script type="text/javascript" src="/pet/js/infomation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/includes/alram.jsp" %> 
<script>
var login_no = "";
<c:if test="${!empty loginInfo.member_no}">
	login_no = ${loginInfo.member_no};
</c:if>


//쪽지보내고 나면 닫힘
var close1 = "${off}";
	
$(function(){
	if (close1 == "yes"){
		winclose();
	}
});


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
                   <button onclick="javascript:replyForm('${vo.gno}', '${vo.board_no}', '${param.member_no}');" id="recount" style="width:80px; height:20px;border-radius: 5px; background: #b0d0df; color: #fff;">[댓글수:  ${vo.reply_count}] </button>
                   <!-- 실시간 알람용 -->
                   <input type="hidden" value="${vo.member_no}" id="no${vo.gno }">
                   <input type="hidden" value="${vo.content}" id="content${vo.gno }">
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
                   
                   <c:if test="${vo.isdelete == 2 }">
                       &emsp;&emsp; 관리자에 의해 삭제된 댓글입니다.
                   </c:if>
                   <c:if test="${vo.isdelete == 1 }">
                       &emsp;&emsp; 삭제된 댓글입니다.
                   </c:if>
                   <c:if test="${vo.isdelete == 0 }">
                    &emsp;&emsp; ${vo.content} &nbsp;&nbsp;
                    	<c:choose>
                    		<c:when test="${loginInfo.member_no == vo.member_no }">
		                    	<a href="javascript:commentDel('${vo.reply_no}', '${vo.board_no}', '${param.member_no}');"> &nbsp;&nbsp;[삭제]</a>
		                    	<a href="javascript:replyEdit('${vo.reply_no}','${vo.board_no}', '${vo.content}','${loginInfo.member_no}', '${param.member_no}' );"> &nbsp;&nbsp;[수정]</a>
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
                	<a href="javascript:info('${vo.gno}', '${loginInfo}')">[나]&nbsp;&nbsp;[글쓴이]</a>
                	<div class="activityForm${vo.gno} activityForm" style="display:none;">                		                     
	                     <p><button onclick="location.href='/pet/mypage/index.do?member_no=${loginInfo.member_no}&add=getActList';">나의 활동내역</button></p>
                    </div>
                </td>
         	</c:if> 
            <c:if test="${param.member_no != vo.member_no}">                                                
                <td class="writer${vo.gno}" style="cursor:pointer;">
                     <a href="javascript:info('${vo.gno}', '${loginInfo}')" style="font-weight:bold;"> [나]&nbsp;&nbsp;${vo.member_nickname} </a>
                     <div class="activityForm${vo.gno} activityForm" style="display:none;">                                         
	                     <p><button onclick="location.href='/pet/mypage/index.do?member_no=${loginInfo.member_no}&add=getActList';">나의 활동내역</button></p>           
                     </div>
                </td>
            </c:if>
			</c:when>
			<c:otherwise> 
    		<c:if test="${param.member_no == vo.member_no}">                                            
                <td class="writer${vo.gno}" style="color:blue; font-weight:bold;">
                	<a href="javascript:info('${vo.gno}', '${loginInfo}')"> [글쓴이]&nbsp;&nbsp;${vo.member_nickname}</a>
                	<div class="activityForm${vo.gno} activityForm" style="display:none;">
	                     <p><button onclick="popmessage(${vo.member_no},'${vo.member_nickname}');">쪽지</button></p>	                      
	                     <p><button onclick="friinsert('${vo.member_no}', '${loginInfo.member_no}');">친구신청</button></p>	                      
            		<c:if test="${empty vo.relation}">           	                   
	                     <p class="followGo${vo.member_no}"><button onclick="follow('${vo.member_no}', '${loginInfo.member_no}');">팔로우</button></p>
           			</c:if>        
           			<c:if test="${vo.relation == 0}">        
	                     <p class="followNo${vo.member_no}"><button onclick="unfollow('${vo.member_no}', '${loginInfo.member_no}');">팔로우해제</button></p>
           			</c:if>         
	                     <p><button onclick="block('${vo.member_no}', '${loginInfo.member_no}');">차단 </button></p>
                    </div>
                </td>
         	</c:if> 
            <c:if test="${param.member_no != vo.member_no}">                                                
                <td class="writer${vo.gno}" style="cursor:pointer;">
                     <a href="javascript:info('${vo.gno}', '${loginInfo}')"> ${vo.member_nickname} </a>
                     <div class="activityForm${vo.gno} activityForm" style="display:none;">
	                     <p><button onclick="popmessage(${vo.member_no},'${vo.member_nickname}');">쪽지</button></p>
	                     <p><button onclick="friinsert('${vo.member_no}', '${loginInfo.member_no}');">친구신청</button></p>
	         		<c:if test="${empty vo.relation}">             
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
            <tr>
            	<td colspan="5">
           			<div class="rbox${vo.gno} rbox"></div>
           		</td>
           	</tr>                                                                                       
        </c:forEach>
        </tbody>      
    </table>   
    
    
    
    
    <div class="pagenation">
    	<a style="cursor:pointer;" class="firstpage pbtn" href="javascript:getComment(${pageMaker.startPage},${replyVO.board_no},${param.member_no});">
    		<img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
    	</a>
	    <%-- <c:if test="${pageMaker.prev == true}"> --%>
	    <c:if test="${pageMaker.prev}">
	        <a href="javascript:getComment(${pageMaker.startPage-1},${replyVO.board_no},${param.member_no});" class="prevpage pbtn" style="cursor:pointer;">
	            <img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
	        </a>
	    </c:if>
	     <c:forEach var="p" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">    
	        <a style="cursor:pointer;" class="pagenum<c:if test="${replyVO.page == p}"> currentpage</c:if>"
	        href="javascript:getComment(${p},${replyVO.board_no},${param.member_no});">${p}</a>
	     </c:forEach>  
	     <c:if test="${pageMaker.next && pageMaker.endPage > 0}">   
	        <a href="ijavascript:getComment(${pageMaker.endPage+1},${replyVO.board_no},${param.member_no});" class="nextpage pbtn" style="cursor:pointer;">
	            <img src="/pet/img/btn_nextpage.png" alt="다음 페이지 이동">
	        </a>
	     </c:if>
	     <a style="cursor:poiner;"  href="javascript:getComment(${pageMaker.totalPage},${replyVO.board_no},${param.member_no});" class="lastpage pbtn">
	     		<img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
	     </a>
    </div>

                