<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
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
		text-decoration:none; /*<a> 태그의 기본 꾸밈 효과(밑줄 등)을 없애기*/
		color: black; 
		font-weight : bold;
	}
	
	.heart{
		width: 30px;
		height: 30px;
		cursor: pointer;
	}
	</style>
</head>
<body>


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
        
        <c:set var="wish_list" value="${wishlist}"/>
        
	
			<c:forEach items="${groupBuyList}" var="list">
			
			<c:set var="board__no" value="${list.board_no}"/>
			
				${list.groupbuy_state}<br/>
				
				
				<c:choose>
					<c:when test="${list.groupbuy_state eq '공구완료'}">
						<a href="detail?board_no=${list.board_no}">
							<img style="filter:grayscale(100%)" id="boardimg" src="/photo/${list.photo_newname}" alt="상품이미지"/> 
						</a><br/>
					</c:when>
					<c:when test="${list.groupbuy_state eq '공구실패'}">
						<a href="detail?board_no=${list.board_no}">
							<img style="filter:grayscale(100%)" id="boardimg" src="/photo/${list.photo_newname}" alt="상품이미지"/> 
						</a><br/>
					</c:when>
					<c:otherwise> 
						<a href="detail?board_no=${list.board_no}">
							<img id="boardimg" src="/photo/${list.photo_newname}" alt="상품이미지"/> 
						</a><br/>
					</c:otherwise> 
				</c:choose>  
				
				
				<a id="boardtitle" href="detail?board_no=${list.board_no}">${list.board_title}</a><br/>
			   
			   
			    <input type="text" value="${list.board_no}"/>
			    <input type="hidden" value="${list.board_no}"/>
				
				
				<c:choose>
					<c:when test="${fn:contains(wish_list, board__no)}">
						<img class="heart" src="resources/img/검정하트.png" alt="찜 검정하트">
					</c:when>
					
					<c:otherwise> 
						<img class="heart" src="resources/img/빈하트.png" alt="찜 빈하트">
					</c:otherwise> 
				</c:choose>  
	
	
				<p>가격 : ${list.groupbuy_unitprice}원<p>
				
				<c:if test="${list.sum eq null}">
					<progress value="0" max="${list.groupbuy_target}"></progress>
					<p style="font-size:11px">신청수량:0개 / 목표수량:${list.groupbuy_target}개 </p>		
				</c:if>
				
				<c:if test="${list.sum ne null}">
					<progress value="${list.sum}" max="${list.groupbuy_target}"></progress>
					<p style="font-size:11px">신청수량:${list.sum}개 / 목표수량:${list.groupbuy_target}개 </p>		
				</c:if>
								
			</c:forEach>

        </div>


	
</body>
<script>

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
				$(this).attr('src','resources/img/검정하트.png');
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
	
	
	
	
	/*
	
	$('.heart1').click(function(){
		console.log('빈하트 클릭')
		
		if('${loginId}' == ''){ //비회원이면 로그인 페이지로 이동
			location.href='./loginMain';
		}else{
					
			var loginId = '${loginId}';
			var board_no = $(this).prev().val();
			
			console.log("로그인 아이디 : "+loginId);
			console.log("게시글 번호 : "+board_no);
			
			
			
			
		}
		
		
		
		
	});
	
	*/
	
	
	
	//카테고리 조회 클릭 시  
	$('.category').click(function(){
		
 		var param = $(this).attr('alt');
 		
		console.log(param);

		$.ajax({
			type:'GET',
			url:'categoryCheck',
			data: {'param':param},
			dataType:'JSON',
			success:function(data){
				console.log(data.categorylist);
				
				if(data.categorylist == ''){
					alert('해당 카테고리 게시글이 없습니다.');
					location.href='./groupBuyList';
				}else{
					//$('#board1').empty();
					listDraw(data.categorylist);
				}
			},	
			error:function(e){
				console.log(e);
				alert('서버에 문제가 발생했습니다.');
			}
		});
		
		
 	});

	
	//카테고리별 리스트 append
	function listDraw(categorylist){
		
		/*
		var content = '';
		
		//수정★)리스트 완성하면 똑같이 배열로 넣을것
		for (var i = 0; i < list.length; i++){
			content += list[i].groupbuy_state+'<br/>'; 
			content += '<a><img src="/photo/'+list[i].photo_newname+'" alt="상품이미지"/></a>';
		}
		
		$('#board1').append(content); 
		
		
		var param = [];
		categorylist;
		
		
		$.ajax({
			type:'GET',
			url:'groupBuyList',
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
		
		*/
	};
	
	

</script>
</html>