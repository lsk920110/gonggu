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
	</style>
</head>
<body>
	<iframe src="header"></iframe>
	<div id = "myMenuBar">
        <img class="myMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="myorderList?currpage=1">
        <img class="myMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="myInquire?currpage=1">
        <img style="background-color: beige" class="myMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="myRequire?currpage=1">
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
	<h3>요청게시글</h3>
	
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
			<th>${reL.board_title}</th>		
			<th>${reL.board_bHit}</th>
			<th>${reL.board_date }</th>
			<th>${reL.board_select}</th>		
				
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