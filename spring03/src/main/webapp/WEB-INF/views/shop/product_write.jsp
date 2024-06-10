<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <%@ include file="../include/session_check.jsp"%> --%>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
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
				<td>
				<textarea rows="5" cols="60" id="description" name="description"></textarea>
				<!-- textarea를 스마트에디터로 변경 -->
				<script>
				// CKEDITOR.replace("description"); // 태그의 id
				// 이미지 업로드를 할 경우
				CKEDITOR.replace("description", {
					filebrowserUploadUrl : "/imageUpload.do"
				});
				</script>
				</td>
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