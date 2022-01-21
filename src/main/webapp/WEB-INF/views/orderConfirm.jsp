<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문확인</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		.all{
			width:1167px;
			margin: 0 auto;
		}
	
		iframe{
			width: 100%;
			height: 210px;
			border-style: none;
		}
		table,th,td {
			border : 1px solid black;
			border-collapse : collapse;
			padding  : 5px;
		}	
		table{
		   	margin-left: auto;
		   	margin-right: auto;
		   	width:1167px;
		   	max-width: 1166px;
	    }
	    .btn{
	    	float:right;
	    	width:70px;
	    	height:40px;
	    }
	    .put{
	    	width:883px;
	    }
	    th{
    		background-color: rgb(233, 233, 233);
    	}
    	td{
    		text-align:center;
    	}
	
	</style>
</head>
<body>
<iframe src="header"></iframe>

	<div class="all">
		<h3>주문확인</h3>
		<hr/>
		<form action="orderRequest" method="GET">
			<h2>구매자 정보</h2>
			<table>
				<tr>
					<th style="width:259px;">이름</th>
					<td><input class="put" type="text" value="${confirminfo.user_name }" name="user_name"/></td>
				</tr>
				<tr>
					<th style="width:259px;">주소</th>
					<td><input class="put" type="text" value="${confirminfo.user_address }" name="user_address"/></td>
				</tr>
				<tr>
					<th style="width:259px;">연락처</th>
					<td><input class="put" type="text" value="${confirminfo.user_phone }" name="user_phone"/></td>
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
					<td>
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
			<br/>
			<input class="btn" type="button" value="취소" onclick="location.href='./groupbuydetail?board_no=${confirminfo.board_no }'"/>
			<input type="hidden" name="frompage" value="groupBuyList"/>
			<button style="background-color: rgb(41, 166, 204); margin-right:10px; color: white;" class="btn" >신청</button>
		</form>
		
	</div>
	<iframe src="footer"></iframe>
	
</body>
<script>
	$('button').click(function(){
		
		alert('구매 신청이 완료되었습니다.');
	});
</script>
</html>