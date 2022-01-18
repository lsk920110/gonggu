<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	table,th,td{
		border : 1px solid black;
		border-collapse : collapse ;
		padding : 5px;
	}
		iframe{
		width: 100%;
			height: 210px;
			border-style: none;
		} 
		
		.myMenu{
			cursor: pointer;
			padding: 20px;
		}
		.myMenu:hover{
			background-color: beige;
		}
		#myMenuBar{
			text-align: center;
		}		
	
	</style>
</head>
<body>
  	<iframe src="header"></iframe>
  	<div id = "myMenuBar">
        <img style="background-color: beige" class="myMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="myorderList">
        <img class="myMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="myInquire">
        <img class="myMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="myRequire">
        <img class="myMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="myWish">
        <img class="myMenu" src="resources/img/전체회원정보.png" alt="전체회원정보" loc="myProfile">
    </div>
<!-- 	<div>
		<a href="myorderList">내 주문 내역</a>
		<a href="myWish">찜리스트</a>
		<a href="myRequire">내가 쓴 요청글</a>
		<a href="myInquire">내가 쓴 문의글</a>
		<a href="myProfile">회원정보수정</a>
	</div> -->
	<table>
		<tr>
			<th>주문번호</th>
			<th>주문날짜</th>
			<th>게시글제목</th>
			<th>게시글상태</th>
			<th>주문상태</th>
			<th>주문수량</th>
			<th>비고</th>
		</tr>
		
		
		<c:if test="${orderList eq null || size == 0}">
		<tr><td colspan="7">등록된 글이 없습니다.</td></tr>
		</c:if>
		<c:forEach var="orl" items="${orderList}" >
		<tr>
			<th><a href="orderDetail?order_no=${orl.order_no}&frompage=myorderList">${orl.order_no}</a></th>
			<th>${orl.order_date}</th>
			<th>${orl.board_title}</th>		
			<th>${orl.groupbuy_state}</th>	
			<th>${orl.order_state}</th>		
			<th>${orl.order_quantity }</th>
			<th>${orl.order_etc}</th>		
		</tr>			
		</c:forEach>

	</table>

   <iframe src="footer"></iframe>
	
</body>
<script>
	console.log("${orderList}");
	
	$(".myMenu").click(function(){
	    location.href=$(this).attr("loc");
	});

</script>
</html>