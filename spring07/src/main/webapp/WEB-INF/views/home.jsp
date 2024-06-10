<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
</head>
<body>
	<%@ include file="include/menu.jsp"%>
	<h2>Welcome!</h2>
	<c:if test="${sessionScope.userid != null}">
		<h2>${sessionScope.name} (${sessionScope.userid}) 님의 방문을 환영합니다.</h2>
	</c:if>
</body>
</html>