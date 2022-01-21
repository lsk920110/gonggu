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
	<link rel="stylesheet" href="resources/common.css">
	<style>
		.adminMenu{
			cursor: pointer;
			padding: 20px;
		}
		.adminMenu:hover{
			background-color: beige;
		}
		#adminMenuBar{
			text-align: center;
		}
		iframe{
			width: 100%;
			height: 210px;
			border-style: none;
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
	<div id = "adminMenuBar">
        <img style="background-color: beige" class="adminMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="adminOrderList?currpage=1">
        <img class="adminMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="adminInquiry?currpage=1">
        <img class="adminMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="adminRequire?currpage=1">
        <img class="adminMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="admingroupbuylist?currpage=1">
        <img class="adminMenu" src="resources/img/전체회원정보.png" alt="전체회원정보" loc="adminuserlist?currpage=1">
        <img class="adminMenu" src="resources/img/상품등록.png" alt="상품등록" loc="groupbuywriteForm2">
    </div>
			
	<hr/>
	<br/>
	<br/>
	<br/>		
			
			
		<table>
			<tr>
				<th>주문번호</th>
				<th>게시글 번호</th>
				<th>게시글 제목</th>
				<th>게시글 진행상태</th>
				<th>주문자 아이디</th>
				<th>주문일자</th>
				<th>수량</th>
				<th>주문단계</th>
				<th>비고</th>
			</tr>
			
			<c:if test="${adOrderList eq null || size == 0}">
				<tr>
					<td colspan="9">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${adOrderList}" var="adOrderList">
				<input type="hidden" name="boardNo" value="${adOrderList.board_no}"/>
					<tr>
						<th><a href="orderDetail?order_no=${adOrderList.order_no}&frompage=adminOrderList">${adOrderList.order_no}</a></th>
						<th>${adOrderList.board_no}</th>
						<th>${adOrderList.board_title}</th>
						<th>${adOrderList.groupbuy_state}</th>
						<th>${adOrderList.user_id}</th>		
						<th>${adOrderList.order_date}</th>
						<th>${adOrderList.order_quantity}</th>
						<th>${adOrderList.order_state}</th>
						<th>${adOrderList.order_etc}</th>
					</tr>			
			</c:forEach>
			<!-- 페이징 영역 -->
			<tr>
				<td colspan="9">
					<div class="container">
						<nav aria-label="Page navigation" style="text-align:center">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
				</td>
			</tr>
			<!-- 페이징 영역 -->			
			
		</table>	
		<input type="hidden" name="currpage" value="${nowpage}"/>
	
	<br/>
	<br/>
	<br/>

	<iframe src="footer"></iframe>
	
</body>
<script>
	$(".adminMenu").click(function(){
	    location.href=$(this).attr("loc");
	});
	
	
	
	/* 페이징에 관한 곳 */
	var startpage = "${nowpage}";
	startpage = startpage*1;
	var totalpage = "${pages}";
	totalpage = (totalpage*1)-1;
	$('#pagination').twbsPagination({
		startPage : "${nowpage}",
		totalPages : totalpage,
		visiblePages : 5,
		onPageClick:function(evt,page){
			console.log(evt);
			console.log(page);
			if("${nowpage}" != page) {
				location.href="./adminOrderList?currpage="+page;			
			}
		}

	});
</script>
</html>