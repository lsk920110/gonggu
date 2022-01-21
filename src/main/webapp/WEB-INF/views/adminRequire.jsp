<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> -->
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
		table{
         margin-left: auto;
         margin-right: auto;
         min-width: 1296px;
         max-width: 1166px;
  		 }
  	 .board_title{
	    display: block;
        color: black;
        width: 434px;
        font-weight: bolder !important;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
	}  				
	</style>
</head>
<body>
	<iframe src="header"></iframe>
	<div id = "adminMenuBar">
        <img class="adminMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="adminOrderList?currpage=1">
        <img class="adminMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="adminInquiry?currpage=1">
        <img style="background-color: beige" class="adminMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="adminRequire?currpage=1">
         <img class="adminMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="admingroupbuylist?currpage=1">
        <img class="adminMenu" src="resources/img/전체회원정보.png" alt="전체회원정보" loc="adminuserlist?currpage=1">
        <img class="adminMenu" src="resources/img/상품등록.png" alt="상품등록" loc="groupbuywriteForm2">
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
				<th style="display : none">비활성화</th>
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
						<th><div class="board_title"><a href="RequestBoardDetail?board_no=${adRequire.board_no}&frompage=myorderList">${adRequire.board_title}</a></div></th>
						<th>${adRequire.user_id}</th>		
						<th>${adRequire.product_category_name}</th>
						<th><fmt:formatDate value="${adRequire.board_date}" pattern="yyyy. MM. dd"/></th>
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
						
						<th style="display : none">
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
							<select name="requiry_answer">
								<option value="선정완료"
								<c:if test="${adRequire.board_select eq '선정완료'}">selected</c:if>
								>선정완료</option>
			                    <option value="선정실패"
			                    <c:if test="${adRequire.board_select eq '선정실패'}">selected</c:if>
			                    >선정실패</option>
			                    <option value="진행중"
			                    <c:if test="${adRequire.board_select eq '진행중'}">selected</c:if>
			                    >진행중</option>
							</select>
						</th>	
					</tr>			
			</c:forEach>
			<tr style="text-align : right">
				<td colspan="9">
					<input type="submit" value="수정"/>
					<input type="hidden" name="currpage" value="${nowpage}"/>
				</td>
			</tr>
			
						<!-- 페이징 영역 -->
			<tr>
				<td colspan="9">
					<div class="container">
						<nav aria-label="Page navigation" style="text-align:center">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
				</td>
			</tr>
			<!-- 페이징 영역 -->		
			
			
		</table>	
		<br/>
	
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
	
	
	/* 페이징에 관한 곳 */
	var startpage = "${nowpage}";
	startpage = startpage*1;
	var totalpage = "${pages}";
	totalpage = (totalpage*1)-1;
	$('#pagination').twbsPagination({
		startPage : startpage,
		totalPages : totalpage,
		visiblePages : 5,
		onPageClick:function(evt,page){
			console.log(evt);
			console.log(page);
			if("${nowpage}" != page) {
				location.href="./adminRequire?currpage="+page;			
			}
		}

	});
	
	
	
</script>
</html>