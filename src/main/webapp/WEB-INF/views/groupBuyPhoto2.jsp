<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		img {
			border : 1px solid black;
		}
		
		.thumb {
			border : 5px solid black;
		}
	</style>
</head>
<body>
	
	<form action="groupbuyPhotowrite2" method="post" enctype="multipart/form-data">
		<h1>업로드 할 사진 선택</h1>
		<input type="file" name="photos" multiple="multiple" accept=".png, .jpg, .jpeg"/>
		

		<button id="uploadBtn">업로드</button>
	</form>
	
	
		<div id="image_container">
			<c:forEach var="phl" items="${photolist}" >
				<img src="/photo/${phl}" class="${phl}" width="250px"/>
				<a href="#" class="${phl}" onclick="delPhoto()">삭제</a>
				<br/><br/>
			</c:forEach>
			<input type="button" onclick="toOpener()" value="엄마! 받어!!"/>
			
		</div>


</body>
<script>
	var clickPic = '';
	var remainPhoto = [];
	
	console.log("${photolist}");
	$('img').click(function(){
		console.log($(this).attr('class'));
		clickPic = $(this).attr('class');
		$('img').css({'border-width':'1px','border-color':'black'});
		$(this).css({'border-width':'5px','border-color':'orange'});
		console.log(clickPic);
		
	});
	
	
	function delPhoto(){
		console.log('삭제');
	};
	
	
	function toOpener(){	
		if(clickPic == ''){
			alert('대표사진을 지정해주세요!!');
		} else{
			var html = '';
			var remainPhoto_img = document.getElementsByTagName('img');
			for (var i = 0; i < remainPhoto_img.length; i++) {
				console.log(remainPhoto_img[i].className);
				remainPhoto.push(remainPhoto_img[i].className);
				
				
				if(remainPhoto_img[i].className == clickPic){
					html += '<h5 class="thumb">'+remainPhoto_img[i].className+'(대표사진)'+'</h5></br>';
					html += '<img class="thumb"src="/photo/'+remainPhoto_img[i].className+'""' +' width="250px"/>';
					html += '<input type="hidden" name="photo'+[i+1]+'" value="'+remainPhoto_img[i].className+'"/>';
				} else {
					html += '<h5>'+remainPhoto_img[i].className+'</h5></br>';
					html += '<img src="/photo/'+remainPhoto_img[i].className+'""' +' width="250px"/>';
					html += '<input type="hidden" name="photo'+[i+1]+'" value="'+remainPhoto_img[i].className+'"/>';
				}
				
	
				
				/* if(remainPhoto_img[i].className == clickPic){
					$('#fromChild',opener.document).html('<h1 style="color:red">'+remainPhoto_img[i].className+'</h1></br>');
				} else {
					$('#fromChild',opener.document).html('<h1>'+remainPhoto_img[i].className+'</h1></br>');
				} */
				
			}
			
			html +=	'<input type="hidden" name="photo_thum'+'" value="'+clickPic+'"/>'	;//누가 썸네일인가?
			html +=	'<input type="hidden" name="photo_cnt'+'" value="'+remainPhoto_img.length+'"/>'	;		//포토 갯수가 몇개인가?		
			
			$('#fromChild',opener.document).html(html);
			
			window.close();
		}
		
	};

	
</script>

</html>