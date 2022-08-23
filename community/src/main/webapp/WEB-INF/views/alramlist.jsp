<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<c:if test="${ !empty alrData.list }">
	<c:forEach items="${alrData.list }" var="alr">
	<div class="alrList">
		${alr.link }
	</div>
	</c:forEach>
</c:if>