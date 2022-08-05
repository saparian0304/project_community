<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강원도</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/apiTest.js' />"></script>

<style type="text/css">
table {
    margin-left:auto; 
    margin-right:auto;
}

table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
};
</style>

</head>
<body>
<h1>생활</h1>
<table id="api">
	<thead>
		<tr>
			<td>페이지번호 : <input type="text" value="pageNo" v-model="pageNo"></td>
			<td>한 페이지 결과 수 : <input type="text" value="numOfRows" v-model="numOfRows"></td>
			<td>어린이집 유형 : 
				<select v-model="nrsryType">
					<option value="">전체</option>
					<option value="민간">민간</option>
					<option value="가정">가정</option>
					<option value="직장">직장</option>
					<option value="법인">법인</option>
				</select> 
			</td>
			<td>
				<input type="button" value="검색" @click="search()">
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>읍면동</th>
			<th>분류</th>
			<th>어린이집 이름</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
		<tr v-for="data in apiList">
			<td>{{data.no}}</td>
			<td>{{data.dong_nm}}</td>
			<td>{{data.nrsry_type}}</td>
			<td>{{data.inst_nm}}</td>
			<td>{{data.telno}}</td>
			<td>{{data.addr}}</td>
		</tr>
	</tbody>
</table>
</body>
</html>