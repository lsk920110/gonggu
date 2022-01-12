<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		table, th, td{
			border : 1px solid black;
			border-collapse: collapse;
			padding: 5px;
		}
		div{
			margin-bottom: 5px;
		}
		
	</style>
</head>
<!--  실제 구현될 페이지가 아닙니다!!!!!!!!!!!!!!!  -->
<body>
	<jsp:include page="loginBox.jsp"/>
	<table>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>상세보기</th>
			<th>삭제</th>
		</tr>
		<!-- 추가 내용 -->
		<c:forEach var="item" items="${list}">
		<tr>
			<td>${item.id}</td>
			<td>${item.name}</td>   
			
			<!-- <td><a href="detail?id=${item.id}">상세보기</a></td>
			<td><a href="del?id=${item.id}">삭제</a></td> -->
		</tr>
		</c:forEach>
	</table>
</body>
<script></script>
</html>