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
                  <h3 class="sub_title">북마크 목록</h3>
                    <p><span><strong>총 ${data.totalCount }개</strong>  |  ${data.page}  / ${pageMaker.totalPage }페이지</span></p>
                        <caption>북마크 목록</caption>
                        <colgroup>
                            <col width="80px" />
                            <col width="150px" />
                            <col width="90px" />
                            <col width="*" />
                            <col width="100px" />
                            <col width="150px" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th><label><input type="checkbox" name="allChk" onclick="selectAll(this)" ></label></th>
                                <th style="text-align: left;">선택 <button class="reqbtn danger" onclick="javascript:delMulti('${mypageVO.table_name }');">삭제</button>
		                    	</th>
                                <th>카테고리</th>
                                <th>제목</th>
                                <th>작성 일자</th>
                                <th>삭제</th>
                            </tr>
                        </thead>
                        <tbody>
	                    <!-- 리스트 호출 -->
	                    <c:if test="${empty data.list }">
	                    	<tr>
	                    		<td class="tit_notice" colspan="100%" style="text-align : center;">내역이 없습니다.</td>
	                    	</tr>
	                    </c:if>
	                    <c:if test="${!empty data.list }">
	                    	<c:forEach var="list" items="${data.list }">
	                    	<tr>
	                    		<td class="tit_notice" style="text-align: center;">
	                    			<input type="checkbox" name="select_no" value="${list.book_no }">
	                    		</td>
	                    		<td></td>
	                    		<td class="tit_notice" style="text-align : center;">${list.horse_hair }</td>
	                    		<td class="tit_notice" style="text-align : center;">
	                    		<c:if test="${list.board_name == 'free' }">
	                    			<a href="/pet/freeview.do?board_no=${list.board_no }">
	                    				${list.title }
	                    			</a>
	                    		</c:if>	
	                    		<c:if test="${list.board_name == 'live' }">
	                    			<a href="/pet/liveview.do?board_no=${list.board_no }">
	                    				${list.title }
	                    			</a>
	                    		</c:if>	
	                    		<c:if test="${list.board_name == 'center' }">
	                    			<a href="/pet/centerview.do?board_no=${list.board_no }">
	                    				${list.title }
	                    			</a>
	                    		</c:if>	
	                    		</td>
	                    		<td>
	                    			<fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate }"/>
	                    		</td>
	                    		<td class="tit_notice" style="text-align : center;">
			                    		<button class="reqbtn danger" onclick="javascript:delSingle(${list.board_no}, 'bookmark');">삭제</button>
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
                	<a style="cursor: pointer" onclick='javascript: getBookList(1, ${loginInfo.member_no}, "${mypageVO.table_name }");' class="firstpage pbtn">
                        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
                    </a>
                    
                	<c:if test="${pageMaker.prev }">
                        <a class="prevpage pbtn" style="cursor: pointer" 
                        	onclick='javascript: getBookList(${pageMaker.startPage -1 }, ${loginInfo.member_no}, "${mypageVO.table_name }");' >
                        	<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
                        </a>
					</c:if>
					
                    <c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                       	<a style="cursor: pointer" class="pagenum<c:if test="${mypageVO.page == p}"> currentpage </c:if>" 
                       		onclick='javascript: getBookList(${p }, ${loginInfo.member_no}, "${mypageVO.table_name }");' >${p }</a>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<a class="nextpage pbtn" style="cursor: pointer" 
							onclick='javascript: getBookList(${pageMaker.endPage +1 }, ${loginInfo.member_no}, "${mypageVO.table_name }");'>
							<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
						</a>
					</c:if>
                    <a style="cursor: pointer" onclick='javascript: getBookList(${pageMaker.totalPage }, ${loginInfo.member_no}, "${mypageVO.table_name }");' 
                    	class="lastpage pbtn">
                        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
                    </a>
                </c:if>
                </div>
