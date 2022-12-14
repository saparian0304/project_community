<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
//보낸쪽지 리스트 글 클릭
function listSend(read_member,read_nick, content){
    var url = "/pet/message/listsend.do?member_no="+read_member+"&nickname="+read_nick+"&content="+content;
  	var name = "popup message"; 
    var option = "width = 600, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);   
}
</script>
                <button style="width : 100px; height : 30px;" class="reqbtn mymess" onclick="javascript:getMessReadList(1, ${loginInfo.member_no});">내가 받은 쪽지</button>
                <button style="width : 100px; height : 30px;" class="reqbtn mymess" onclick="javascript: getMessSendList(1, ${loginInfo.member_no});">내가 보낸 쪽지</button>
                <button style="width : 100px; height : 30px;" class="reqbtn mymess" onclick="popmessage();">쪽지 보내기</button>
                
                  <table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
                  <h3 class="sub_title">내가 보낸 쪽지</h3>
                    <p><span><strong>총 ${data.totalCount }개</strong>  |  ${data.page}  / ${pageMaker.totalPage }페이지</span></p>
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="80px" />
                            <col width="100px" />
                            <col width="100px" />
                            <col width="*" />
                            <col width="100px" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th><label><input type="checkbox" name="allChk" onclick="selectAll(this)" ></label></th>
                                <th style="text-align: left;">선택 <button class="reqbtn danger" onclick="javascript:isdelMulti('message', '2');">삭제</button>
		                    	</th>
                                <th>받는사람</th>
                                <th>내용</th>
                                <th>작성 일자</th>
                            </tr>
                        </thead>
                        <tbody>
	                    <!-- 리스트 호출 -->
	                    <c:if test="${empty data.list }">
	                    	<tr>
	                    		<td class="tit_notice" colspan="100%" style="text-align : center;">받은 쪽지가 없습니다.</td>
	                    	</tr>
	                    </c:if>
	                    <c:if test="${!empty data.list }">
	                    	<c:forEach var="list" items="${data.list }">
	                    	<tr>
	                    		<td class="tit_notice" style="text-align: center;">
	                    			<input type="checkbox" name="select_no" value="${list.mess_no }" >
	                    		</td>
	                    		<td></td>
	                    		<td class="tit_notice" style="text-align : center;">
	                    			${list.read_nick}
	                    		</td>
	                    		<td class="tit_notice" style="text-align : center;">
	                    			<a href="javascript:listSend(${list.read_member},'${list.read_nick }', '${list.content}')">
	                    			${list.content }
	                    			</a>
	                    		</td>
	                    		<td>
	                    			<fmt:formatDate pattern="yyyy-MM-dd" value="${list.senddate }"/>
	                    		</td>
	                    	</tr>
	                    	</c:forEach>                    
	                    </c:if>
	                    </tbody>
                  </table>
                    
                    <%-- <div class="pagenation">
                        <ul class='paging'>
                        <c:if test="${data.prev == true }">
                        	<li><a href="friendreq.do?member_no=${mypageVO.member_no }&page=${data.startPage -1 }&stype=${param.stype}&sword=${param.sword}"><</a>
                        </c:if>
                        <c:forEach var="p" begin="${data.startPage }" end="${data.endPage }">
                        	<li><a href='friendlist.do?member_no=${mypageVO.member_no }&page=${p}&stype=${param.stype}&sword=${param.sword}' <c:if test="${mypageVO.page == p}"> class='current'</c:if>>${p }</a></li>
                        </c:forEach>
                        <c:if test="${data.next == true }">
                        	<li><a href="friendlist.do?member_no=${mypageVO.member_no }&page=${data.endPage +1 }&stype=${param.stype}&sword=${param.sword}">></a>
                        </c:if>
                        </ul> 
                    </div> --%>
				<div class="pagenation">
				<c:if test="${!empty data.list }">
                	<a style="cursor: pointer" onclick='javascript: getMessSendList(1, ${loginInfo.member_no});' class="firstpage pbtn">
                        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
                    </a>
                    
                	<c:if test="${pageMaker.prev }">
                        <a class="prevpage pbtn" style="cursor: pointer" 
                        	onclick='javascript: getMessSendList(${pageMaker.startPage -1 }, ${loginInfo.member_no});' >
                        	<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
                        </a>
					</c:if>
					
                    <c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                       	<a style="cursor: pointer" class="pagenum<c:if test="${mypageVO.page == p}"> currentpage </c:if>" 
                       		onclick='javascript:getMessSendList(${p }, ${loginInfo.member_no});' >${p }</a>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<a class="nextpage pbtn" style="cursor: pointer" 
							onclick='javascript: getMessSendList(${pageMaker.endPage +1 }, ${loginInfo.member_no});'>
							<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
						</a>
					</c:if>
                    <a style="cursor: pointer" onclick='javascript: getMessSendList(${pageMaker.totalPage }, ${loginInfo.member_no});' 
                    	class="lastpage pbtn">
                        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
                    </a>
                </c:if>
                </div>
