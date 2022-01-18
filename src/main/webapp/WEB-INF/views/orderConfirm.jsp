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
		padding  : 5px;
	}
	
	</style>
</head>
<body>
	<h3>주문확인</h3>
	<hr/>
	<form action="orderRequest" method="GET">
		<h2>구매자 정보</h2>
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" value="${confirminfo.user_name }" name="user_name"/></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" value="${confirminfo.user_address }" name="user_address"/></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" value="${confirminfo.user_phone }" name="user_phone"/></td>
			</tr>			
		</table>
		<h2>구매글 정보</h2>
		<table>
			<tr>
				<th>게시글번호</th>
				<th>제목</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
			<tr>
				<td >
					${confirminfo.board_no }
					<input type="hidden" name="board_no" value="${confirminfo.board_no }"/>
				</td>
				<td>
					${confirminfo.board_title }
				</td>
				<td>
					${confirminfo.order_quantity }
					<input type="hidden" name="order_quantity" value="${confirminfo.order_quantity }"/>	
				</td>
				<td>
					${confirminfo.groupbuy_unitprice * confirminfo.order_quantity }
					<input type="hidden" name="order_price" value="${confirminfo.groupbuy_unitprice * confirminfo.order_quantity }"/>	
				</td>
			</tr>
		</table>
		<input type="hidden" name="frompage" value="groupBuyList"/>
		<button>신청</button>
		<input type="button" value="취소" onclick="location.href='/'"/>
	</form>
</body>
<script>
	
</script>
</html>