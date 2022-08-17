<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<<script type="text/javascript">

</script>

<p><span><strong>총 ${comment.totalCount }개</strong>  |  ${commentVO.page }/${comment.totalPage }페이지</span></p>
                    <table class="list">
                        <colgroup>
                            <col width="80px" />
                            <col width="*" />
                            <col width="100px" />
                            <col width="100px" />
                        </colgroup>
                        <tbody>
						<c:if test="${empty comment.list }">
                            <tr>
                                <td class="first" colspan="8">등록된 글이 없습니다.</td>
                            </tr>
						</c:if>
						<c:if test="${!empty comment.list }">
                        <c:forEach var="comment" items="${comment.list }" varStatus="status">
                            <tr>
                                <td>${comment.no }</td>
                                <td class="txt_l" style="text-align: left;">	<!-- 로그인회원만 삭제 -->
                                    ${comment.content } <c:if test="${loginInfo.no == comment.member_no }">
                                    <a href="javascript:commentDel(${comment.no });">[삭제]</a></c:if>
                                    <!-- <a href="board_view.html">${comment.content }</a> -->
                                </td>
                                <td class="writer">
                                    ${comment.member_name }
                                    <div>
                                    <p><button>쪽지</button></p>
                                    <p><button>활동내역</button></p>
                                    <p><button>친구신청</button></p>
                                    <p><button>차단</button></p>
                                    </div>
                                </td>
                                <td class="date">${comment.regdate }</td>
                            </tr>
                        </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                    
                    <div class="pagenate clear">
                        <ul class='paging'>
                        <c:if test="${comment.prev == true }">
                        	<li><a href="javascript:getComment(${comment.startPage-1});"></a>
                        </c:if>
                        <c:forEach var="p" begin="${comment.startPage }" end="${comment.endPage }">
                            <li><a href="javascript:getComment(${p});" <c:if test="${commentVO.page == p }">class='current'</c:if>>${p }</a></li>
                        </c:forEach>
                        <c:if test="${comment.next == true }">
                        	<li><a href="javascript:getComment(${comment.endPage+1});"></a>
                        </c:if>
                        </ul> 
                    </div>
