<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" href="resources/common.css">
	<style>
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
			height: 210px;
			width: 100%;
			border-style: none;
		}
	</style>
</head>
<body>
	<iframe src="header"></iframe>
	<div id = "adminMenuBar">
        <img class="adminMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="adminOrderList">
        <img class="adminMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="adminInquiry">
        <img style="background-color: beige" class="adminMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="adminRequire">
         <img class="adminMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="admingroupbuylist">
        <img class="adminMenu" src="resources/img/전체회원정보.png" alt="전체회원정보" loc="adminuserlist">
        <img class="adminMenu" src="resources/img/상품등록.png" alt="상품등록" loc="(상품등록)">
    </div>
			
			
	<hr/>
	<br/>
	<br/>
	<br/>

	<form action="adRequire_update" method="POST">
		
		<table>
			<tr>
				<th>게시글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>카테고리</th>
				<th>등록일자</th>
				<th>비노출</th>
				<th>비활성화</th>
				<th>현황</th>
			</tr>
			
			<c:if test="${adRequire eq null || size == 0}">
				<tr>
					<td colspan="9">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${adRequire}" var="adRequire">
				<input type="hidden" name="boardNo" value="${adRequire.board_no}"/>
					<tr>
						<th>${adRequire.board_no}</th>
						<th>${adRequire.board_title}</th>
						<th>${adRequire.user_id}</th>		
						<th>${adRequire.product_category_name}</th>
						<th>${adRequire.board_date}</th>
						<th>
							<select name="exposure">
								<option value="Y"
								<c:if test="${adRequire.board_exposure eq 'Y'}">selected</c:if>
								>노출</option>
			                    <option value="N"
			                    <c:if test="${adRequire.board_exposure eq 'N'}">selected</c:if>
			                    >비노출</option>
							</select>
						</th>	
						
						<th>
							<select name="board_active">
								<option value="Y"
								<c:if test="${adRequire.board_active eq 'Y'}">selected</c:if>
								>활성화</option>
			                    <option value="N"
			                    <c:if test="${adRequire.board_active eq 'N'}">selected</c:if>
			                    >비활성화</option>
							</select>	
						</th>	
						
						<th>
							<select name="inquiry_answer">
								<option value="Y"
								<c:if test="${adRequire.board_select eq 'Y'}">selected</c:if>
								>선정완료</option>
			                    <option value="N"
			                    <c:if test="${adRequire.board_select eq 'N'}">selected</c:if>
			                    >선정 중</option>
							</select>
						</th>	
					</tr>			
			</c:forEach>
		</table>	
		<br/>
		<input type="submit" value="수정"/>
	
	</form>

	<br/>
	<br/>
	<br/>

	<iframe src="footer"></iframe>
	
</body>
<script>
	$(".adminMenu").click(function(){
	    location.href=$(this).attr("loc");
	});
</script>
</html>