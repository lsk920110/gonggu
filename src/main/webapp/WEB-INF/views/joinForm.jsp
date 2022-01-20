<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src = "https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	iframe{
		width: 100%;
			height: 210px;
			border-style: none;
	} 
	.alllogin{
		width: 750px;
		height: 400px;
		text-align: center;
		top: 20px;	
		margin : auto;
		}			
	.login {
		width: 400px;
		height: 200px;
		top: 10px;	
		margin : auto;
		left : 300px;
		}			
	</style>
</head>
<body>
<iframe src="header"></iframe>
<div class = "alllogin">
<div class = "login">
<h2>회원가입</h2>
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type = "text" name = "user_id"/>
				<input type = "button" id = "overlay" value = "중복확인"/>
			</td>
		</tr>
		<!-- 비밀번호관련 시작 -->
		<tr>
			<th>비밀번호</th>
			<td>
				<input class="pwconfirmSet"  type = "text" name = "user_pw"/>
			</td>
		</tr>
		<tr>
			<th rowspan="2">비밀번호확인</th>
			<td><input class="pwconfirmSet" type="text" name="pwConfirm"  value=""/></td>
		</tr>
		<tr>		
			<td id="confirm">		
			</td>
		</tr>
		<!-- 비밀번호관련 끝 -->
		<tr>		
			<th>이름</th>
			<td>
				<input type = "text" name = "user_name"/>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type = "radio" name = "user_gender" value = "남" checked/>남  &nbsp;&nbsp;&nbsp;&nbsp; 
				<input type = "radio" name = "user_gender" value = "여"/>여				
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type = "text" name = "user_birth"/>
			</br>	
			예시)1900-00-00
			</td>
		</tr>
		<tr>
			<th>이메일주소</th>
			<td>
				<input type = "text" name = "user_email"/>
				<input type="button" id="indetify" value="인증"/>
			</td>
		</tr>
		<tr>
				<th>
				</th>
				<td>
					<input type="hidden" id="emailIdnum" value=""/>
					<input type="hidden" id="emailIdbtn" value="확인"/>
				
				</td>
				
			
			</tr>
		<tr>
			<th>휴대폰번호</th>
			<td>
				<input type = "text" name = "user_phone"/>
				</br>
				예시)010-1111-2222
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type = "text" name = "user_address"/>
			</td>
		</tr>

		
		<!-- <tr>
		 <th>약관</th>
			<td>
				<input type = "text"/>
				</br>
				<input type = "radio" name = "terms" value = "agree"/>동의
				<input type = "radio" name = "terms" value = "disagree"/>비동의
			</td>
		</tr> -->
		<tr>
			<th colspan = "4">
			<input type = "button" id = "regist" value = "가입"/>
			<input type= "button" id= "cansel" value = "취소" onclick="location.href='loginMain'"/>
			</th>
		</tr>
	</table>
</div>
</div>	
<iframe src="footer"></iframe>
</body>
<script>

var pw = '';
var pwConfirm = '';
var pw_check = 'T';
var certifinum = null;
var certifinum_check = false;

random();


// var randomNum = 0;
function random(){
    // clearInterval(time);
    //var cnt = 11;
    
    console.log('랜덤창!!');
    randomNum = Math.floor(Math.random()*1000000);
    certifinum = randomNum;
};

$('#indetify').click(function(){
	console.log('중복체크시작');
	var email = $('input[name="user_email"]').val();
	console.log('check email : ',email);
	
	$.ajax({
		type:'get',
		url :'overlayemail',
		data:{'email':email},
		dataType:'json',
		success:function(data){
			console.log(data);
						
			
			if(data.emailTF){
				alert('이미 사용중인 아이디 입니다.');

			} else{
				alert('메일로 인증번호를 전송했습니다.');
				$('#emailIdnum').attr('type','text');
				$('#emailIdbtn').attr('type','button');
				random();
				
				
				win = window.open('emailPage','최신식 구글 메일','width=1000,height=600');
			}

		},
		error:function(e){//에러시 서버에서보낸 에러관련 매개변수이다.
			console.log('에러...');
			console.log(e);	
		}
	});		
});









$('#emailIdbtn').click(function(){
	$('#emailIdnum').val();
	if($('#emailIdnum').val() == certifinum){
		certifinum_check = true;
		alert('이메일 인증 성공!');
		$('#emailIdnum').attr('type','hidden');
		$('#emailIdbtn').attr('type','hidden');

	} else {
		certifinum_check = false;
		alert('인증번호좀 똑바로 입력해주세요');
	}		
});

