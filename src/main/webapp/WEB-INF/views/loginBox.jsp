<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="login"></div>
<script>
//특이사항 없고, 나중에 list랑 연결해주면됨 
	var loginId = "${sessionScope.loginId}";
	
	if(loginId != ""){
		$("#login").
		html('안녕하세요'+loginId+' 님, <a href="logout">[로그아웃]</a>');
	}	
</script>