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
 	iframe{
			width: 100%;
			height: 210px;
			border-style: none;
		} 
 
 </style>
</head>
<body>
  	<iframe src="header"></iframe>
	<h3>| 문의게시글 작성하기</h3>
	<form action="inqupdate" method="post">
		<input type="hidden" name="board_no" value="${inqboardetail.board_no }"/>
		<table>    
			<tr>
				<th>
					<select name="inquiry_category_name">
                    <option value="" disabled selected>카테고리 선택</option>
                    <option value="배송문의">배송문의</option>
                    <option value="반품/교환/환불">반품/교환/환불</option>
                    <option value="주문/결제">주문/결제</option>
                    <option value="제품문의">제품문의</option>
                    <option value="회원서비스">회원서비스</option>
            		</select>
             	</th>
			
				
				<td><input type="text" placeholder="제목을 입력하세요" name="board_title" value="${inqboardetail.board_title}"/></td>
			</tr>

			<tr>
				<th></th>
				<td><textarea placeholder="내용을 입력하세요 " name="board_content">${inqboardetail.board_content}"</textarea></td>
			</tr>
<%-- 			<tr>
				<th></th>
				<td><input type="file" name="photos" multiple="multiple"/>
				<!-- 현재 업로드돈 사진 삭제 -->
				<c:forEach items="${photos}" var="photo">
				<img src="/photo/${photo.newFileName}" width="250"/><br/><br/>
					</c:forEach>
				</td>
				
			</tr> --%>
			<tr>
				<th colspan="2">
				<button>수정</button>
				<input type="button" onclick="location.href='./inquireBoardList'" value="취소" />
				</th>
			</tr>
		</table>
	</form>
  	<iframe src="footer"></iframe>
	
</body>
<script>
function photodel(){
	var $delphoto = $('.delphoto');
	
	for (var i = 0; i < $delphoto.length; i++) {
		console.log($delphoto[i].id);
		
	}
	
}

var category = "${inqboardetail.inquiry_category_name}";
$('select').val(category);
console.log(category);


</script>
</html>
