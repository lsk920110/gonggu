<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		.footer_line{
                margin: 0 auto;
                width: 50%;
                height: 80px;
            }
            .footer_line span{
                font-size: 12px;
                width: 200px;
                height: 100%;
                color: gray;
                margin-left: 20px;
            }
            #footer_one{
                line-height: 60px;
                text-align: center;
            }
            #footer_two{
                line-height: 0px;
                text-align: center;
            }
            #main_footer{
            	min-width: 1280px;
            }
		
	
	</style>
</head>
<body style="overflow-x: hidden">
	<hr/>
	<br/>
	<div id="main_footer">
		<div id="main_footer_wrap">
			<div id="footer_one" class="footer_line">
				<span>회사명 : Modoo</span>
				<span>대표 : 000</span>
				<span>전화 : 000-0000-0000</span>
			</div>
			<div id="footer_two" class="footer_line">
				<span>사업자 등록번호 : 000-00-00000</span>
				<span>주소 : 서울특별시 금천구</span>
				<span>이메일 : 0000@naver.com</span>
			</div>
		</div>
	</div>
</body>
<script></script>
</html>