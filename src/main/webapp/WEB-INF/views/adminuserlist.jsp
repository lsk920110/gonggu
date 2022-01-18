<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		table,th,td {
			border : 1px solid black;
			border-collapse : collapse;
			padding : 5px;
		}
		.adminMenu{
			cursor: pointer;
			padding: 20px;
		}
		.adminMenu:hover{
			background-color: beige;
		}
		#adminMenuBar{
			text-align: center;
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
	<div id = "adminMenuBar">
        <img class="adminMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="adminOrderList">
        <img class="adminMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="adminInquiry">
        <img class="adminMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="adminRequire">
         <img class="adminMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="admingroupbuylist">
        <img style="background-color: beige" class="adminMenu" src="resources/img/전체회원정보.png" alt="전체회원정보" loc="adminuserlist">
        <img class="adminMenu" src="resources/img/상품등록.png" alt="상품등록" loc="groupbuywriteForm2">
    </div>
			
	<hr/>
	<br/>
	<br/>
	<br/>		
	
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>관리자여부</th>
		</tr>
		
		<c:forEach var="userinfo" items="${adminuserlist }">
			<tr>
				<td>${userinfo.user_id }</td>
				<td>${userinfo.user_name }</td>
				<td>${userinfo.user_gender }</td>
				<td>${userinfo.user_birth }</td>
				<td>${userinfo.user_email }</td>
				<td>${userinfo.user_phone }</td>
				<td>${userinfo.user_address }</td>
				<td>${userinfo.user_admin }</td>
			</tr>		
		</c:forEach>
				
	</table>
	
	<br/>
	<br/>
	<br/>

	<iframe src="footer"></iframe>
	
</body>
<script>
	$(".adminMenu").click(function(){
	    location.href=$(this).attr("loc");
	});


</script>
</html>