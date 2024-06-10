<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<style>
th {
	background: #ffb6c194;
}
</style>
<title>회원 등록</title>
</head>
<body>
	<h2>회원등록</h2>
	<form name="form1" method="post" action="/member/insert.do">
		<table border="1" style="width: 400px;">
			<tr>
				<th>아이디</th>
				<td><input name="userid"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="email"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>