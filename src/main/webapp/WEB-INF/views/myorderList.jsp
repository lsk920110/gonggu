<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
	<script src="resources/js/jquery.twbsPagination.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> -->
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
		 table{
         margin-left: auto;
         margin-right: auto;
         min-width: 1296px;
    }		
	</style>
</head>
<body>
  	<iframe src="header"></iframe>
  	<div id = "myMenuBar">
        <img style="background-color: beige" class="myMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="myorderList?currpage=1">
        <img class="myMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="myInquire?currpage=1">
        <img class="myMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="myRequire?currpage=1">
        <img class="myMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="myWish?currpage=1">
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
			<th><a href="groupbuydetail?board_no=${orl.board_no}&frompage=myorderList">${orl.board_title}</a></th>		
			<th>${orl.groupbuy_state}</th>	
			<th>${orl.order_state}</th>		
			<th>${orl.order_quantity }</th>
			<th>${orl.order_etc}</th>		
		</tr>			
		</c:forEach>
		
		<!-- 페이징 영역 -->
		<tr>
			<td colspan="7">
				<div class="container">
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
		<!-- 페이징 영역 -->
	</table>
	<div>

	
	</div>

   <iframe src="footer"></iframe>
	
</body>
<script>
	//console.log("${orderList}");
	
	$(".myMenu").click(function(){
	    location.href=$(this).attr("loc");
	});

	
	var totalpage = "${pages}";
	console.log("totalpage : "+totalpage);
	/* 페이징에 관한 곳 */
	$('#pagination').twbsPagination({
		startPage : "${nowpage}",
		totalPages : totalpage,
		visiblePages : 5,
		onPageClick:function(evt,page){
			console.log(evt);
			console.log(page);
			if("${nowpage}" != page) {
				location.href="./myorderList?currpage="+page;			
			}
		}

	});
	
	
	
</script>
</html>