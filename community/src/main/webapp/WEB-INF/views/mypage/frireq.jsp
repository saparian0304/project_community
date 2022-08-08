<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				<h3 class="sub_title">친구 요청 목록</h3>
				<table class="list">	
                    <p><span><strong>총 ${data.totalCount }명</strong>  |  ${data.page}  / ${data.totalPage }페이지</span></p>
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="80px" />
                            <col width="150px" />
                            <col width="*" />
                            <col width="100px" />
                            <col width="150px" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="allChk" onclick="selectAll(this)"></th>
                                <th style="text-align: left;">선택 <button class="reqbtn success" onclick="javascript: acceptMulti();">수락</button>&nbsp;
		                    			<button class="reqbtn danger" onclick="javascript: delMulti();">거절</button>
		                    	</th>
                                <th>요청자 닉네임</th>
                                <th>요청 일자</th>
                                <th>수락 / 거절</th>
                            </tr>
                        </thead>
                        <tbody>
	                    <!-- 리스트 호출 -->
	                    <c:if test="${empty data.list }">
	                    	<tr>
	                    		<td class="tit_notice" colspan="5" style="text-align : center;">친구 요청이 없습니다.</td>
	                    	</tr>
	                    </c:if>
	                    <c:if test="${!empty data.list }">
	                    	<c:forEach var="list" items="${data.list }">
	                    	<tr>
	                    		<td><input type="checkbox" name="select_no" value="${list.fri_no}"></td>
	                    		<td></td>
	                    		<td class="tit_notice" style="text-align : center;">${list.nickname }</td>
	                    		<td>
	                    			<fmt:formatDate pattern="yyyy-MM-dd" value="${list.req_date }"/>
	                    		</td>
	                    		<td>
		                    		<button class="reqbtn success" onclick="javascript: accept(${list.fri_no});">수락</button>&nbsp;
		                    		<button class="reqbtn danger" onclick="javascript: del(${list.fri_no});">거절</button>
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
