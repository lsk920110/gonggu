<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src = "https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style></style>
</head>
<body>
<h2>로그인</h2>
	<table>
		<tr>
			<th>ID</th>
			<td><input type = "text" id = "user_id" /></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type = "password" id = "user_pw" /></td>
		</tr>
		<tr>
			<th colspan = "2">
			<input type = "button" id = "login" value = "LOGIN"/>
			<input type = "button" id= "joinForm" value = "회원가입" onclick = "location.href='joinForm'"/>
			</br>
			<input type = "button" id= "infind" value = "아이디 찾기" onclick = "location.href='idfind'"/>
			<input type = "button" id= "pwfind" value = "비밀번호 찾기" onclick = "location.href='pwfind'"/>
			</th>
		</tr>
	</table>
</body>
<script>
$('#login').click(function() {
	var user_id = $('#user_id').val();
	var user_pw = $('#user_pw').val();	
	console.log(user_id+'/'+user_pw);

	$.ajax({
		type:'POST',
		url : 'login',
		data:{'user_id':user_id,'user_pw':user_pw},
		dataType : 'JSON',
		success : function (data) {
			if (data.success>0) {
				alert(data.loginId+'님 반갑습니다.');
				location.href = './list'; /*메인페이지 명으로 수정 예정*/
			}else{
				alert('아이디 또는 패스워드가 일치 하지 않습니다.');
			}
		},
		error : function (e) {
			console.log(e);
		}
	});
}); 	

</script>
</html>