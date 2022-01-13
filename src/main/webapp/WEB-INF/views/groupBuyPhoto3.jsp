<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>

	</style>
</head>
<body>
	
	<form action="groupbuyPhotowrite3" method="post" enctype="multipart/form-data">
		<h1>업로드 할 사진 선택</h1>
		<input type="file" name="photos" multiple="multiple" accept=".png, .jpg, .jpeg"/>
		
		<div id="image_container">
			<c:forEach var="phl" items="${photolist}" >
				${phl}
			
			</c:forEach>
		
		
		
		</div>

		<button id="uploadBtn">업로드</button>
	</form>
	
	


</body>
<script>
	console.log("${photolist}");

</script>

</html>