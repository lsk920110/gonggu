<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <link rel="stylesheet" href="resources/common.css">
   <style>
	   table ,th,td {
	   	border : 1px solid black;
	   	border-collapse : collapse;
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
   
   </style>
</head>
<body>
  	<iframe src="header"></iframe>
	<div id = "adminMenuBar">
        <img class="adminMenu" src="resources/img/전체주문내역.png"  alt="전체주문내역" loc="adminOrderList">
        <img class="adminMenu" src="resources/img/전체문의게시글.png" alt="전체문의게시글" loc="adminInquiry">
        <img class="adminMenu" src="resources/img/전체요청글.png" alt="전체요청글" loc="adminRequire">
        <img style="background-color: beige" class="adminMenu" src="resources/img/전체공구게시글.png" alt="전체공구게시글" loc="admingroupbuylist">
        <img class="adminMenu" src="resources/img/전체회원정보.png" alt="전체회원정보" loc="adminuserlist">
        <img class="adminMenu" src="resources/img/상품등록.png" alt="상품등록" loc="(상품등록)">
    </div>
			
	<hr/>
	<br/>
	<br/>
	<br/>		
			
			
   
   
   
   
   
   
   
   
   
   <form action="adminGroupbuy_update" method="post">
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
               <th>취소</th>
               <th style="display: none">저장</th>
            </tr>
            
            <c:if test="${adgroupbuylist eq null || size == 0}">
               <tr>
                  <td colspan="9">등록된 글이 없습니다.</td>
               </tr>
            </c:if>
            <c:forEach items="${adgroupbuylist}" var="adgroupbuy">  
               <tr class="${adgroupbuy.board_no}">
                  <th>${adgroupbuy.board_no}</th>
                  <th>${adgroupbuy.board_title}</th>
                  <th>${adgroupbuy.user_id}</th>      
                  <th>${adgroupbuy.product_category_name}</th>
                  <th >${adgroupbuy.board_date }</th>
                  <th>
                     <select class="exp">
                        <option value="Y"
                        <c:if test="${adgroupbuy.board_exposure eq 'Y'}">selected</c:if>
                        >노출</option>
                        <option value="N"
                             <c:if test="${adgroupbuy.board_exposure eq 'N'}">selected</c:if>
                             >비노출</option>
                     </select>
                  </th>      
                  <th>
                     <select class="act">
                        <option value="Y"
                        <c:if test="${adgroupbuy.board_active eq 'Y'}">selected</c:if>>
                        	활성화</option>
                             <option value="N"
                             <c:if test="${adgroupbuy.board_active eq 'N'}">selected</c:if>
                             >비활성화</option>
                     </select>
                  </th>      
                  <th>
                     <select class="sta">
                        <option value="모집중"
                        <c:if test="${adgroupbuy.groupbuy_state eq '모집중'}">selected</c:if>
                        >모집중</option>
                             <option value="공구실패"
                             <c:if test="${adgroupbuy.groupbuy_state eq '공구실패'}">selected</c:if>
                             >공구실패</option>
                        <option value="공구완료"
                        <c:if test="${adgroupbuy.groupbuy_state eq '공구완료'}">selected</c:if>
                        >공구완료</option>                             
                     </select>
                  </th>
                  <th>
                  	<c:choose>
                  		<c:when test="${adgroupbuy.groupbuy_state eq '공구완료'}">
                  			공구완료
                  		</c:when>
                  		<c:when test="${adgroupbuy.groupbuy_state eq '공구실패'}">
                  			공구실패
                  		</c:when>
                  		<c:when test="${adgroupbuy.groupbuy_state eq '모집중'}">                  		
		                  	<input type="button" value="강제취소" onclick="cancel(this)" style="background-color : #f44336"/>                  		
                  		</c:when>
                  	
                  	</c:choose>

                  
                  </th>
                  <th style="display: none">
                     <input class="${adgroupbuy.board_no}"  type="text" name="${adgroupbuy.board_no}" value=""/>
			         <input id="${adgroupbuy.board_no}" class="btn" type="button" onclick="tempsavebutton(this)" value="click"/>                  					
                  </th>
               </tr>                 
            </c:forEach>
               <tr style="text-align : right">
					<td colspan="9">
						<input type="button"  id="allclick" value="전체수정"/> 
				         <input type="submit" value="수정" style="display: none"/>         
					
					</td>
               </tr>

         </table>

   </form>
   
   <iframe src="footer"></iframe>
   
</body>
<script>

/*
$('input[type="button"]').click(function(){
	
    var a = ($(this).attr('id'));
    console.log(a);
    var expVal = $('tr.'+a+' .exp option:selected').val();
    var actVal = $('tr.'+a+' .act option:selected').val();
    var staVal = $('tr.'+a+' .sta option:selected').val();
    
    $('input[name="'+a+'"]').val(expVal+actVal+staVal);

});
*/
   
function tempsavebutton(e){
	var a = e.id;
    //var a = ($(this).attr('id'));
    console.log(a);
    var expVal = $('tr.'+a+' .exp option:selected').val();
    var actVal = $('tr.'+a+' .act option:selected').val();
    var staVal = $('tr.'+a+' .sta option:selected').val();
    
    $('input[name="'+a+'"]').val(expVal+actVal+staVal);

};   
   
   
   
   
   
$('#allclick').click(function(){
    console.log('다눌러!');
    var allclick = document.getElementsByClassName("btn");
    for(var i=0; i< allclick.length ;i++){
        allclick[i].click();
    };
    $('input[type="submit"]').click();

});

function cancel(e){
	var cancelYN = confirm($(e).parents('tr').attr('class')+' 번 공구모집을 취소하시겠습니까?');
	if(cancelYN) {
		var cancelReason = prompt('사유를 입력해주세요');
		console.log(cancelReason);
		console.log($(e).val());
		console.log($(e).parents('tr').attr('class'));
		var board_no = $(e).parents('tr').attr('class');
		location.href='./gbcancel?cancelR='+cancelReason+'&board_no='+board_no;
		
	}
	
}

$(".adminMenu").click(function(){
    location.href=$(this).attr("loc");
});

</script>
</html>