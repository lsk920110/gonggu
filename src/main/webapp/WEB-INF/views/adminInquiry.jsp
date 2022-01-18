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
			width: 100%;
   			height: 210px;
			border-style: none;
		}
	</style>
</head>
<body>
	<iframe src="header"></iframe>
	<div id = "adminMenuBar">
        <img class="adminMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="adminOrderList">
        <img style="background-color: beige" class="adminMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="adminInquiry">
        <img class="adminMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="adminRequire">
        <img class="adminMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="admingroupbuylist">
        <img class="adminMenu" src="resources/img/전체회원정보.png" alt="전체회원정보" loc="adminuserlist">
        <img class="adminMenu" src="resources/img/상품등록.png" alt="상품등록" loc="groupbuywriteForm2">
    </div>
    <!-- 
	<div>
		<a href="adminOrderList">전체 주문 내역</a>
		<a href="adminInquiry">전체 문의게시글</a>
		<a href="adminRequire">전체 요청글</a>
		<a href="adminGroupbuy">전체 공구 게시글</a>
		<a href="adminUserList">전체 회원 정보</a>
	</div>
     -->
	

	<hr/>
	<br/>
	<br/>
	<br/>
	
	<form action="adminInquiry_update" method="post">
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
				
				<c:if test="${adInquiry eq null || size == 0}">
					<tr>
						<td colspan="9">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${adInquiry}" var="adInquiry">
					<input type="hidden"  name ="boardNo"  value ="${adInquiry.board_no}">
					<tr>
						<th>${adInquiry.board_no}</th>
						<th>${adInquiry.board_title}</th>
						<th>${adInquiry.user_id}</th>		
						<th>${adInquiry.inquiry_category_name}</th>
						<th>${adInquiry.board_date }</th>
						<th>
							<select class="${adInquiry.board_no}" name="exposure">
								<option value="Y"
								<c:if test="${adInquiry.board_exposure eq 'Y'}">selected</c:if>
								>노출</option>
			                    <option value="N"
			                    <c:if test="${adInquiry.board_exposure eq 'N'}">selected</c:if>
			                    >비노출</option>
							</select>
						</th>	
							
						<th>
							<select class="${adInquiry.board_no}" name="board_active">
								<option value="Y"
								<c:if test="${adInquiry.board_active eq 'Y'}">selected</c:if>
								>활성화</option>
			                    <option value="N"
			                    <c:if test="${adInquiry.board_active eq 'N'}">selected</c:if>
			                    >비활성화</option>
							</select>	
						</th>		
						
						<th>
							<select class="${adInquiry.board_no}" name="inquiry_answer">
								<option value="Y"
								<c:if test="${adInquiry.inquiry_answer eq 'Y'}">selected</c:if>
								>답변완료</option>
			                    <option value="N"
			                    <c:if test="${adInquiry.inquiry_answer eq 'N'}">selected</c:if>
			                    >답변 중</option>
							</select>
						</th>
						<!-- 
						<th>
							<input class="${adInquiry.board_no}"  name="click" type="button" value="저장" />
						</th>
						 -->
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

/*
console.log('asa')
$("input[name=click]").click( 
	function(event){
		console.log(event);
		console.log('change');
	console.log($('this'))
}
)

function selectUpdate(no)
{
	console.log(no);
}
*/

	





</script>
</html>