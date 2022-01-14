<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <link rel="stylesheet" href="resources/common.css">
   <style></style>
</head>
<body>
   <iframe src="header"></iframe>
   <div>
      <a href="adminOrderList">전체 주문 내역</a>
      <a href="adminInquiry">전체 문의게시글</a>
      <a href="adminRequire">전체 요청글</a>
      <a href="adminGroupbuy">전체 공구 게시글</a>
      <a href="adminUserList">전체 회원 정보</a>
   </div>
   <h3>전체 문의게시글</h3>
   
   
   
   
   
   
   
   
   
   <form action="adminInquiry_update" method="post">
   <input type="button" id="allclick" value="전체수정"/>
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
               <th>저장</th>
            </tr>
            
            <c:if test="${adInquiry eq null || size == 0}">
               <tr>
                  <td colspan="9">등록된 글이 없습니다.</td>
               </tr>
            </c:if>
            <c:forEach items="${adInquiry}" var="adInquiry">
               
               
               
               <tr class="${adInquiry.board_no}">
                  <th>${adInquiry.board_no}</th>
                  <th>${adInquiry.board_title}</th>
                  <th>${adInquiry.user_id}</th>      
                  <th>${adInquiry.inquiry_category_name}</th>
                  <th>${adInquiry.board_date }</th>
                  <th>
                     <select class="exp">
                        <option value="Y"
                        <c:if test="${adInquiry.board_exposure eq 'Y'}">selected</c:if>
                        >노출</option>
                        <option value="N"
                             <c:if test="${adInquiry.board_exposure eq 'N'}">selected</c:if>
                             >비노출</option>
                     </select>
                     
                  
                  </th>      
                  <th>
                     <select class="act">
                        <option value="Y"
                        <c:if test="${adInquiry.board_active eq 'Y'}">selected</c:if>>
                        	활성화</option>
                             <option value="N"
                             <c:if test="${adInquiry.board_active eq 'N'}">selected</c:if>
                             >비활성화</option>
                     </select>
                     
                  </th>      
                  <th>
                     <select class="sta">
                        <option value="Y"
                        <c:if test="${adInquiry.inquiry_answer eq 'Y'}">selected</c:if>
                        >답변완료</option>
                             <option value="N"
                             <c:if test="${adInquiry.inquiry_answer eq 'N'}">selected</c:if>
                             >답변 중</option>
                     </select>
                  </th>
                  <th>
                     <input class="${adInquiry.board_no}"  type="text" name="${adInquiry.board_no}" value=""/>
                  </th>
                  <th>
                     <input id="${adInquiry.board_no}" class="btn" type="button" value="click"/>                  
                  </th>
               </tr>  
               
               
                      
            </c:forEach>

         </table>   
         
         <input type="submit" value="수정"/>
   </form>
   
   <iframe src="footer"></iframe>
   
</body>
<script>


$('input[type="button"]').click(function(){
	
	
    var a = ($(this).attr('id'));
	

    console.log(a);
    var expVal = $('tr.'+a+' .exp option:selected').val();
    var actVal = $('tr.'+a+' .act option:selected').val();
    var staVal = $('tr.'+a+' .sta option:selected').val();
    
    $('input[name="'+a+'"]').val(expVal+actVal+staVal);
    


   
   
});
   
$('#allclick').click(function(){
    console.log('다눌러!');
    var allclick = document.getElementsByClassName("btn");
    for(var i=0; i< allclick.length ;i++){
        allclick[i].click();
    }

});



</script>
</html>