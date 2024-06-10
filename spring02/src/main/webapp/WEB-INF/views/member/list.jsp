<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<style>
th {
	background: #ffb6c194;
}
</style>
<title>회원 목록</title>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>회원 목록</h2>
	<input type="button" value="회원 등록"
		onclick="location.href='/member/write.do'">
	<table border="1" style="width: 700px; margin-top: 10px;">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>가입일자</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.userid}</td>
				<td><a href="/member/view.do?userid=${row.userid}">${row.name}</a></td>
				<td>${row.email}</td>
				<td><fmt:formatDate value="${row.join_date}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>