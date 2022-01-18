<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/common.css">
	<style>
			iframe{
			width: 100%;
			height: 210px;
			border-style: none;
		}  
	
	</style>
</head>
<body>
  	<iframe src="header"></iframe>

<table>
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
		<td>${info.user_id}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${info.board_content}</td>
	</tr>
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
	<tr>
		<th colspan="2">
			<input type="button" onclick="location.href='./inquireBoardList'" value="리스트"/>
			<input type="button" onclick="location.href='./inqupdateForm?board_no=${info.board_no}'" value="수정"/>
			<input type="button" onclick="exposure()" value="삭제"/>			
		</th>
	</tr>
</table>
  	<iframe src="footer"></iframe>

</body>
<script>
function exposure(){
	var yn = confirm("정말 이 글을 삭제 하시겠습니까?");
	
	if(yn){
		location.href='./inquireBoardexposure?board_no=${info.board_no}';
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
</script>
</html>