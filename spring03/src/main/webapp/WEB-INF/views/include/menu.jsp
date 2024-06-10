<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="/">HOME</a>
|
<a href="/upload/input.do">업로드 테스트</a>
|
<a href="/shop/product/list.do">상품목록</a>
|
<c:if test="${sessionScope.admin_userid != null}">
	<a href="/shop/product/write.do">상품등록</a> |
</c:if>
<a href="/shop/cart/list.do">장바구니</a>
|
<a href="/pdf/list.do">PDF</a>
|
<a href="/chart/chart1.do">구글차트(json)</a>
|
<a href="/chart/chart2.do">구글차트(db)</a>
|
<a href="/jchart/chart1.do">JFreeChart(png)</a>
|
<a href="/jchart/chart2.do">JFreeChart(pdf)</a>
|
<a href="/email/write.do">이메일 발송</a>
|
<a href="/member/address.do">도로명 주소</a>
|
<a href="/upload/ajax_form">파일업로드(ajax)</a>
|
<a href="/board/list.do">게시판</a>
|
<div style="text-align: right;">
	<c:choose>
		<c:when test="${sessionScope.userid == null}">
			<a href="/member/login.do">로그인</a> |
	<a href="/admin/login.do">관리자 로그인</a>
		</c:when>
		<c:otherwise>
	${sessionScope.name}님이 로그인 중입니다.
	<a href="/member/logout.do">로그아웃</a> |
	<a href="/admin/logout.do">관리자 로그아웃</a>
		</c:otherwise>
	</c:choose>
</div>
<hr>