<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		$("#btnUpdate").click(function() {
			document.form1.action = "/member/update.do";
			document.form1.submit();
		});

		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "/member/delete.do";
				document.form1.submit();
			}
		});
	});
</script>
<title>회원정보</title>
</head>
<body>
	<h2>회원정보</h2>
	<form method="post" name="form1">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name="userid" value="${dto.userid}" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name" value="${dto.name}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="email" value="${dto.email}"></td>
			</tr>
			<tr>
			<td>회원가입일자</td>
			<td><fmt:formatDate value="${dto.join_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
			<input type="button" value="수정" id="btnUpdate">
			<input type="button" value="삭제" id="btnDelete">
			<div style="color: red">${message}</div>
		</table>
	</form>
</body>
</html>