<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light" style="flex-direction: column;">
	<div class="container px-4 px-lg-5 pt-2">
		<a class="navbar-brand fw-bolder" href="/market">똑Dog한 집사들의 장터</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<p>${contextPath}</p>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="nav-item"><a class="nav-link" href="/market/shop/prd-list?category=all&option=pop">랭킹</a></li>
				<li class="nav-item"><a class="nav-link" href="/market/shop/prd-list?category=all&option=new">신상품</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=all">전체</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=snack">간식</a></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=feed">사료</a></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=health">건강관리</a></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=potty">위생/배변</a></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=beauty">미용/목욕</a></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=feeder">급수기/급식기</a></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=kennel">하우스/울타리</a></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=vari-kennel">이동장</a></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=clothes">의류/악세서리</a></li>
						<li><a class="dropdown-item" href="/market/shop/prd-list?category=toy">장난감</a></li>
					</ul>
				</li>
			</ul>
			<div class="d-flex">
				<a class="btn" href="/" type="submit">커뮤니티로 이동</a>
				<c:if test="${not empty authentication}">
					<a class="btn" href="/market/mypage">MY PAGE</a>
					<a class="btn" href="/market/mypage/cart"><i class="bi-cart-fill"></i> 장바구니</a>
					<a class="btn" href="/member/logout"><i class="bi-cart-fill"></i> 로그아웃</a>
				</c:if>
				<c:if test="${empty authentication}">
					<a class="btn" href="/member/join">회원가입</a>
					<a class="btn" href="/member/login"><i class="bi-cart-fill"></i> 로그인</a>
				</c:if>
			</div>
		</div>
	</div>
</nav>
</body>