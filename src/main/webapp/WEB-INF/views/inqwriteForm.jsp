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
	textarea {
	    width: 1100px;
	    height: 450px;
	    resize: none;
	}
	table{
	   	margin-left: auto;
	   	margin-right: auto;
    }

 	.category{
 		width:150px;
 		height:50px;
 	}
 	.title{
 		width: 1099px;
 		height:50px;
 	}  
 
 </style>
</head>
<body>
  	<iframe src="header"></iframe>


	<form action="inqwrite" method="post">
	<input type="hidden" name="user_id" value="${sessionScope.loginId}"/>
		<table>
			<tr>
				<th colspan="2">문의게시글 작성하기</th>
			</tr>    
			<tr>
				<th>
					<select class="category" name="Category">
                    <option value="" disabled selected>카테고리 선택</option>
                    <option value="배송문의">배송문의</option>
                    <option value="반품/교환/환불">반품/교환/환불</option>
                    <option value="주문/결제">주문/결제</option>
                    <option value="제품문의">제품문의</option>
                    <option value="회원서비스">회원서비스</option>
            		</select>
				</th>
				<td>
					<input class="title" type="text" placeholder="제목을 입력하세요" name="board_title"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea placeholder="내용을 입력하세요 " name="board_content"></textarea></td>
			</tr>
<!-- 			<tr>
				<th>파일등록</th>
				<td><input type="file" name="photos" multiple="multiple"/></td>
			</tr> -->
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
  	<iframe src="footer"></iframe>
	
</body>
  
</body>
<script></script>
</html>
