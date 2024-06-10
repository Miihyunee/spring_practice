<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMO VIEW</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() { // 자동실행 함수
		$("#btn_update").click(function() { // 수정버튼을 누르면
			$("#form1").attr("action", "/memo/update.do");
			$("#form1").submit(); // 제출
		});
		$("#btn_delete").click(function() { // 삭제버튼을 누르면
			if (confirm("삭제하시겠습니까?")) { // 확인을 받고
				$("#form1").attr("action", "/memo/update.do");
				$("#form1").submit(); // 제출
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>메모장</h2>
	<form id="form1" name="form1" method="post">
		<!-- 수정, 삭제에 필요한 _id -->
		<input type="hidden" name="_id" value="${dto._id}"> 이름 : <input
			type="text" name="writer" value="${dto.writer}"><br> 메모
		: <input type="text" name="memo" value="${dto.memo}" size="50"><br>
		<input type="button" id="btn_update" value="수정"> <input
			type="button" id="btn_delete" value="삭제"> <input
			type="button" id="btn_list" value="목록"
			onclick="location.href='/memo/'">
	</form>
</body>
</html>