<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="login"></div>
<script>
	var loginId = "${sessionScope.loginId}";
	
	if(loginId != ""){
		$("#login").
		html('안녕하세요'+loginId+' 님, <a href="logout">[로그아웃]</a>');
	}	
</script>