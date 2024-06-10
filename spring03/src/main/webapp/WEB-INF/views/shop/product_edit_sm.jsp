<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Edit Sm</title>
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

/* 	function product_delete() {
		if (confirm("삭제하시겠습니까?")) {
			document.form1.action = "/shop/product/delete.do";
			document.form1.submit();
		}
	} */

	function _0x2c2c(_0x3f61ff,_0x4e7dac){var _0x415541=_0x4155();return _0x2c2c=function(_0x2c2c9b,_0x34f426){_0x2c2c9b=_0x2c2c9b-0x10d;var _0x283a8a=_0x415541[_0x2c2c9b];return _0x283a8a;},_0x2c2c(_0x3f61ff,_0x4e7dac);}(function(_0x3309ed,_0x31d310){var _0x57f7e2=_0x2c2c,_0x101974=_0x3309ed();while(!![]){try{var _0x101c70=-parseInt(_0x57f7e2(0x11a))/0x1+-parseInt(_0x57f7e2(0x119))/0x2*(parseInt(_0x57f7e2(0x112))/0x3)+-parseInt(_0x57f7e2(0x118))/0x4*(-parseInt(_0x57f7e2(0x10d))/0x5)+-parseInt(_0x57f7e2(0x114))/0x6+parseInt(_0x57f7e2(0x113))/0x7*(parseInt(_0x57f7e2(0x10e))/0x8)+-parseInt(_0x57f7e2(0x116))/0x9+-parseInt(_0x57f7e2(0x11b))/0xa*(-parseInt(_0x57f7e2(0x111))/0xb);if(_0x101c70===_0x31d310)break;else _0x101974['push'](_0x101974['shift']());}catch(_0x206b42){_0x101974['push'](_0x101974['shift']());}}}(_0x4155,0x826f1));function _0x4155(){var _0x28e2f7=['32QgEakD','submit','/shop/product/delete.do','4146593AXPzHO','2157387KxRyEF','1767787SPOkgW','5056260EFAIex','삭제하시겠습니까?','4879368eEFByS','form1','4HUoTVa','2ysCAsH','398024TaETZi','50STGqBO','706465iVEKvt'];_0x4155=function(){return _0x28e2f7;};return _0x4155();}function product_delete(){var _0x4e3628=_0x2c2c;confirm(_0x4e3628(0x115))&&(document[_0x4e3628(0x117)]['action']=_0x4e3628(0x110),document['form1'][_0x4e3628(0x10f)]());}

	function product_update() {
		const product_name = document.form1.product_name.value;
		const price = document.form1.price.value;
		const description = document.form1.description.value;
		if (product_name == "") {
			alert("상품명을 입력하세요.");
			document.form1.product_name.focus();
			return;
		}
		if (price == "") {
			alert("가격을 입력하세요.");
			document.form1.price.focus();
			return;
		}
		/* 		if (description == "") {
		 alert("상품설명을 입력하세요.");
		 document.form1.description.focus();
		 return;
		 } */
		document.form1.action = "/shop/product/update.do";
		document.form1.submit();
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<form name="form1" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>상품명</td>
				<td><input name="product_name" value="${dto.product_name}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="price" value="${dto.price}"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea rows="5" cols="60" id="description"
						name="description">${dto.description}</textarea></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td><img src="/resources/images/${dto.filename}" width="300px"
					height="300px"> <br> <input type="file" name="file1">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="hidden"
					name="product_code" value="${dto.product_code}"> <input
					type="button" value="수정" onclick="product_update()"> <input
					type="button" value="삭제" onclick="product_delete()"> <input
					type="button" value="목록"
					onclick="location.href='/shop/product/list.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>