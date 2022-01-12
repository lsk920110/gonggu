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
	<form action="inqwrite" method="post" enctype="multipart/form-data">
		<table>    
			<tr>
				<th>
					<select name="Category">
                    <option value="" disabled selected>카테고리 선택</option>
                    <option value="배송문의">배송문의</option>
                    <option value="반품/교환/환불">반품/교환/환불</option>
                    <option value="주문/결제">주문/결제</option>
                    <option value="제품문의">제품문의</option>
                    <option value="회원서비스">회원서비스</option>
            		</select>
             	</th>
             	<!-- 제목 -->
				<td>
					<input type="hidden" name="board_no"/>
					<input type="text" name="board_title" value="${dto.board_title}"/>
				</td>
			</tr>

			<tr>
				<td>
					<textarea name="board_content">${dto.board_content}</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="file" name="photos" multiple="multiple"/>
					<c:forEach items="${photos}" var="photo">
						<img src="/photo/${photo.newFileName}" width="250"/>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<button>수정</button>
				<!-- <input type="button" id="regist" value="작성완료"/> -->
				<input type="button" onclick="location.href='./'" value="취소" />
				</th>
			</tr>
		</table>
	</form>
	
</body>
  
</body>
<script></script>
</html>
