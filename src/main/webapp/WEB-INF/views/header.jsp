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
                z-index: 10;
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
                position: absolute;
                bottom: 8%;
                width: 65%;
                height: 50px;
                padding-left: 20px;
                padding-top: 5px;
                left: 20%;
                border-radius: 10px;
                border: 2px solid rgb(246 225 170);
                font-size: 20px;
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
	                    <input id="search" type="text" name="search" placeholder="검색어를 입력하세요."/>
	                    <img id="search_icon" src="resources/img/검색.jpg" alt="검색버튼">
	                </div>
               	</form>
               
		            <div id="main_wrap_header_right" class="headertap">
		                <span class="login" loc="loginMain">로그인</span>
	                </div> 
            </div>


            <div id="main_wrap_category">
                <span id="admin_category1" class="admin_category" loc="(요청게시판)">요청게시판</span>
                <span id="admin_category2" class="admin_category" loc="groupBuyList">공구게시판</span>
                <span id="admin_category3" class="admin_category" loc="inquireBoardList">문의게시판</span>
                <span id="admin_category4" class="admin_category" loc="mypage">마이페이지</span>
            </div>

        </div>
    </body>
    <script>
    
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