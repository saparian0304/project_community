<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
               <button style="width : 100px; height : 30px;" class="reqbtn friend" onclick="javascript:getFriReq(1,${loginInfo.member_no});">친구요청목록</button>
                <button style="width : 100px; height : 30px;" class="reqbtn friend" onclick="javascript:getFriList(1,${loginInfo.member_no});">친구목록</button>
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
                <h3 class="sub_title">친구목록</h3>
                    <p><span><strong>총 ${data.totalCount }명</strong>  |  ${data.page}  / ${pageMaker.totalPage }페이지</span></p>
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="80px" />
                            <col width="*" />
                            <col width="100px" />
                            <col width="150px" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>닉네임</th>
                                <th>수락 일자</th>
                                <th>친구 삭제</th>
                            </tr>
                        </thead>
                        <tbody>
						<c:if test="${empty data.list }">
                    	<tr>
                    		<td class="tit_notice" colspan="4" style="text-align : center;">등록된 친구가 없습니다.</td>
                    	</tr>
                    	</c:if>
                    	<c:if test="${!empty data.list }">
                    		<c:forEach var="list" items="${data.list }" varStatus="st">
	                    	<tr>
	                    		<td >${data.totalCount - ((mypageVO.page -1) * mypageVO.pageRow + st.index) }</td>
	                    		<td class="tit_notice" style="text-align : center;">${list.nickname }</td>
	                    		<td class="tit_notice">
	                    			<fmt:formatDate pattern="yyyy-MM-dd" value="${list.res_date }"/>
	                    		</td>
	                    		<td>
	                    			<button class="reqbtn danger" onclick="javascript: delSingle(${list.fri_no}, 1);">삭제</button>
	                    		</td>
	                    	</tr>
	                    	</c:forEach>                    
	                    </c:if>     
                            
                        </tbody>
                    </table>
                    
                    <div class="pagenation">
                    <c:if test="${!empty data.list }">
	                	<a style="cursor: pointer" onclick='javascript: getFriList(1, ${loginInfo.member_no});' 
	                		class="firstpage pbtn">
	                        <img src="/pet/img/btn_firstpage.png" alt="첫 페이지로 이동">
	                    </a>
	                    
	                	<c:if test="${pageMaker.prev == true }">
	                        <a class="prevpage pbtn" style="cursor: pointer" 
	                        	onclick='javascript: getFriList(${pageMaker.startPage -1 }, ${loginInfo.member_no});' >
	                        	<img src="/pet/img/btn_prevpage.png" alt="첫 페이지로 이동">
	                        </a>
						</c:if>
						
	                    <c:forEach var="p" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	                       	<a style="cursor: pointer" class="pagenum <c:if test="${mypageVO.page == p}"> currentpage </c:if>" 
	                       		onclick='javascript: getFriList(${p }, ${loginInfo.member_no});' >${p }</a>
						</c:forEach>
						<c:if test="${pageMaker.next == true }">
							<a class="nextpage pbtn" style="cursor: pointer" 
								onclick='javascript: getFriList(${pageMaker.endPage +1 }, ${loginInfo.member_no});'>
								<img src="/pet/img/btn_nextpage.png" alt="다음 페이지로 이동">
							</a>
						</c:if>
	                    <a style="cursor: pointer" onclick='javascript: getFriList(${pageMaker.totalPage }, ${loginInfo.member_no});' 
	                    	class="lastpage pbtn">
	                        <img src="/pet/img/btn_lastpage.png" alt="마지막 페이지 이동">
	                    </a>
	                </c:if>
                	</div>
                
                    <!-- 페이지처리 -->
                    
