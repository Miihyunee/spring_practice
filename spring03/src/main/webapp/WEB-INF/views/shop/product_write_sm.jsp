<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Write Sm</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
	$(function() {
		//id가description인태그를summernote로변경
		$("#description").summernote({
			height : 300,
			width : 800
		});
	});

	function product_write() {
		const product_name = document.form1.product_name.value;
		const price = document.form1.price.value;
		const description = document.form1.description.value;
		if (product_name == "") {
			alert("상품명을 입력하세요");
			document.form1.product_name.focus();
			return;
		}
		if (price == "") {
			alert("가격을 입력하세요");
			document.form1.price.focus();
			return;
		}
		/* 		if (description == "") {
		 alert("상품설명을 입력하세요");
		 document.form1.description.focus();
		 return;
		 } */
		document.form1.action = "/shop/product/insert.do";
		document.form1.submit();
	}
</script>
<title>상품 등록</title>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>상품 등록</h2>
	<form name="form1" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>상품명</td>
				<td><input name="product_name"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="price"></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><textarea rows="5" cols="60" id="description"
						name="description"></textarea></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td><input type="file" name="file1">
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="등록"
					onclick="product_write()"> <input type="button" value="목록"
					onclick="location.href='/shop/product/list.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>