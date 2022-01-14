<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	table,tr,td{
		border : 1px solid black;
		border-collapse : collapse;
		padding : 5px;
	}
	</style>
</head>
<body>
	<h1>축하합니다 문제없이 접속하셨읍니다.</h1>
	<h2>2조의 메인페이지입니다.</h2>
	<table>
		<tr>
			<th>마이페이지</th>
			<th>관리자페이지</th>
			<th>공구게시판</th>
			<th>요청게시판</th>
			<th>문의게시판</th>
			<th>회원관련</th>
			<th>임시 주문확인 연결</th>
			
		</tr>
		<tr>
			<td><a href="./mypage">mypage</a></td>
			<td><a href="./adminOrderList">adminOrderList</a></td>
			<td><a href="./groupBuyList">groupBuyList</a></td>
			<td><a href="./inqwriteForm">inqwriteForm</a></td>
			<td><a href="./InquireBoardlist">InquireBoardlist</a></td>
			<td><a href="./loginMain">login</a></td>
			<td><a href="./orderConfirmPage">orderConfirmPage</a></td>
			
		</tr>		
	
	
	
	
	</table>


	
</body>
<script></script>
</html>