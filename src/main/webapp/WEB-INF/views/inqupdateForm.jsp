<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
 <style>
 	table ,th,td {
 		border : 1px solid black;
 		border-collapse : collapse;
 		padding : 5px;
 	}
 
 </style>
</head>
<body>
	<h3>| 문의게시글 작성하기</h3>
	<form action="inqupdate" method="post" enctype="multipart/form-data">
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
					<input type="text" name="board_title" value="${inqboardetail.board_title}"/>
				</td>
			</tr>

			<tr>
				<td colspan="2">
					<textarea name="board_content">${inqboardetail.board_content}</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<c:forEach items="${photolist}" var="photo">
						<br/><a class="delphoto" id="${photo.photo_newname}">"${photo.photo_oriname}"</a>
					</c:forEach>
				</td>
				<td>
					<input type="file" name="photos" multiple="multiple"/><br/>
					<input type="button" onclick="photodel()" value="삭제"/>
					<input type="hidden" name="delphoto" value=""/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<button>수정</button>
				<!-- <input type="button" id="regist" value="작성완료"/> -->
				<input type="button" onclick="location.href='./inquireBoardDetail?board_no=${inqboardetail.board_no }'"value="취소" />
				</th>
			</tr>
		</table>
	</form>
	
</body>
  
</body>
<script>
function photodel(){
	var $delphoto = $('.delphoto');
	
	for (var i = 0; i < $delphoto.length; i++) {
		console.log($delphoto[i].id);
		
	}
	
}



</script>
</html>
