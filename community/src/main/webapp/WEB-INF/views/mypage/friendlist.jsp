<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

                <h3 class="sub_title">친구목록</h3>
                    <table class="list">
                    <p><span><strong>총 ${data.totalCount }명</strong>  |  ${data.page}  / ${data.totalPage }페이지</span></p>
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="80px" />
                            <col width="*" />
                            <col width="100px" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>닉네임</th>
                                <th>수락 일자</th>
                            </tr>
                        </thead>
                        <tbody>
						<c:if test="${empty data.list }">
                    	<tr>
                    		<td class="first" colspan="3" style="text-align : center;">등록된 친구가 없습니다.</td>
                    	</tr>
                    	</c:if>
                    	<c:if test="${!empty data.list }">
                    		<c:forEach var="list" items="${data.list }">
	                    	<tr>
	                    		<td >1</td>
	                    		<td class="txt_l" style="text-align : center;">${list.nickname }</td>
	                    		<td class="date">
	                    			<fmt:formatDate pattern="yyyy-MM-dd" value="${list.res_date }"/>
	                    		</td>
	                    	</tr>
	                    	</c:forEach>                    
	                    </c:if>     
                            
                        </tbody>
                    </table>
                    
                    <div class="pagenate clear">
                        <ul class='paging'>
                        <c:if test="${data.prev == true }">
                        	<li><a href="friendlist.do?member_no=${mypageVO.member_no }&page=${data.startPage -1 }&stype=${param.stype}&sword=${param.sword}"><</a>
                        </c:if>
                        <c:forEach var="p" begin="${data.startPage }" end="${data.endPage }">
                        	<li><a href='friendlist.do?member_no=${mypageVO.member_no }&page=${p}&stype=${param.stype}&sword=${param.sword}' <c:if test="${mypageVO.page == p}"> class='current'</c:if>>${p }</a></li>
                        </c:forEach>
                        <c:if test="${data.next == true }">
                        	<li><a href="friendlist.do?member_no=${mypageVO.member_no }&page=${data.endPage +1 }&stype=${param.stype}&sword=${param.sword}">></a>
                        </c:if>
                        </ul> 
                    </div>
                
                    <!-- 페이지처리 -->
                    
