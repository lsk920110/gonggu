<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
 <style></style>
</head>
<body>
	<h3>| 문의게시글 작성하기</h3>
	<form action="inqwrite" method="POST" enctype="multipart/form-data">
        카테고리
        <select name = "title" size="1" multiple>
            <option value="one" selected>배송문의</option>
            <option value="two" selected>반품/교환/환불</option>
            <option value="three" selected>주문/결제</option>
            <option value="four" selected>제품문의</option>
            <option value="five" selected>회원서비스</option>
        </select>

		<table>
			<tr>
				<td><input type="text" name="title" placeholder="제목을 입력하세요"/></td>
			</tr>
			
			<tr>
				<td><textarea name="content" placeholder="내용을 입력하세요"></textarea></td>
			</tr>
		
			
			<tr>
				<th colspan="2">
					<button>등록</button>
					<input type="button" onclick="location.href='./'" value="취소"/>
				</th>
			</tr>
			
		</table>
	
	</form>
  
</body>
<script></script>
</html>
