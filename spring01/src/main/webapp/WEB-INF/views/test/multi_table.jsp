<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>multi_table</title>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>구구단 계산</h2>
	<form action="table_result.do" method="post">
		단을 입력하세요 : <input type="number" name="num" value="3"> <input
			type="submit" value="확인">
	</form>
</body>
</html>