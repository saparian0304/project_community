<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<link rel="stylesheet" href="/pet/css/tab.css"/>
<script type="text/javascript" src="/pet/js/util/board_an.js"></script>
<script type="text/javascript" src="/pet/js/reply.js"></script>
<script>
var login_no = "";
<c:if test="${!empty loginInfo.member_no}">
	login_no = ${loginInfo.member_no};
</c:if>
/* 삭제 할거임 */
function del(no) {
	if(confirm('삭제하시겠습니까?')){
		location.href='freedelete.do?board_no='+no;
	}
}

/* 댓글 스크립트  */
var boardWriter = "${data.member_no}";
var board_no = "${data.board_no}";
var member_no = "${data.member_no}";
var data_tit = "${data.title}";

var loginCon = "${loginInfo}";
var loginMem = "${loginInfo.member_no}";

//댓글 출력
$(function(){
	getComment(1, '${data.board_no}', '${data.member_no}');
	
});





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
	                                <dd class="date">작성일 : ${data.regdate } </dd><br>
	                                <dd>작성자 : ${data.nickname }</dd><br>
	                                <dd class="viewcount">조회수 : ${data.viewcount }</dd>
	                            </dl>
	                        </div>
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
		                               		<a id="like" href="javascript:recommend(${param.board_no },0,'${data.member_no }','${loginInfo.member_no }','${data.title }');">
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
	                               		&emsp;
	                        <div class="content" style="text-align: center">
								<c:if test="!empty ${data.filename_real }">
								<img style="height: 250px; width: 250px;" src="/pet/upload/${data.filename_real }"
									onerror='this.onerror=null; this.src="http://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg"'>
								</c:if>
	                        </div>
	                        <div>
                        		<div style="text-align: center">
                        		&emsp;&emsp;${data.content }
                        		</div>
                        	</div>
	                        
	                        	<!-- 첨부파일 -->
                        	<%-- <dl class="file" style="clear:both">
	                           <dd>
	                           <c:forEach var="fo" items="${fdata }">
	                           <a href="/pet/common/download.jsp?oName=${URLEncoder.encode(fo.filename_org,'UTF-8')}&sName=${fo.filename_real}"  
	                           target="_blank">${fo.filename_org}</a>
	                           </c:forEach>
	                           </dd>
                        	</dl> --%>			
	                        &emsp;&emsp;&emsp;&emsp;
	                        <div class="btnSet clear" style="clear:both">
	                            <div class="fl_l">
	                            	
		                            <a href="freeindex.do" class="btn">목록으로</a>
		                            <c:if test="${data.member_no == loginInfo.member_no || loginInfo.member_no == 0}">
		                            <a href="/pet/freeedit.do?board_no=${data.board_no }" class="btn">수정</a>
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
							<a href="javascript:goSave('${loginInfo.member_no}', '${data.board_no}', '${data.title}', '${data.member_no}');"  style="  text-align: center;">저장</a>
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