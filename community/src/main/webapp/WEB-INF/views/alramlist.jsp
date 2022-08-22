<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ empty alrData.list }">
	<div class="socketAlert">내역이 존재하지 않습니다.</div>
</c:if>
<c:if test="${ !empty alrData.list }">
	<c:forEach items="${alrData.list }" var="alr">
	<div>${alr.link }</div>
	</c:forEach>
</c:if>