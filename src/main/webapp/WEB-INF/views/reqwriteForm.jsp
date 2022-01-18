<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
</head>
<body>
	<h3>| 요청게시글 작성하기</h3>
	<form action="reqwrite" method="post" enctype="multipart/form-data">
		<table>    
			<tr>
				<th>
					<select name="Category">
                    <option value="" disabled selected>카테고리 선택</option>
                    <option value="생활/건강">생활/건강</option>
                    <option value="스포츠/레저">스포츠/레저</option>
                    <option value="가구/인테리어">가구/인테리어</option>
                    <option value="디지털/가전">디지털/가전</option>
                    <option value="패션">패션</option>
                    <option value="화장품/미용">화장품/미용</option>
                    <option value="출산/육아">출산/육아</option>
                    <option value="식품">식품</option>
                    <option value="여가/생활 편의">여가/생활 편의</option>
                    <option value="기타">기타</option>
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
				<button>확인</button>
				<input type="button" onclick="location.href='./RequestBoardlist'" value="취소" />
				</th>
			</tr>
		</table>
	</form>
	
</body>
  
</body>
<script></script>
</html>
