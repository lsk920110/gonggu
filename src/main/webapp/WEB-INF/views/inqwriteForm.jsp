<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
 <link rel="stylesheet" href="resources/common.css">
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
				<td><input type="text" placeholder="제목을 입력하세요" name="board_title"/></td>
			</tr>

			<tr>
				<th></th>
				<td><textarea placeholder="내용을 입력하세요 " name="board_content"></textarea></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="file" name="photos" multiple="multiple"/></td>
			</tr>
			<tr>
				<th colspan="2">
				<!-- 
				<input type="button" onclick="location.href='./inquireBoardDetail'" value="등록" />
				<input type="button" onclick="location.href='./inquireBoardList'" value="취소" />
				 -->
				
				<button>등록</button>
				<input type="button" onclick="location.href='./inquireBoardList'" value="취소" />
				</th>
			</tr>
		</table>
	</form>
	
</body>
  
</body>
<script></script>
</html>
