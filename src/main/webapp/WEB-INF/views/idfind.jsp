<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px; 
	}	
	</style>
</head>
<body>
<!--  취소버튼 생성할 것 > 취소하면 로그인 화면으로 이동  -->
<h3>아이디 찾기</h3>
	<table>
		<tr>
			<th>이름</th>
			<td>
				<input type = "text" name = "user_name"/>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type = "text" name = "user_birth"/>
			</td>
		</tr>
		<tr>
			<th>이메일 주소</th>
			<td>
				<input type = "text" name = "user_email"/>
			</td>
		</tr>	
			<tr>
				<th colspan="2">
				<input type = "button" id = "idfind" value = "아이디찾기"/>
				</th>
			</tr>
		</table>
</body>
<script>
$('#idfind').click(function() {
	var user_name = $('input[name="user_name"]').val();
	var user_birth = $('input[name="user_birth"]').val();   
	var user_email = $('input[name="user_email"]').val();
	// console.log(user_name+'/'+user_birth +'/'+user_email);
	
	$.ajax({
		type:'post',
		url : 'idfind',
		data:{'user_name':user_name,'user_birth':user_birth, 'user_email':user_email},
		dataType : 'JSON',
		success : function (data) {
			if (data.success>0) {
				alert('고객님의 아이디는 '+ data.findidInfo+'입니다.');
				location.href = './loginMain';
			}else{
				alert('입력하신 정보가 일치 하지 않습니다. 다시 확인 후 입력바랍니다.');
			}
		},
		error : function (e) {
			console.log(e);
		}
	});
}); 	

</script>
</html>