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
	.alllogin{
		width: 700px;
		height: 300px;
		text-align: center;
		top: 20px;	
		margin : auto;
		}			
	.login {
		width: 400px;
		height: 200px;
		top: 20px;	
		margin : auto;
		left : 300px;
		}		
	</style>
</head>
<body>
<iframe src="header"></iframe>
<div class = "alllogin">
<div class = "login">
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
	</div>
</div>
<iframe src="footer"></iframe>
</body>
<script>
var certifinum = '';

$('#pwfind').click(function() {

	var user_id = $('input[name="user_id"]').val();
	var user_email = $('input[name="user_email"]').val();
	console.log(user_id+'/'+user_email);
	
	certifinum = Math.floor(Math.random()*1000000);
    var user_pw = certifinum;
	
	
	$.ajax({
		type:'POST',
		url : 'temppw',
		data:{'user_id':user_id,
				'user_email':user_email,
				'user_pw':user_pw},
		dataType : 'JSON',
		success : function (data) {
			if (data.success == '1') {
				var win = window.open('emailPage','최신식 구글 메일','width=1000,height=600');
				
				alert('이메일로 인증번호를 발송했습니다.');
				
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