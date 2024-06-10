<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		$("#btnAdd").click(function() {
			location.href = "/shop/product/write.do";
		});
	});
</script>
<title>Product</title>
<style>
th {
	background: #ffb6c194;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>상품목록</h2>
	<!--  세션 확인 -->
	<c:if test="${sessionScope.admin_userid != null}">
		<button type="button" id="btnAdd">상품 등록</button>
	</c:if>
	<table border="1" width="500px">
		<tr>
			<th>상품ID</th>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>상품가격</th>
		</tr>
		<!--  var="레코드변수" items="리스트변수" -->
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.product_code}</td>
				<td align="center"><img src="/resources/images/${row.filename}"
					width="100px" height="100px"></td>
				<td><a href="/shop/product/detail/${row.product_code}">${row.product_name}</a>
					<c:if test="${sessionScope.admin_userid != null}">
						<br>
						<a href="/shop/product/edit/${row.product_code}">[편집]</a>
					</c:if></td>
				<td><fmt:formatNumber value="${row.price}" pattern="#,###" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>