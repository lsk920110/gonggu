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
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <link rel="stylesheet" href="resources/common.css">
   <style>
  	iframe{
		width: 100%;
		height: 210px;
		border-style: none;
	}  
   		
   table{
	   	margin-left: auto;
	   	margin-right: auto;
	   	width:1167px;
	   	max-width: 1166px;
    }
   	#none{
		border-top:1px solid #ffffff;
		border-left:1px solid #ffffff;
		border-right:1px solid #ffffff;
	}
	.icon{
	    width:70px;
	    height:20px;
        border-radius: 10px;
        color: white;
        font-size:14px;
        text-align:center;
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

	
	<table>
		<tr>
			<td id="none"><button onclick="inqwrite()">글쓰기</button></td>
			<td id="none" colspan="5"></td>
		</tr>
	   <tr>
	      <th>글번호</th>
	      <th>카테고리</th>
	      <th>제목</th>
	      <th>작성자</th>
	      <th>작성일</th>
	      <th>답변여부</th>
	   </tr>
	   <c:if test="${InquiryList eq null || size == 0}">
	   <tr><td colspan="5"> 등록된 글이 없습니다.</td></tr>
	   </c:if>
	   <c:forEach items="${InquiryList}" var="InquiryList">
	   <tr>
	      <td>${InquiryList.board_no}</td>
	      <td>${InquiryList.inquiry_category_name}</td>
	      <td><a class="board_title" href="inquireBoardDetail?board_no=${InquiryList.board_no}">${InquiryList.board_title}</a></td>
	      <td>${InquiryList.user_id}</td>
	      <td><fmt:formatDate value="${InquiryList.board_date}" pattern="yyyy. MM. dd"/></td>
	      
	      
	    <c:choose>
			<c:when test="${InquiryList.inquiry_answer eq 'Y'}">
				<td> <div class="icon" style="background-color: rgb(204, 41, 41)">답변완료</div></td>
			</c:when>
			<c:when test="${InquiryList.inquiry_answer == 'N'}">
				<td> <div class="icon" style="background-color: rgb(53, 236, 181)">답변대기</div></td>
			</c:when>
		</c:choose>
	       
	   </tr>
	   </c:forEach>
	</table>
	
		<!-- 페이징 영역 -->
	
				<div class="container">
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
	
		<!-- 페이징 영역 -->	
	  	<iframe src="footer"></iframe>
	  	


</body>
<script>
var session = "${sessionScope.loginId}";
console.log(session);

if(session == ''){
	console.log('비로그인');
}

   	function inqwrite(){
  		if(session == '') {
  			alert('로그인 후 이용해주세요!!');
  		} else{
	  		location.href='inqwriteForm';
  			
  		}
  		
  		
  	};
  	
  	var startpage = "${nowpage}";
    startpage = startpage*1;
    var totalpage = "${pages}";
    totalpage = (totalpage*1) -1 ;
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
                location.href="./inquireBoardList2"+"?currpage="+page;         
             }
          }
       
       });

</script>
</html>