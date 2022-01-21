<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>주문상세</title>
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
	table , th, td {
		border : 1px solid black;
		border-collapse : collapse;
		padding : 5px;
	}
	table{
	   	margin-left: auto;
	   	margin-right: auto;
	   	width:1167px;
	   	max-width: 1166px;
    }
    .num{
    	font-size:30px;
    	font-weight: bold;
    	color: rgb(81, 127, 252);
    	left: 2px;
    }
    th{
    	background-color: rgb(233, 233, 233);
    }
    .btn{
    	float:right;
    	width:70px;
    	height:40px;
    }
	
	</style>
</head>
<body>
<iframe src="header"></iframe>


	<div class="all">
		<h2 style="display:inline">주문번호</h2><p class="num" style="display:inline">${orderdetail.order_no}</p>
		<hr/>
		
		<h2>구매자 정보</h2>
		<table>
			<tr>
				<th>이름</th>
				<td>${orderdetail.order_name }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${orderdetail.order_address }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${orderdetail.order_phone }</td>
			</tr>			
		</table>
		
		<h2>구매글 정보</h2>
		<table>
			<tr>
				<th>진행상태</th>
				<th>게시글번호</th>
				<th>제목</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
			<tr style="text-align:center;">
				<td>${orderdetail.groupbuy_state }</td>
				<td>${orderdetail.board_no }</td>
				<td>${orderdetail.board_title }</td>
				<td>${orderdetail.order_quantity }</td>
				<td>${orderdetail.order_quantity * orderdetail.groupbuy_unitprice }</td>
			</tr>
		</table>
			<c:choose>
				<c:when test="${orderdetail.order_state eq '취소완료'}">
					<div style="text-align:center; margin-top:30px;">
						<img src="./resources/img/취소완료.png" alt="취소완료이미지">
					</div>
					<h3 style="text-align:center;"id="orderState">${orderdetail.order_state }</h3>
				</c:when>
				<c:otherwise> 
					<div style="text-align:center; margin-top:30px;">
						<img src="./resources/img/check.png" alt="체크이미지">
					</div>
					<h3 style="text-align:center;"id="orderState">${orderdetail.order_state }</h3>
				</c:otherwise> 
			</c:choose>
	
		<input class="btn" style="margin-left:3px;" type="button" value="확인" onclick="backPage()"/>
		<input class="btn" type="button" id="cancelBtn" value="주문취소" onclick="orderCancel()"/>
		
	</div>
	<br/>
	
	<iframe src="footer"></iframe>
	
</body>
<script>
	
	var os = '${orderdetail.order_state}';

	if(os == '취소완료' || os == '배송완료' ){
		$('#cancelBtn').hide();
	};
	
	if($('#orderState').html() == '배송완료'){
		$('#orderState').css('color','blue');
	}
	if($('#orderState').html() == '취소완료'){
		$('#orderState').css('color','red');
	}

	
	function orderCancel(){
		var cancel = confirm('주문을 취소하시겠습니까?');
		console.log(cancel);
		if(cancel){
			location.href='./orderCancel?order_no=${orderdetail.order_no}&frompage=${frompage}';
		}
	};
	
	function backPage(){

		location.href='./${frompage}?category=all&currpage=1';
		
	}
	
	





</script>
</html>