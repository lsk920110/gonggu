<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/common.css">
	<style></style>
</head>
<body>
<button onclick="location.href='inqwriteForm'">글쓰기</button>
<table>
	<tr>
		<th>글번호</th>
		<th>요청현황</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>노출여부</th>
	</tr>
	<c:if test="${list eq null || size == 0}">
	<tr><td colspan="5"> 등록된 글이 없습니다.</td></tr>
	</c:if>
	<c:forEach items="${list}" var="board">
	<tr>
		<td>${board.board_no}</td>
		<td>요청현황</td>
		<td><a href="inquireBoardDetail?board_no=${board.board_no}">${board.board_title}</a></td>
		<td>${board.user_id}</td>
		<td>${board.board_date}</td>
		<td>${board.bHit}</td>
		<td>${board.board_exposure}</td>
	</tr>
	</c:forEach>
</table>
</body>
<script></script>
</html>