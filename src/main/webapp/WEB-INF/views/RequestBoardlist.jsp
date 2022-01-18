<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <link rel="stylesheet" href="resources/common.css">
   <style></style>
</head>
<body>
  	<iframe src="header"></iframe>

<button onclick="location.href='reqwriteForm'">글쓰기</button>
<table>
   <tr>
      <th>글번호</th>
      <th>카테고리</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
      <th>조회수</th>
      <th>노출여부</th>
   </tr>
   <c:if test="${RequestList eq null || size == 0}">
   <tr><td colspan="5"> 등록된 글이 없습니다.</td></tr>
   </c:if>
   <c:forEach items="${RequestList}" var="RequestList">
   <tr>
      <td>${RequestList.board_no}</td>
      <td>${RequestList.product_category_name}</td>
      <td><a href="RequestBoardDetail?board_no=${RequestList.board_no}">${RequestList.board_title}</a></td>
      <td>${RequestList.user_id}</td>
      <td>${RequestList.board_date}</td>
      <td>${RequestList.bHit}</td>
      <td>${RequestList.board_exposure}</td>
   </tr>
   </c:forEach>
</table>
   <iframe src="footer"></iframe>

</body>
<script></script>
</html>