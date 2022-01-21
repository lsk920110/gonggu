<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
 <!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>  -->
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
	<script src="resources/js/jquery.twbsPagination.js"></script>
	<script src="resources/js/.bootstrap.min.js"></script>
	<link rel="stylesheet" href="resources/bootstrap.min.css"/>	
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <link rel="stylesheet" href="resources/common.css">
   <style>
   #table{
	   	margin-left: auto;
	   	margin-right: auto;
	   	min-width: 1296px;
	   	max-width: 1166px;
   }
   	.icon{
	    width:70px;
	    height:20px;
        border-radius: 10px;
        color: white;
        font-size:14px;
        text-align:center;
	}
	.none{
		border-top:1px solid #ffffff;
		border-left:1px solid #ffffff;
		border-right:1px solid #ffffff;
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

   </style>
</head>
<body>
  	<iframe src="header"></iframe>
	
	<table id="table">
		<tr>
			<td class="none"><button onclick="reqwrite()">글쓰기</button></td>
			<td class="none" colspan="6"></td>
	   </tr>
	   <tr>
	      <th>글번호</th>
	      <th>카테고리</th>
	      <th>제목</th>
	      <th>작성자</th>
	      <th>조회수</th>
	      <th>작성일</th>
	      <th>선정여부</th>
	   </tr>
	   <c:if test="${RequestBoardlist eq null || size == 0}">
	   <tr><td colspan="6"> 등록된 글이 없습니다.</td></tr>
	   </c:if>
	   <c:forEach items="${RequestBoardlist}" var="RequestList">
	   <tr>
	      <td>${RequestList.board_no}</td>
	      <td>${RequestList.product_category_name}</td>
	      <td><a class="board_title" href="RequestBoardDetail?board_no=${RequestList.board_no}">${RequestList.board_title}</a></td>
	      <td>${RequestList.user_id}</td>
	      <td>${RequestList.board_bHit}</td>
	      <td><fmt:formatDate value="${RequestList.board_date}" pattern="yyyy. MM. dd"/></td>
	      
	      
		<c:choose>
			<c:when test="${RequestList.board_select eq '선정완료'}">
				<td> <div class="icon" style="background-color: rgb(41, 166, 204)">${RequestList.board_select}</div></td>
			</c:when>
			<c:when test="${RequestList.board_select eq '선정실패'}">
				<td> <div class="icon" style="background-color: rgb(204, 41, 41)">${RequestList.board_select}</div></td>
			</c:when>
			<c:when test="${RequestList.board_select eq '진행중'}">
				<td> <div class="icon" style="background-color: rgb(53, 236, 181)">${RequestList.board_select}</div></td>
			</c:when>
		</c:choose>
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
   <iframe src="footer"></iframe>

</body>
<script>

var session = "${sessionScope.loginId}";
console.log(session);

if(session == ''){
	console.log('비로그인');
}

   	function reqwrite(){
  		if(session == '') {
  			alert('로그인 후 이용해주세요!');
  		} else{
	  		location.href='reqwriteForm';
  			
  		}
  		
  		
  	};
  	
	
	
  	var startpage = "${nowpage}";
  	startpage = startpage*1;
  	var totalpage = "${pages}";
  	totalpage = (totalpage*1);
  	console.log(startpage);
  	console.log(totalpage);
  	   /* 페이징에 관한 곳 */
  	   $('#pagination').twbsPagination({
  	      startPage : startpage,
  	      totalPages : totalpage,
  	      visiblePages : 5,
  	      onPageClick:function(evt,page){
  	         console.log(evt);
  	         console.log(page);
  	         if("${nowpage}" != page) {
  	            location.href="./RequestBoardlist?currpage="+page;         
  	         }
  	      }
  	   
  	   });
  	   




</script>
</html>