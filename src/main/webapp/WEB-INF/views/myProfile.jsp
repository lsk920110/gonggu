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
		border-collapse : collapse ;
		padding : 5px;
	}
	
	</style>
</head>
<body>
	<iframe>header</iframe>
	<div>
		<a href="myorderList">내 주문 내역</a>
		<a href="myWish">찜리스트</a>
		<a href="myRequire">내가 쓴 요청글</a>
		<a href="myInquire">내가 쓴 문의글</a>
		<a href="myProfile">회원정보수정</a>
	</div>
	<h3>회원정보수정</h3>
	<form>
		<table>
			<tr>
				<th>아이디</th>
				<td>${myProfile.user_id}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pw" value="${myProfile.user_pw}"/></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="text" name="pwConfirm"  value="${myProfile.user_pw}"/></td>
			</tr>		
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"  value="${myProfile.user_name}"/></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="name"  value="${myProfile.user_birth}"/></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address"   value="${myProfile.user_address}"/></td>
			</tr>		
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" name="phone"   value="${myProfile.user_phone}"/></td>
			</tr>
			<tr>
				<th>이메일주소</th>
				<td><input type="text" name="email"   value="${myProfile.user_email}"/><input type="button" value="인증"/></td>
				
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="남"/>&nbsp;&nbsp;&nbsp;남&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여"/>&nbsp;&nbsp;&nbsp;여
				
				
				</td>
			</tr>	
			<tr>
				<th colspan="2">
					<button>저장</button>
					<input type="button" value="취소" onclick="location.href='./mypage'"/>
				</th>
			
			</tr>
		</table>
	
	</form>
	
	
	
	<iframe>footer</iframe>

	
</body>
<script>





</script>
</html>