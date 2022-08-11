<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                  <table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
	                	 <colgroup>
	                	 	<col width="200px"/>
	                	 	<col width="269.73px"/>
	                	 	<col width="200px"/>
	                	 	<col width="*"/>
	                	 	<col width="100px"/>
	                	 </colgroup>
	                	 <tr>
                             <th colspan="5" style="text-align: center">${mydata.name } 님의 마이페이지 </th>
                         </tr>
	                	 <tr>
                             <th>아이디</th>
                             <td>${mydata.member_id }</td>
                             <th>닉네임</th>
                             <td>${mydata.nickname }</td>
                             <td><button onclick="location:href='#'">내정보수정</button></td>
                         </tr>
                         <tr>
                         	<th><fmt:formatDate pattern="yyyy" value="<%=new java.util.Date()%>"/>년 현재 등급</th>
                         	<td >${mydata.level }</td>
                         	<td colspan = "3"></td>
                         </tr>
                         <tr>
                         	<th>가입일</th>
                         	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mydata.regdate }"/> </td>
                         	<th >최종방문일</th>
                         	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mydata.curr_login }"/> </td>
                         	<td></td>
                         </tr>
                         <tr>
                         	<th>내가쓴글수</th>
                         	<td>${mydata.board_count }</td>
                         	<th >내가쓴댓글수</th>
                         	<td>${mydata.reply_count }</td>
                         	<td></td>
                         </tr>
	                </table>
