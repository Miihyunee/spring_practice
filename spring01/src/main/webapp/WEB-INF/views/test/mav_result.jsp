<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mav_result</title>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	상품명 : ${map.dto.name}<br>
	가격 : ${map.dto.price} 
</body>
</html>