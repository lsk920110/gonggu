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
				<input type = "button" id = "findpw" value = "비밀번호찾기"/>
				</th>
			</tr>
		</table>
</body>
<script>
$('#findpw').click(function() {
	var user_id = $('#user_id').val();
	var user_email = $('#user_email').val();	
	console.log(user_id+'/'+user_email);

	$.ajax({
		type:'POST',
		url : 'findpw',
		data:{'user_id':user_id,'user_email':user_email},
		dataType : 'JSON',
		success : function (data) {
			if (data.success>0) {
				alert('고객님의 비밀번호는 '+ data.loginId+'입니다.');
				/*위 코딩문 수정 예정 */
				location.href = './login'; /*아이디 찾은 후 로그인 화면으로 이동*/
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