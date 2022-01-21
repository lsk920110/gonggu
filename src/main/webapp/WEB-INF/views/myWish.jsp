<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
   	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
	<script src="resources/js/jquery.twbsPagination.js"></script>	
	<script src="resources/js/.bootstrap.min.js"></script>
	<link rel="stylesheet" href="resources/bootstrap.min.css"/>	
	
	<style>
	table,th,td{
		border : 1px solid black;
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
	
	#category{
		text-align : center;
	}
	.category{
		cursor: pointer;
		
	}
	#board1{
		text-align : center;
		width: 20%;
		height: 350px;
		display: inline-block;
		
	}
	
	#board2{
		margin-top:20px;
		margin-bottom:20px;
		width: 100%;
		text-align : center;
		height: 170px;
	}
	
	#all{
		text-align : center;
		width: auto;
		height: auto;
	}
	#boardimg{
		width: 255px;
		height: 300px;
	}
	#boardtitle{
		font-size: 18px;
		text-decoration:none; /*<a> 태그의 기본 꾸밈 효과(밑줄 등)을 없애기*/
		color: black; 
		font-weight : bold;
	}
	
	.heart{
		width: 30px;
		height: 30px;
		cursor: pointer;
		margin-bottom: 10px;
		align: top;
	}

	
	.icon{
	    width:70px;
	    height:20px;
        border-radius: 10px;
        padding-left: 1px;
        padding-top: 1px;
        color: white;
        position: relative;
    	left: 75px;
    	margin-top:25px;
    	margin-bottom: 10px;
	}
	
	</style>
</head>
<body>
	<iframe src="header"></iframe>
	<div id = "myMenuBar">
        <img class="myMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="myorderList?currpage=1">
        <img class="myMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="myInquire?currpage=1">
        <img class="myMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="myRequire?currpage=1">
        <img style="background-color: beige" class="myMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="myWish?currpage=1">
        <img class="myMenu" src="resources/img/전체회원정보.png" alt="전체회원정보" loc="myProfile">
    </div>	
    <div id="all">   
	    <c:set var="wish_list" value="${wishlist}"/>
	        
	    <div id="board3">
		<c:forEach items="${groupBuyList}" var="list">

			<div id="board1">	
				<c:set var="board__no" value="${list.board_no}"/>
	
						
				<c:choose>
					<c:when test="${list.groupbuy_state eq '공구완료'}">
						<div class="icon" style="background-color: rgb(41, 166, 204)">${list.groupbuy_state}</div>
					</c:when>
					<c:when test="${list.groupbuy_state eq '공구실패'}">
						<div class="icon" style="background-color: rgb(204, 41, 41)">${list.groupbuy_state}</div>
					</c:when>
					<c:when test="${list.groupbuy_state eq '모집중'}">
						<div class="icon" style="background-color: rgb(53, 236, 181)">${list.groupbuy_state}</div>
					</c:when>
				</c:choose>
							
						
				<c:choose>
					<c:when test="${list.groupbuy_state eq '공구완료'}">
						<a href="groupbuydetail?board_no=${list.board_no}">
							<img style="filter:grayscale(100%)" id="boardimg" src="/photo/${list.photo_newname}" alt="상품이미지"/> 
						</a><br/>
					</c:when>
					<c:when test="${list.groupbuy_state eq '공구실패'}">
						<a href="groupbuydetail?board_no=${list.board_no}">
							<img style="filter:grayscale(100%)" id="boardimg" src="/photo/${list.photo_newname}" alt="상품이미지"/> 
						</a><br/>
					</c:when>
					<c:otherwise> 
						<a href="groupbuydetail?board_no=${list.board_no}">
							<img id="boardimg" src="/photo/${list.photo_newname}" alt="상품이미지"/> 
						</a><br/>
					</c:otherwise> 
				</c:choose>  
				
			
				<div id="board2">
					<a id="boardtitle" href="groupbuydetail?board_no=${list.board_no}">${list.board_title}</a><br/>
				   
					
					
				    <input type="hidden" value="${list.board_no}"/>
				    
					<c:choose>
						<c:when test="${fn:contains(wish_list, board__no)}">
							<img class="heart" src="resources/img/하트.png" alt="찜 하트">
						</c:when>
						
						<c:otherwise> 
							<img class="heart" src="resources/img/빈하트.png" alt="찜 빈하트">
						</c:otherwise> 
					</c:choose>  
					

						<p class="price">${list.groupbuy_unitprice}<p>	

					
					
					<c:if test="${list.sum eq null}">
						<progress value="0" max="${list.groupbuy_target}"></progress>
						<p style="font-size:13px">신청수량:0개 / 목표수량:${list.groupbuy_target}개 </p>		
					</c:if>
					
					<c:if test="${list.sum ne null}">
						<progress value="${list.sum}" max="${list.groupbuy_target}"></progress>
						<p style="font-size:13px">신청수량:${list.sum}개 / 목표수량:${list.groupbuy_target}개 </p>		
					</c:if>	
				</div>	
			</div>

		</c:forEach>
		</div>
	</div> 
	
	<!-- 페이징 영역 -->

			<div class="container">
				<nav aria-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>

	<!-- 페이징 영역 -->	

	<input type="button" onclick="asd()"/>
	<iframe src="footer"></iframe>

	
</body>
<script>
$(".myMenu").click(function(){
    location.href=$(this).attr("loc");
});
var price = document.getElementsByClassName('price');

for (var i = 0; i < price.length; i++) {
	console.log(price[i].innerText);
	var a = document.getElementsByClassName('price')[i].innerText;
	var b = a.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	
	
	document.getElementsByClassName('price')[i].innerHTML = "가격  " + b + "원";


	
};





//하트 클릭 시 찜 추가/삭제
$('.heart').click(function(){

if('${loginId}' == ''){ //비회원이면 로그인 페이지로 이동
	location.href='./loginMain';
}else{
			
	var loginId = '${loginId}';
	var board_no = $(this).prev().val();
	
	console.log("로그인 아이디 : "+loginId);
	console.log("게시글 번호 : "+board_no);
	
	var param = {'loginId':loginId,'board_no':board_no};
	console.log(param);
	
	
	var thissrc = $(this).attr('src');
	
	if(thissrc == 'resources/img/빈하트.png'){
		$(this).attr('src','resources/img/하트.png');
	}else{
		$(this).attr('src','resources/img/빈하트.png');
	}
	
	
	
	$.ajax({
		type:'POST',
		url:'wishListChange',
		data: param,
		dataType:'JSON',
		success:function(data){
			if(data.success == 1){
				console.log('찜 추가');
				
			}
			if(data.row2 == 1){
				console.log('찜 삭제');
			}
		},	
		error:function(e){
			console.log(e);
			alert('서버에 문제가 발생했습니다.');
		}
	}); 
   

}
});









//카테고리 조회 클릭 시  
$('.category').click(function(){

	var param = $(this).attr('alt');
console.log(param);
	location.href='./groupBuyList?category='+param+"&currpage="+1;

});

/*
//가격  , 처리
window.onload = function () {


function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
}
*/
var startpage = "${nowpage}";
startpage = startpage*1;
var totalpage = "${pages}";
totalpage = (totalpage*1);
console.log(startpage);
console.log(totalpage);
/* 페이징에 관한 곳 */
$('#pagination').twbsPagination({
	startPage : startpage,
	totalPages : totalpage,
	visiblePages : 5,
	onPageClick:function(evt,page){
		console.log(evt);
		console.log(page);
		if("${nowpage}" != page) {
			location.href="./myWish?&currpage="+page;			
		}
	}

});	

</script>
</html>