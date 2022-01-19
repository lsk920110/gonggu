<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
            /* 전체 틀 */
            #main_wrap{
                position: relative;
                /* border: 1px solid lightgrey; */
                width: 100%;
                margin: -8 auto;
            }
            #main_wrap_header{
                position: sticky;
                /* border-bottom: 1px solid lightgrey; */
                width: 100%;
                height: 90px;
                top: 0px;
                z-index: 10;
                background-color: white;
            }
            #main_wrap_header_left{
                position: absolute;
                /* border: 1px solid black; */
                width: 20%;
                height: 100%;
            }
            #main_wrap_header_center{
                position: absolute;
                /* border: 1px solid black; */
                width: 59.8%;
                height: 100%;
                left: 20%;
            }
            #main_wrap_header_right{
                position: absolute;
                /* border: 1px solid black; */
                width: 20%;
                height: 100%;
                right: 0%;
            }
            #main_wrap_category{
                position: sticky;
                /* border-top: 1px solid lightgrey; */
                border-bottom: 1px solid lightgrey;
                width: 100%;
                height: 80px;
                top: 90px;
                /*z-index: 10;*/
                z-index: 9;
                background-color: white;
            }
            #main_container{
                position: absolute;
                width: 100%;
                height: 80%;
                top: 170px;
                /* border-top: 1px solid lightgrey; */
                border-bottom: 1px solid lightgrey;
            }
            #main_footer{
                position: absolute;
                /* border-top: 1px solid black;
                border-bottom: 1px solid black; */
                width: 100%;
                height: 125px;
                bottom: 0px;
            }
            a:link{
                text-decoration: none;
            }


            /* 1. 헤더 */
            #MainLogo{ 
                position: absolute;
                width: 182px;
                height: 60px;
                bottom: 1%;
            }
            #MainLogo{
            	cursor: pointer;
            }
            #search{
                /*position: absolute;*/
                bottom: 8%;
                /*width: 65%;*/
                width: 100%;
                height: 50px;
                padding-left: 20px;
                padding-top: 5px;
                left: 20%;
                /*border-radius: 10px;*/
                /*border: 2px solid rgb(246 225 170);*/
                font-size: 20px;
                border-style: none;
            }
            #search_icon{
                position: absolute;
                width: 30px;
                height: 30px;
                bottom: 20%;
                right: 17%;
                cursor: pointer;
            }
            .login{
                position: absolute;
                border: 2px solid rgb(246 225 170);
                border-radius: 10px;
                width: 100px;
                height: 40px;
                bottom: 10%;
                right: 25%;
                background-color: rgb(246 225 170);
                font-size: 20px;
                font-weight: 700;
                color: white;
                text-align: center;
                line-height: 40px;
            }
            .login:hover{
            	cursor: pointer;
            	color: rgb(246 225 170);
            	background-color: white;
            }
           

            /* 2.카테고리 */
            .admin_category{
                position: absolute;
                height: 60%;
                text-align: center;
                color: rgb(246 225 170);
                font-size: 20px;
                font-weight: 600;
                line-height: 50px;
                top: 20%;
            }
			
			.admin_category:hover{
				cursor: pointer;
				background-color: rgb(246 225 170);
				color: white;
				border-radius: 10px;
			}
			
            #admin_category1{
                width: 16%;
                left: 17%;
            }
            #admin_category2{
                width: 16%;
                left: 34%;
            }
            #admin_category3{
                width: 16%;
                left: 52%;
            }

            #admin_category4{
                width: 16%;
                left: 68%;
            }
			
			#searchButton{
			
				/*border-radius: 7px;*/
				border-radius: 2px;
			    background-color: rgb(246 225 170);
			    color: white;
			    border: 2px solid rgb(246 225 170);
			    /**/
			    height: 50px;
    			width: 100%;
    			font-size: 20px;
			}
			
			#searchButton:hover{
			    background-color: white;
			    color: rgb(246 225 170);
			    border: white;
			    height: 50px;
			    cursor: pointer;
			}
			/**/
           .search_group{
           		float : left;
           		height: 50px;
           		
           }
           
            #search_group{
            	margin:20px;
            	text-align: center;
            	border: 2px solid rgb(246 225 170);
   				height: 50px;
    			border-radius: 4px;
            }
             #search_group1{
				width: 20%;
            }
             #search_group2{
				width: 70%;
            }
             #search_group3{
				width: 10%;
            }
            #search_categori{
				width: 100%;
   				height: 50px;
   				border-style: none;
    			font-size: 15px;
    			text-align: center;
    			border-right: solid 2px rgb(246 225 170);
            }
            
            
        </style>
    </head>
    <body>
        <div id="main_wrap">

            <div id="main_wrap_header">
	                <div id="main_wrap_header_left" class="headertap">
	                	<img id="MainLogo" src="resources/img/MainLogo.png" alt="메인로고" loc="./"/>
	                </div>
               	<form action="search" method="post">
	               	<div id="main_wrap_header_center" class="headertap">
		               		<!-- 추가 -->
	               		<div id="search_group">
	               			<div id="search_group1" class="search_group">
			               		<select name="page" id="search_categori">
			               			<option value="groupBuyList2?category=all&currpage=1">공구리스트</option>
			               			<option value="RequestBoardlist?category=all&currpage=1">요청리스트</option>
			               			<option value="inquireBoardList?category=all&currpage=1">문의리스트</option>
			               		</select>
	               			</div>
		               		<div id="search_group2" class="search_group">
			                    <input id="search" type="text" name="search" placeholder="검색어를 입력하세요."/>
			                    <!-- <img id="search_icon" src="resources/img/검색.jpg" alt="검색버튼"> -->		               		
		               		</div>
		               		<div id="search_group3" class="search_group">
		                    	<input id="searchButton" type="submit" value="검색" />		               		
		               		</div>
	               		
	               		</div>
		                    <!-- 추가 -->
	                </div>
               	</form>
               
		            <div id="main_wrap_header_right" class="headertap">
		            	<c:if test="${loginId == 'user' }">
			                <span class="login" loc="logout">로그아웃</span>		                	            	
		            	</c:if>
		            	<c:if test="${loginId == 'unuser' }">
			                <span class="login" loc="loginMain">로그인</span>		                	            	
		            	</c:if>
	                </div> 
            </div>


            <div id="main_wrap_category">
                <span id="admin_category1" class="admin_category" loc="RequestBoardlist?category=all&currpage=1">요청게시판</span>
                <span id="admin_category2" class="admin_category" loc="groupBuyList?category=all&currpage=1">공구게시판</span>
                <span id="admin_category3" class="admin_category" loc="inquireBoardList?category=all&currpage=1">문의게시판</span>
                <c:if test="${adminYN == 'N'}">            
	                <span id="admin_category4" class="admin_category" loc="mypage">마이페이지</span>
                </c:if>
                <c:if test="${adminYN == 'Y'}">            
	                <span id="admin_category4" class="admin_category" loc="adminOrderList?currpage=1">관리자페이지</span>
                </c:if>
                <c:if test="${adminYN == 'U'}">            
	                <span id="admin_category4" class="admin_category" loc="myorderList?currpage=1">마이페이지</span>
                </c:if>                
            </div>

        </div>
    </body>
    <script>
    console.log("${loginId}");
    console.log("${adminYN}");
    $("#MainLogo").click(function(){//페이지 이동  
        parent.location.href=$(this).attr("loc");//부모창에서 여는 방법//attr로 loc속성을 가져온다.
    });
    $(".admin_category").click(function(){//페이지 이동  
        parent.location.href=$(this).attr("loc");//부모창에서 여는 방법//attr로 loc속성을 가져온다.
    });
    $(".login").click(function(){//페이지 이동  
        parent.location.href=$(this).attr("loc");//부모창에서 여는 방법//attr로 loc속성을 가져온다.
    });

    </script>
</html>