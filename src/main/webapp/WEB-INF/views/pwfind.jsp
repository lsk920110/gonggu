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
	iframe{
		width: 100%;
		height: 210px;
		border-style: none;
	} 
	</style>
</head>
<body>
<iframe src="header"></iframe>
<h3>비밀번호 찾기</h3>
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type = "text" name = "user_id"/>
			</td>
		</tr>

		<tr>
			<th>이메일 주소로 임시비밀번호 발급</th>
			<td>
				<input type = "text" name = "user_email"/>
			</td>
		</tr>
			
			<tr>
				<th colspan="2">
				<input type = "button" id = "pwfind" value = "비밀번호찾기"/>
				<input type = "button" id = "pwfindcan" value = "취소" 
					onclick = "location.href='loginMain'"/>
				</th>
			</tr>
		</table>
<iframe src="footer"></iframe>
</body>
<script>
$('#pwfind').click(function() {

	var user_id = $('input[name="user_id"]').val();
	var user_email = $('input[name="user_email"]').val();
	console.log(user_id+'/'+user_email);
	
	$.ajax({
		type:'POST',
		url : 'findpw',
		data:{'user_id':user_id,
				'user_email':user_email},
		dataType : 'JSON',
		success : function (data) {
			if (data.success != '일치하는 정보가 없습니다.') {
				alert('고객님의 비밀번호는 '+ data.success+'입니다.');
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