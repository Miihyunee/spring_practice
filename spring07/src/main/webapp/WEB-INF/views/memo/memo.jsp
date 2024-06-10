<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMO</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() { // 자동실행 함수
		list();
		$("#btn_write").click(function() { // 저장버튼을 누르면
			insert(); // 메모 저장
		});
	});

	function list() {
		// 백그라운드로 서버 호출
		$.ajax({
			url : "/memo/list.do",
			success : function(txt) { // 콜백 함수
				$("#div1").html(txt); // div에 메모 리스트 출력
			}
		});
	}

	function insert() {
		const writer = $("#writer").val();
		const memo = $("#memo").val();
		const params = {
			"writer" : writer,
			"memo" : memo
		};
		$.ajax({
			type : "post",
			data : params,
			url : "/memo/insert.do",
			success : function() { // 백그라운드 처리가 완료되면
				list(); // 리스트를 갱신하고
				$("#writer").val("");
				$("#memo").val("");
			}
		});
	}

	function view(num) {
		$(location).attr("href", "/memo/view.do?_id=" + num);
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>한줄 메모장</h2>
	이름 :
	<input type="text" id="writer"> 메모 :
	<input type="text" id="memo" size="50">
	<input type="button" id="btn_write" value="확인">
	<div id="div1"></div>
</body>
</html>