//이메일 값이 한번이라도 바뀌면, 체크를 false로
$('input[name="email"]').keyup(function(e){
	certifinum_check = false;
});	

var check = false;

$("#regist").click(function() {
	console.log('click');	
	if (check) {
		console.log('회원가입 시작');
		var $user_id = $('input[name="user_id"]');
		var $user_pw = $('input[name="user_pw"]');
		var $user_name = $('input[name="user_name"]');
		var $user_gender = $('input[name="user_gender"]:checked');
		var $user_birth = $('input[name="user_birth"]');		
		var $user_email = $('input[name="user_email"]');
		var $user_phone = $('input[name="user_phone"]');
		var $user_address = $('input[name="user_address"]');
		var $user_admin = $('input[name="user_admin"]');
		
		console.log($user_gender);
		
		if($user_id.val() == '') {
			alert('아이디를 입력 해주세요');
			$user_id.focus();
		}else if ($user_pw.val() == '') {
			alert('비밀번호를 입력 해주세요');
			$user_pw.focus();
		} else if (pw_check == 'F'){
			alert('비밀번호확인을 해주세요');
			$user_pw.focus();
		} else if ($user_name.val() == '') {
			alert('이름을 입력 해주세요');
			$user_name.focus();
		}else if ($user_gender.val() == '') {
			alert('성별을 선택 하세요');
			$user_gender.focus();	
		}else if ($user_birth.val() == '') {
			alert('생년월일을 입력하세요');
			$user_birth.focus();
		}else if ($user_email.val() == '') {
			alert('이메일을 입력하세요');
			$user_email.focus();			
		}else if ($user_phone.val() == '') {
			alert('휴대폰 번호를 입력 하세요');
			$user_phone.focus();
		}else if ($user_address.val() == '') {
			user_address('주소를 입력 하세요');
			$gender.focus();
		}else if ($user_admin.val() == '') {
			alert('관리자 정보를 입력하세요');
			$user_admin.focus();
		} else if(!certifinum_check){
			alert('메일 인증이나 하세요');
		} else{
			console.log('서버 전송 시작');
			
			var param = {'user_id':$user_id.val()};
			param.user_pw = $user_pw.val();
			param['user_name'] = $user_name.val();
			param.user_gender = $user_gender.val(); 
			param.user_birth = $user_birth.val(); 
			param.user_email = $user_email.val(); 		
			param.user_phone = $user_phone.val(); 	
			param.user_address = $user_address.val(); 	
			param.user_admin = $user_admin.val(); 	
			console.log(param);
			
			
			$.ajax({
				type : 'POST',
				url : 'join',
				data : param,
				dataType : 'JSON',
				success : function (data) {
					console.log(data);
					if (data.success == 1) {
						alert('회원가입을 축하 드립니다.');
						location.href = './loginMain';
					}else {
						alert('회원 가입에 실패 했습니다. 다시 시도해주세요');
		
					}
				},
				error : function (e) {
					console.log(e);
					alert('서버에 문제가 발생했습니다. 고객센터에 문의 해주세요');
				}			
			});
		}

	}else{
		alert('아이디 중복 체크를 해주세요!');
		$('input[name="user_id"]').focus();
	}		
});

$('#overlay').click(function() {
	console.log('중복 체크 시작!!');  
			
	var user_id = $('input[name="user_id"]').val();		
	console.log('check id :',user_id); 
	
	$.ajax({ 
		type : 'get',  
		url : 'overlay',
		data: {'user_id':user_id}, 
		dataType : 'json', 
		success : function (data) {
			console.log(data); 
			
			if (data.overlay) {
				alert('이미 사용중인 아이디 입니다.');
				$('input[name="user_id"]').val('');
			}else{
				alert('사용 가능한 아이디 입니다.');
				check = true;
			}
		},
		error : function (e) {
			console.log(e);
		}		
	});		
});

$('input[class="pwconfirmSet"]').keyup(function(e){
	pw = $('input[name="user_pw"]').val();
	pwConfirm = $('input[name="pwConfirm"]').val();
	

	if(pw==pwConfirm){
		$('#confirm').html('비밀번호가 일치합니다.');
		$('#confirm').css({'color':'blue','font-size':'5px'});
		pw_check = 'T';
	} else {
		$('#confirm').html('비밀번호가 일치하지 않습니다..')
		$('#confirm').css({'color':'red','font-size':'5px'});
		pw_check = 'F';
	}
});

</script>
</html>
