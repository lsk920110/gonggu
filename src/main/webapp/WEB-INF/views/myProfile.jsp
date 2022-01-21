<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		table,th,td{
			border-collapse : collapse ;
			padding : 5px;
		}
		.myMenu{
			cursor: pointer;
			padding: 20px;
		}
		.myMenu:hover{
			background-color: beige;
		}
		#myMenuBar{
			text-align: center;
		}		
		iframe{
			width: 100%;
			height: 210px;
			border-style: none;
		}
		 table{
	         margin-left: auto;
	         margin-right: auto;
   		 }				
	</style>
</head>
<body>
	<iframe src="header"></iframe>
  	<div id = "myMenuBar">
        <img class="myMenu" src="resources/img/my주문내역.png"  alt="my주문내역" loc="myorderList?currpage=1">
        <img class="myMenu" src="resources/img/my문의글.png" alt="my문의글" loc="myInquire?currpage=1">
        <img class="myMenu" src="resources/img/my요청글.png" alt="my요청글" loc="myRequire?currpage=1">
        <img class="myMenu" src="resources/img/my찜리스트.png" alt="my찜리스트" loc="myWish?currpage=1">
        <img style="background-color: beige" class="myMenu" src="resources/img/my회원정보수정.png" alt="my회원정보수정" loc="myProfile">
    </div>
<!-- 	<div>
		<a href="myorderList">내 주문 내역</a>
		<a href="myWish">찜리스트</a>
		<a href="myRequire">내가 쓴 요청글</a>
		<a href="myInquire">내가 쓴 문의글</a>
		<a href="myProfile">회원정보수정</a>
	</div> -->
	<h3 style="text-align:center;">회원정보수정</h3>

		<table>
			<tr>
				<th>아이디</th>
				<td>
				${myProfile.user_id}
				<input type="hidden" name="id" value="${myProfile.user_id}"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input class="pwconfirmSet" type="text" name="pw" value="${myProfile.user_pw}"/></td>
			</tr>
			<tr>
				<th rowspan="2">비밀번호확인</th>
				<td><input class="pwconfirmSet" type="text" name="pwConfirm"  value="${myProfile.user_pw}"/></td>
				
			</tr>
			<tr>
				
				<td id="confirm">
				
				</td>
				
			</tr>			
			
					
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"  value="${myProfile.user_name}"/></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="birth"  value="${myProfile.user_birth}"/></td>
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
				<td>
					<input type="text" name="email"   value="${myProfile.user_email}"/>
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
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="남" 
					<c:if test="${myProfile.user_gender == '남'}">checked</c:if>
					/>&nbsp;&nbsp;&nbsp;남&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여"
					<c:if test="${myProfile.user_gender == '여'}">checked</c:if>
					/>&nbsp;&nbsp;&nbsp;여

				</td>
			</tr>	
			<tr>
				<th colspan="2">
					<input type="button" id="submit" value="저장"/>
				</th>
			
			</tr>
		</table>
	

	
	
	
	<iframe src="footer"></iframe>

	
</body>
<script>

$(".myMenu").click(function(){
    location.href=$(this).attr("loc");
});


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
	
	
	
	
	
	$('input[class="pwconfirmSet"]').keyup(function(e){
		pw = $('input[name="pw"]').val();
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

	
	
	
	$('#indetify').click(function(){
		console.log('중복체크시작');
		var email = $('input[name="email"]').val();
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
	
	//
	$('#submit').click(function(){

		var $id = $('input[name="id"]');
		var $pw = $('input[name="pw"]');
		var $name = $('input[name="name"]');
		var $birth = $('input[name="birth"]');
		var $address = $('input[name="address"]');
		var $phone = $('input[name="phone"]');
		var $email = $('input[name="email"]');
		
		if(pw_check == 'F'){
			alert('비밀번호확인을 해주세요');
			$pw.focus();
		} else if($name.val() == ''){
			alert('이름을 일력 해주세요');
			$name.focus();			
		} else if($birth.val() == ''){
			alert('생일을 일력 해주세요');
			$name.focus();			
		} else if($address.val() == ''){
			alert('주소를 일력 해주세요');
			$name.focus();			
		} else if($phone.val() == ''){
			alert('핸드폰을 일력 해주세요');
			$name.focus();			
		} else if($email.val() == ''){
			alert('이메일을 일력 해주세요');
			$name.focus();			
		} else if(!certifinum_check){
			alert('메일 인증이나 하세요');
		} else{
			var userupdate = {};
			userupdate.user_id = $id.val();
			userupdate.user_pw = $pw.val();
			userupdate.user_name = $name.val();
			userupdate.user_birth = $birth.val();
			userupdate.user_address = $address.val();
			userupdate.user_phone = $phone.val();
			userupdate.user_email = $email.val();
			console.log(userupdate);
			
	 	
			$.ajax({
				type:'get',
				url :'profileupdate',
				data : userupdate,
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.success >0 ){
						alert('정보 수정이 완료되었습니다.');						
					}
				},
				error:function(e){
					
				}
			});
		 
		}
		
	
	});
	
	
	
	



</script>
</html>