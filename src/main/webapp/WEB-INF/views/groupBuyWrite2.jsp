<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	table,th,td{
		border : 1px solid black;
		border-collapse : collapse;
		padding : 5px;
	
	}
	
	
	</style>
</head>
<body>
	<form action="groupbuywrite2" method="post" enctype="multipart/form-data">
		<table>    
			<tr>
				<th>
					<select name="product_category_name">
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
             	<!-- 제목 -->
				<td><input type="text" placeholder="제목을 입력하세요." name="board_title"/></td>
			</tr>
			
			<tr>
				<th>마감일자</th>
				<td><input type="date" name="groupbuy_due_date"></td>
			</tr>
			<tr>
				<th>목표수량</th>
				<td><input type="text" name="groupbuy_target"/>개</td>
			</tr>
			<tr>
				<th>최대수량</th>
				<td><input type="text" name="groupbuy_max"/>개</td>
			</tr>

			<tr>
				<th>금액</th>
				<td><input type="text" name="groupbuy_unitprice"/>원</td>
			</tr>
		</table>
			<div>
				내용<br/>
				<textarea placeholder="내용을 입력하세요 ." name="board_content"></textarea>
			</div>
			<div>
				사진
						
				<!-- <input type="file" name="photos" multiple="multiple"/> -->
			</div>
			
			
			<input type="button" id="open" value="사진추가" />
			<button>작성완료</button>
			<input type="button" onclick="location.href='./list'" value="취소" />
			
			<div id="fromChild">
			
			</div>
			
	</form>
	
	
	
</body>
<script>


$('#open').click(function(){
	   win = window.open('groupBuyPhoto2','','width=700,height=700'); //주소값,창이름,옵션

	});





</script>
</html>