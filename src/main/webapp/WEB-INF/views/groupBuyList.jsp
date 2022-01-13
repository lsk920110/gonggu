<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	.category{
		cursor: pointer
	}
	#board1{
		width: 200px;
		
	}
	</style>
</head>
<body>
	<!-- 진입하자마자 전체 공구 리스트 불러오기 -->
    <div>
        <img class="category" src="resources/img/생활건강.png" alt="생활건강">
        <img class="category" src="resources/img/스포츠레저.png" alt="스포츠레저">
        <img class="category" src="resources/img/가구인테리어.png" alt="가구인테리어">
        <img class="category" src="resources/img/디지털가전.png" alt="디지털가전">
        <img class="category" src="resources/img/패션.png" alt="패션">
        <img class="category" src="resources/img/화장품미용.png" alt="화장품미용">
        <img class="category" src="resources/img/출산육아.png" alt="출산육아">
        <img class="category" src="resources/img/식품.png" alt="식품">
        <img class="category" src="resources/img/여가생활.png" alt="여가생활">
        <img class="category" src="resources/img/기타.png" alt="기타">
    </div>

    <div>
        <div id=board1>
				
		<c:forEach items="${groupBuyList}" var="list">
		
			
			${list.groupbuy_state}<br/>
			<a>
			<img src="<c:url value='${list.photo_newname}'/>"alt="상품이미지"/> 
			</a><br/>
			<a href="detail?board_no=${list.board_no}">${list.board_title}</a><br/>
			<p>가격 : ${list.groupbuy_unitprice}원<p>
			
			<progress value="${list.order_quantity}" max="${list.groupbuy_target}"></progress>
			<p style="font-size:11px">신청수량:${list.order_quantity}개 / 목표수량:${list.groupbuy_target}개 </p>
			${list.user_id}
			
				
		</c:forEach>


        </div>

    </div>

	
</body>
<script>
	


</script>
</html>