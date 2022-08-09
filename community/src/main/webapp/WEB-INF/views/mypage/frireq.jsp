<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                  <form action="#" method="post" class="minisrch_form">
                    <fieldset>
                        <legend>
                            검색
                        </legend>
                        <input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요." name="">
                        <a href="#" class="btn_srch">검색</a>
                    </fieldset>
                </form>
                
                  <table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
                  <h3 class="sub_title">친구 요청 목록</h3>
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
                                <th><label><input type="checkbox" name="allChk" onclick="selectAll(this)" ></label></th>
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
	                    		<td class="tit_notice" style="text-align: center;"><input type="checkbox" name="select_no" value="${list.fri_no}"></td>
	                    		<td></td>
	                    		<td class="tit_notice" style="text-align : center;">${list.nickname }</td>
	                    		<td>
	                    			<fmt:formatDate pattern="yyyy-MM-dd" value="${list.req_date }"/>
	                    		</td>
	                    		<td class="tit_notice" style="text-align : center;">
		                    		<button class="reqbtn success" onclick="javascript: accept(${list.fri_no});">수락</button>&nbsp;
		                    		<button class="reqbtn danger" onclick="javascript: del(${list.fri_no});">거절</button>
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
                	<a style="cursor: pointer" onclick='javascript: getFriReq(1, ${loginInfo.member_no});' class="firstpage pbtn">
                        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
                    </a>
                    
                	<c:if test="${data.prev == true }">
                        <a class="prevpage pbtn" style="cursor: pointer" onclick='javascript: getFriReq(${data.startPage -1 }, ${loginInfo.member_no});' >
                        	<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
                        </a>
					</c:if>
					
                    <c:forEach var="p" begin="${data.startPage }" end="${data.endPage }">
                       	<a style="cursor: pointer" class="pagenum <c:if test="${mypageVO.page == p}"> currentpage </c:if>" onclick='javascript: getFriReq(${p }, ${loginInfo.member_no});' >${p }</a>
					</c:forEach>
					<c:if test="${data.next == true }">
						<a class="nextpage pbtn" style="cursor: pointer" onclick='javascript: getFriReq(${data.endPage +1 }, ${loginInfo.member_no});'>
							<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
						</a>
					</c:if>
                    <a style="cursor: pointer" onclick='javascript: getFriReq(${data.totalPage }, ${loginInfo.member_no});' class="lastpage pbtn">
                        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
                    </a>
                </div>
