<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
		display: inline;
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
	}
	
	#heart{
		width: 30px;
		height: 30px;
		
	}
	</style>
</head>
<body>
<iframe src="header"></iframe>
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
         <div id="board1">
				
		<c:forEach items="${groupBuyList}" var="list">
		
			${list.groupbuy_state}<br/>
			<a>
			<img id="boardimg" src="/photo/${list.photo_newname}" alt="상품이미지"/> 
			</a><br/>
			<a id="boardtitle" href="detail?board_no=${list.board_no}">${list.board_title}</a><br/>
		
			<img id="heart" src="resources/img/빈하트.png" alt="찜하트">
	
			<p>가격 : ${list.groupbuy_unitprice}원<p>
			
		<c:if test="${list.sum eq null}">
			<progress value="0" max="${list.groupbuy_target}"></progress>
			<p style="font-size:11px">신청수량:0개 / 목표수량:${list.groupbuy_target}개 </p>		
		</c:if>
		<c:if test="${list.sum != null}">
			<progress value="${list.sum}" max="${list.groupbuy_target}"></progress>
			<p style="font-size:11px">신청수량:${list.sum}개 / 목표수량:${list.groupbuy_target}개 </p>		
		</c:if>
							
		</c:forEach>

        </div>
<!-- <button onclick="location.href='writeForm'">글쓰기</button> -->
<!-- <table>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<button onclick="location.href='groupbuywrite'">글쓰기</button>
	<c:if test="${list eq null || size == 0}">
	<tr><td colspan="5"> 등록된 글이 없습니다.</td></tr>
	</c:if>
	<c:forEach items="${list}" var="bbs">
	<tr>
		<td>${bbs.idx}</td>
		<td><a href="detail?idx=${bbs.idx}">${bbs.subject}</a></td>
		<td>${bbs.user_name}</td>
		<td>${bbs.reg_date}</td>
		<td>${bbs.bHit}</td>
	</tr>
	</c:forEach>
</table>
 -->
 <table>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<button onclick="location.href='groupbuywrite'">글쓰기</button>
	<c:if test="${list eq null || size == 0}">
	<tr><td colspan="5"> 등록된 글이 없습니다.</td></tr>
	</c:if>
	<c:forEach items="${list}" var="board">
	<tr>
		<td>${board.no}</td>
		<!-- <td><a href="detail?idx=${bbs.idx}">${bbs.subject}</a></td>-->
		<td>${board.board_title}</td>
		<td>${user_info.user_id}</td>
		<td>${board.date}</td>
	</tr>
	</c:forEach>
</table>
<iframe src="footer"></iframe>
</body>
<script></script>
</html>