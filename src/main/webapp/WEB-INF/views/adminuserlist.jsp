<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	table,th,td {
		border : 1px solid black;
		border-collapse : collapse;
		padding : 5px;
	}
	</style>
</head>
<body>
	
	
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>관리자여부</th>
		</tr>
		
		<c:forEach var="userinfo" items="${adminuserlist }">
			<tr>
				<td>${userinfo.user_id }</td>
				<td>${userinfo.user_name }</td>
				<td>${userinfo.user_gender }</td>
				<td>${userinfo.user_birth }</td>
				<td>${userinfo.user_email }</td>
				<td>${userinfo.user_phone }</td>
				<td>${userinfo.user_address }</td>
				<td>${userinfo.user_admin }</td>
			</tr>		
		</c:forEach>
				
	</table>
	
	
	
</body>
<script>
	


</script>
</html>