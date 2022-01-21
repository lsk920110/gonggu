<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<script src="resources/js/jquery.twbsPagination.js"></script>
	<script src="resources/js/.bootstrap.min.js"></script>
	<link rel="stylesheet" href="resources/bootstrap.min.css"/>
	<style>
		.onetable{
			border: none;
		}
		table,th,td{
			border : 1px solid black;
			border-collapse : collapse ;
			padding : 5px;
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
    	.board_title{
		    display: block;
	        color: black;
	        width: 350px;
	        font-weight: bolder !important;
	        overflow: hidden;
	        text-overflow: ellipsis;
	        white-space: nowrap;
		}
		.icon{
		    width:70px;
		    height:20px;
	        border-radius: 10px;
	        color: white;
	        font-size:14px;
	        text-align:center;
		}
		
	</style>
</head>
<body>
	<iframe src="header"></iframe>
	<div id = "myMenuBar">      
		<img class="myMenu" src="resources/img/my주문내역.png"  alt="my주문내역" loc="myorderList?currpage=1">
        <img class="myMenu" src="resources/img/my문의글.png" alt="my문의글" loc="myInquire?currpage=1">
        <img style="background-color: beige" class="myMenu" src="resources/img/my요청글.png" alt="my요청글" loc="myRequire?currpage=1">
        <img class="myMenu" src="resources/img/my찜리스트.png" alt="my찜리스트" loc="myWish?currpage=1">
        <img class="myMenu" src="resources/img/my회원정보수정.png" alt="my회원정보수정" loc="myProfile">
    </div>
<!-- 	<div>
		<a href="myorderList">내 주문 내역</a>
		<a href="myWish">찜리스트</a>
		<a href="myRequire">내가 쓴 요청글</a>
		<a href="myInquire">내가 쓴 문의글</a>
		<a href="myProfile">회원정보수정</a>
	</div> -->

	<table class="onetable">
		<tr>
			<th class="onetable">요청게시글</th>
		</tr>
		<tr>
	</table>
	<table>
		<tr>
			<th>글번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>조회수</th>
			<th>작성일자</th>
			<th>진행상태</th>
		</tr>
		
		<c:if test="${requireList eq null || size == 0}">
		<tr><td colspan="5">등록된 글이 없습니다.</td></tr>
		</c:if>
		<c:forEach var="reL" items="${requireList}" >
		<tr>
			<th>${reL.board_no}</th>
			<th>${reL.product_category_name}</th>
			<th><a class="board_title" href="RequestBoardDetail?board_no=${reL.board_no}&frompage=myorderList">${reL.board_title}</a></th>		
			<th>${reL.board_bHit}</th>
			<th><fmt:formatDate value="${reL.board_date}" pattern="yyyy. MM. dd"/></th>
			
			<c:choose>
				<c:when test="${reL.board_select eq '선정완료'}">
					<th> <div class="icon" style="background-color: rgb(41, 166, 204)">${reL.board_select}</div></th>
				</c:when>
				<c:when test="${reL.board_select eq '선정실패'}">
					<th> <div class="icon" style="background-color: rgb(204, 41, 41)">${reL.board_select}</div></th>
				</c:when>
				<c:when test="${reL.board_select eq '진행중'}">
					<th> <div class="icon" style="background-color: rgb(53, 236, 181)">${reL.board_select}</div></th>
				</c:when>
			</c:choose>
			
		</tr>			
		</c:forEach>

	</table>	
	
	

	<iframe src="footer"></iframe>

	
</body>
<script>
$(".myMenu").click(function(){
    location.href=$(this).attr("loc");
});

</script>
</html>