<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>공동구매게시판 상세보기</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	iframe{
		width: 100%;
		height: 210px;
		border-style: none;
	} 
	.category{
		cursor: pointer;
		
	}
	#board1{
		width: 255px;
		display: inline-block;
	}
	
	#boardimg{
		width: 255px;
		height: 300px;
	}
	#boardtitle{
		font-size: 20px;
		text-decoration:none; 
		color: black; 
		font-weight : bold;
		text-align: left;
	}
	
	#heart{
		width: 30px;
		height: 30px;
		
	}
	
	#thumb {
		position : static;
		width: 400px;
		height: 400px;
		margin-left:100px;
	}
	
	#buy {
		position:relative;
		width: 550px;
		height: 550px;	
		top : -400px;
		left : 550px;
	}
	
	.pic {
		width : 400px;
		height : 400px;

	}
	
	.icon{
	    width:70px;
	    height:20px;
        border-radius: 10px;
        padding-left: 15px;
        padding-top: 1px;
        color: white;
    	margin-bottom: 10px;
	}
	
	.buy1{
		float:left;
	}
	#all{
		width:1200px;
		margin:0 auto;
	}
	.btn{
		text-
	}
	.contentline{
	
	}
	</style>
</head>
<body>
	<iframe src="header"></iframe>
	
	
	<div id="all">
	    <div>
	        <img class="category" src="resources/img/생활건강.png"  alt="생활/건강">
	        <img class="category" src="resources/img/스포츠레저.png" alt="스포츠/레저">
	        <img class="category" src="resources/img/가구인테리어.png" alt="가구/인테리어">
	        <img class="category" src="resources/img/디지털가전.png" alt="디지털/가전">
	        <img class="category" src="resources/img/패션.png" alt="패션">
	        <img class="category" src="resources/img/화장품미용.png" alt="화장품/미용">
	        <img class="category" src="resources/img/출산육아.png" alt="출산/육아">
	        <img class="category" src="resources/img/식품.png" alt="식품">
	        <img class="category" src="resources/img/여가생활.png" alt="여가/생활">
	        <img class="category" src="resources/img/기타.png" alt="기타">
		</div>
	    <h5 id="boardtitle">게시글 NO. ${groupbuydetail.board_no}</h5>
	    <hr/>
	    
	    <div style="margin-top:10px">
	    <div style="width: 400px; height: 400px;">
		    <div id="thumb">
		    	<c:forEach var="photo" items="${photolist}">
			    	<c:choose>
			    		<c:when test="${photo.photo_thum eq 'Y'}">
							<img src="/photo/${photo.photo_newname }" class="pic" style="position : absolute"/>    		
			    		</c:when>
			    	</c:choose>	    	
		    	</c:forEach>
		    </div>
		    <div id="buy">
					<c:choose>
						<c:when test="${groupbuydetail.groupbuy_state eq '공구완료'}">
							<div class="icon" style="background-color: rgb(41, 166, 204)">${groupbuydetail.groupbuy_state}</div>
						</c:when>
						<c:when test="${groupbuydetail.groupbuy_state eq '공구실패'}">
							<div class="icon" style="background-color: rgb(204, 41, 41)">${groupbuydetail.groupbuy_state}</div>
						</c:when>
						<c:when test="${groupbuydetail.groupbuy_state eq '모집중'}">
							<div class="icon" style="background-color: rgb(53, 236, 181)">${groupbuydetail.groupbuy_state}</div>
						</c:when>
					</c:choose>				

			    <div style="float:left;">${groupbuydetail.product_category_name}</div>
				<div style="float:right; display:inline-block;">조회수 : ${groupbuydetail.board_bHit}</div>
	
		    <br/>
		    <p style="font-size: 30px; font-weight : bold">${groupbuydetail.board_title }</p>
		    
			<span id="price">${groupbuydetail.groupbuy_unitprice } 원</span>
		    <br/>
		    ${groupbuydetail.board_date } ~ ${groupbuydetail.groupbuy_due_date }
		    <br/>
		    <br/>
				<progress style="font-size:40px" value="${orderquansum }" max="${groupbuydetail.groupbuy_target}"></progress>
				<p style="font-size:20px; padding-left:50px">신청수량:${orderquansum }개 / 목표수량:${groupbuydetail.groupbuy_target}개 </p>		
		    <br/>
		
		
		
		<div style="float:right">
		    <form action="orderConfirmPage" method="GET">
			    <input class="btn" type="number" name="order_quantity" value="1" min="1" max="10"/>
			    <input class="btn" type="hidden" name="board_no" value="${groupbuydetail.board_no}"/>
			    <input class="btn" type="button" onclick="submit('${sessionScope.loginId}')" value="신청"/>
			    <!-- <input type="submit" value="구매"/> -->	    
		    </form>
		</div>
		    </div>
	    </div>
		</div>
	
		<br/>
		<div class="contentline">${groupbuydetail.board_content }</div>
		<br/>
		
		
		
		<div class="contentline">
	
			<c:forEach var="photo" items="${photolist }">
				<c:if test="${photo.photo_thum eq 'N'}">
				<img src="/photo/${photo.photo_newname }"/><br/>
				</c:if>
			</c:forEach>
		</div>
		
	</div>
	
	<iframe src="footer"></iframe>
</body>
<script>
	//var loginId = "${sessionScope.loginId}";
	function submit(loginId){
		console.log(loginId);
	}
	

	var unitPrice = "${groupbuydetail.groupbuy_unitprice }";
	unitPrice *=1;
	
	
	console.log(unitPrice);
	
	
	/* 수량변경시 자동으로 금액변경 */
	/* 클릭한경우 */
	$('input[type="number"]').click(function(){
		var quan = $(this).val();
		quan *=1;
		console.log(unitPrice * quan)
		$('#price').html(unitPrice * quan + ' 원');
	});
	/* 키보드로 변경한경우 */
	$('input[type="number"]').keyup(function(){
		var quan = $(this).val();
		quan *=1;
		console.log(unitPrice * quan)
		$('#price').html(unitPrice * quan + ' 원');
	});	
	/*  */
	
	

	// 카테고리 클릭시 이동
	$('.category').click(function(){
		
 		var param = $(this).attr('alt');
		console.log(param);
 		location.href='./groupBuyList?category='+param;

 	});

</script>
</html>