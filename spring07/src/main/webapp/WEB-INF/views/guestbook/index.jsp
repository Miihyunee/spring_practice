<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestBook</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() { // 페이지 로딩이 끝나면 자동으로 실행되는 함수
		list(); // 방명록 리스트
	});

	function list() {
		$.ajax({
			url : "/guestbook/list.do",
			success : function(txt) {
				$("#div1").html(txt); // div영역에 출력
			}
		});
	}

	function gb_write() {
		location.href = "/guestbook/write.do";
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>방명록</h2>
	<input type="button" value="글쓰기" onclick="gb_write()">
	<div id="div1"></div>
</body>
</html>