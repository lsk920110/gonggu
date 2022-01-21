<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/common.css">
	<style>
	iframe{
		width: 100%;
		height: 210px;
		border-style: none;
	}   
		
	.table{
	   	margin-left: auto;
	   	margin-right: auto;
	   	min-width: 1296px;
	   	max-width:1166px;
  	}
	textarea {
	    width: 1200px;
	    height: 50px;
	    resize: none;
	}
	.icon{
	    width:70px;
	    height:20px;
        border-radius: 10px;
        color: white;
        font-size:14px;
        text-align:center;
	}
	.none{
		border-top:1px solid #ffffff;
		border-left:1px solid #ffffff;
		border-right:1px solid #ffffff;
	}
	.none2{
		border-left:1px solid #ffffff;
		border-right:1px solid #ffffff;
	}
	</style>
</head>
<body>
  	<iframe src="header"></iframe>
	
	
		
		
	<table class="table">
		<tr class="none">
			<c:choose>
			<c:when test="${addit.board_select eq '선정완료'}">
				<td class="none"><div class="icon" style="background-color: rgb(41, 166, 204)">${addit.board_select}</div></td>
			</c:when>
			<c:when test="${addit.board_select eq '선정실패'}">
				<td class="none"><div class="icon" style="background-color: rgb(204, 41, 41)">${addit.board_select}</div></td>
			</c:when>
			<c:when test="${addit.board_select eq '진행중'}">
				<td class="none"><div class="icon" style="background-color: rgb(53, 236, 181)">${addit.board_select}</div></td>
			</c:when>
			</c:choose>
		
		</tr>
		
		<tr>
			<th>글번호</th>
			<td>${info.board_no}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${info.board_title} <b>(${info.bHit})</b></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td id="user_id">${info.user_id}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${info.board_content}</td>
		</tr>
		
	
	
		<!--  
		<tr>
			<th>사진</th>
			<td>
				<c:forEach items="${photos}" var="photo">
					<img src="/photo/${photo.photo_newname}" width="250px"/><br/><br/>
				</c:forEach>				
			</td>
		</tr>
		
		<tr>
			<td>
			</td>
			<td>
				사진리스트<div id="area"></div>
				<c:forEach items="${photos}" var="downloadphoto">
				<a href="downloadphoto?board_no=${photo.board_no}">	${downloadphoto.photo_newname}</a>
				</c:forEach>
			</td>
		</tr>
		-->
	
		
		<tr>
			<th colspan="2">
				
				<input type="button" onclick="location.href='./RequestBoardlist?currpage=1'" value="목록"/>
				
				<input type="button" class="identify" onclick="location.href='./requpdateForm?board_no=${info.board_no}'" value="수정"/>
				<input type="button" class="identify" onclick="exposure()" value="삭제"/>			
			</th>
		</tr>
		
		
		
	</table>



		<table class="table">
			<thead>
				<tr>
					<td colspan="3">
						<textarea name="reply_comment"></textarea>
						<input type="button" onclick="reply_write()" value="저장"/>
						
						<input type="hidden" name="user_id" value="${sessionScope.loginId}"/>
						<input type="hidden" name="board_no" value="${groupbuydetail.board_no}"/>	
					</td>
				</tr>
			</thead>
 			<tbody id="reply">			
			</tbody>
		</table>	
		

   <iframe src="footer"></iframe>

</body>
<script>
	
	console.log("${sessionScope.loginId}");
	console.log($('#user_id').html());
	
	if("${sessionScope.loginId}" != $('#user_id').html()) {
		$('.identify[type="button"]').attr('type','hidden');
	
	};
	
	
	
	function exposure(){
		var yn = confirm("정말 이 글을 삭제 하시겠습니까?");
		
		if(yn){
			location.href='./RequestBoardexposure?board_no=${info.board_no}';
		}
		
	}
	
	var files = [];
	
	<c:forEach items="${photos}" var="photo">
	files.push("${photo}");
	</c:forEach>
	
	console.log(files);
	
	if(files.length>0){//업로드된 파일이 있을 경우
		
		var content="";
		
		for(var i=0; i<files.length;i++){			
			console.log("fileName : "+files[i]);//풀 파일명
			//확장자만 추출(마지막에 있는 . 의 취를 찾아 substring 으로 잘라낸다.)
			var ext = files[i].substring(files[i].lastIndexOf(".")+1);
			console.log("ext : "+ext);
			
			content += '<a href="/photo/'+files[i]+'"/>'+files[i]+' 다운로드 <a>';
			content += '<br/>';			
		}
		
		$("#area").html(content);
		
				
	}else{		//업로드 된 파일이 없을 경우
		$("#area").html("<p>업로드 된 파일이 없습니다.</p>");
	}
	
	
	
	/* reply 기능 */
	


	$.ajax({
		type : 'GET',
		url : 'reply_call',
		data : {'board_no':"${info.board_no}"},
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			//ajax 는 페이지를 새로고치하지 않기 때문에, 적용된 내용을 확인하기 위해서는 리스트를 다시 그려야 한다.
			//listCall();
			listDraw(data.list);
		},
		error : function(e){
			console.log(e);
		}
	});


	function listDraw(list){
		var content = '';

		//list.forEach(function(item,idx)) 으로 해도 된다.
		for(var i = 0; i<list.length; i++){
			//console.log(list[i]);
			content += '<tr>';
			content += '<td style="width:200px" class="none2">'+list[i].user_id+'</td>';
			content += '<td style="width:500px" class="none2">'+list[i].reply_comment+'</td>';
			content += '<td style="width:200px" class="none2">'+list[i].reply_date+'</td>';		
			content += '</tr>';
			
		}
		
		$("#reply").empty();
		$("#reply").append(content);
	}

	
	function reply_write(){

		var loginId = "${sessionScope.loginId}";
	
		var $reply_comment = $('textarea[name="reply_comment"]');
		var $user_id = $('input[name="user_id"]');
		var $board_no = $('input[name="board_no"]');
			
		var reply = {}
		reply.reply_comment = $reply_comment.val();			
		reply.user_id = $user_id.val();
		reply.board_no = $board_no.val();
		reply.board_name = '요청게시판';
		console.log(reply);
			$.ajax({
				type : 'GET',
				url : 'reply_write',
				data : reply,
				dataType : 'JSON',
				success : function(data){
					
					if(data.msg == 'fail'){
						alert('로그인 후 이용 가능한 서비스입니다.');
					} else {
						console.log(data.msg);
						//ajax 는 페이지를 새로고치하지 않기 때문에, 적용된 내용을 확인하기 위해서는 리스트를 다시 그려야 한다.
						//listCall();
						listDraw(data.list);
						$('textarea[name="reply_comment"]').val('');
						alert('댓글이 정상적으로 등록되었습니다.');
					}
					
				},
				error : function(e){
					console.log(e);
				}
			});		
	}


</script>
</html>