<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 상품등록페이지</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		table,th,td {
			padding : 5px;
		}
		.adminMenu{
			cursor: pointer;
			padding: 20px;
		}
		.adminMenu:hover{
			background-color: beige;
		}
		#adminMenuBar{
			text-align: center;
		}
		iframe{
			width: 100%;
			height: 210px;
			border-style: none;
		}
		textarea {
		    width: 1100px;
		    height: 370px;
		    resize: none;
		}
		table{
		   	margin-left: auto;
		   	margin-right: auto;
		   	border: none;
		   	width:1124px;
   		}

	 	.category{
	 		width:150px;
	 		height:50px;
	 	}
	 	.title{
	 		width: 946px;
	 		height:50px;
	 	}
	 	.board{
	 		background-color: rgb(233, 233, 233);
	 		width:1274px;
	 		margin:0 auto;
	 	}
	 	.box{
	 		height: 40px;
	 	}
	 	.btn{
	 		background-color: rgb(41, 166, 204);
			color: white;
	 	}
	</style>
</head>
<body>
	<iframe src="header"></iframe>
	<div id = "adminMenuBar">
        <img class="adminMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="adminOrderList?currpage=1">
        <img class="adminMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="adminInquiry?currpage=1">
        <img class="adminMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="adminRequire?currpage=1">
         <img class="adminMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="admingroupbuylist?currpage=1">
        <img class="adminMenu" src="resources/img/전체회원정보.png" alt="전체회원정보" loc="adminuserlist??currpage=1">
        <img style="background-color: beige"  class="adminMenu" src="resources/img/상품등록.png" alt="상품등록" loc="groupbuywriteForm2">
    </div>

	<form action="groupbuywrite2" method="post" enctype="multipart/form-data">
		<div class="board">
			<table>    
				<tr>
					<th>
						<select class="category" name="product_category_name">
		                    <option value="" disabled selected>카테고리 선택</option>
		                    <option value="생활/건강">생활/건강</option>
		                    <option value="스포츠/레저">스포츠/레저</option>
		                    <option value="가구/인테리어">가구/인테리어</option>
		                    <option value="디지털/가전">디지털/가전</option>
		                    <option value="패션">패션</option>
		                    <option value="화장품/미용">화장품/미용</option>
		                    <option value="출산/육아">출산/육아</option>
		                    <option value="식품">식품</option>
		                    <option value="여가/생활 편의">여가/생활 편의</option>
		                    <option value="기타">기타</option>
	            		</select>
	             	</th>
	             	<!-- 제목 -->
					<td><input class="title" type="text" placeholder="제목을 입력하세요." name="board_title"/></td>
				</tr>
				
				<tr>
					<th>마감일자</th>
					<td><input class="box" type="date" name="groupbuy_due_date"></td>
				</tr>
				<tr>
					<th>목표수량</th>
					<td><input class="box" type="text" name="groupbuy_target"/>개</td>
				</tr>
				<tr>
					<th>최대수량</th>
					<td><input class="box" type="text" name="groupbuy_max"/>개</td>
				</tr>
	
				<tr>
					<th>금액</th>
					<td><input class="box" type="text" name="groupbuy_unitprice"/>원</td>
				</tr>
			</table>
		</div>
		
		<br/>
		
		
		<div class="board">
				<table>
					<tr>
						<th><div style="float:left">내용</div></th>
					</tr>
					<tr>
						<th><textarea placeholder="내용을 입력하세요 ." name="board_content"></textarea></th>
					</tr>
				</table>
		</div>
		
		<br/>
		
		<div class="board">
			<table>
				<tr>
					<th><div style="float:left">사진</div></th>
				</tr>
				<tr>
					<th><div style="float:left;"id="fromChild"></div></th>
				</tr>
				
			</table>
		</div>
			
		<div style="text-align: center;">	
			<input class="btn" type="button" id="open" value="사진추가" />
			
			<input class="btn" type="button" id="submit" value="작성완료"/>
			
			<input type="button" onclick="location.href='./adminOrderList?currpage=1'" value="취소" />
			<button>저장</button>
		</div>
	</form>
	
	<iframe src="footer"></iframe>
	
	
</body>
<script>
	

	
	var photocnt = 0;
	
	$('button').hide();
	
	$('#open').click(function(){
		   win = window.open('groupBuyPhoto2','','width=700,height=700'); //주소값,창이름,옵션
	
		});
		
		
	$(".adminMenu").click(function(){
	    location.href=$(this).attr("loc");
	});
	
	
	$('#submit').click(function(){
		if($('select[name="product_category_name"]').val() == null){
			alert('카테고리를 입력 해주세요');
		}
		else if($('input[name="board_title"]').val() == ''){
			alert('제목을 입력하세요');
		}
		else if($('input[name="groupbuy_due_date"]').val() == ''){
			alert('날짜를 입력하세요');
		}
		else if($('input[name="groupbuy_target"]').val() == ''){
			alert('목표수량을 입력하세요');
		}
		else if($('input[name="groupbuy_max"]').val() == ''){
			alert('최대수량을 입력하세요');
		}
		else if($('input[name="groupbuy_unitprice"]').val() == ''){
			alert('금액을 입력하세요');
		}
		else if($('textarea').val()== ''){
			alert('내용을 입력하세요');
		}
		else if(photocnt == 0){
			alert('사진을 최소 1장 이상 업로드해주세요');
		}
		
		else{
			alert('작성이 완료되었습니다.');
			document.getElementsByTagName('button')[0].click();
			
		}
	});







</script>
</html>