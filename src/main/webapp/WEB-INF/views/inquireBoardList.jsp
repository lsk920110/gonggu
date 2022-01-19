<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
      <link rel="stylesheet" href="resources/common.css">
   <style>
   		iframe{
			width: 100%;
			height: 210px;
			border-style: none;
		}  
   
   </style>
</head>
<body>
  	<iframe src="header"></iframe>

<button onclick="inqwrite()">글쓰기</button>
<table>
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
      <td><a href="inquireBoardDetail?board_no=${InquiryList.board_no}">${InquiryList.board_title}</a></td>
      <td>${InquiryList.user_id}</td>
      <td>${InquiryList.board_date}</td>  
	  <c:if test="${InquiryList.inquiry_answer == 'Y'}">
    	  <td>
	      	답변완료
	      </td>
    	</c:if>
	      <c:if test="${InquiryList.inquiry_answer == 'N'}">
			<td>
	      	답변대기
			</td>
	      </c:if>
   </tr>
   </c:forEach>
</table>
  	<iframe src="footer"></iframe>
  	


</body>
<script>
var session = "${sessionScope.loginId}";
console.log(a);

if(a == ''){
	console.log('비로그인');
}

   	function inqwrite(){
  		if(session == '') {
  			alert('로그인 후 이용해주세요!!');
  		} else{
	  		location.href='inqwriteForm';
  			
  		}
  		
  		
  	};
  	


</script>
</html>