<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light" style="flex-direction: column;">
	<div class="container banner-area">
		<a class="banner-link" href="#!" style="background-image: url('${contextPath}/resources/img/market/banner_sample.jpg');"></a>
	</div>
	<div class="container px-4 px-lg-5 pt-2">
		<a class="navbar-brand fw-bolder" href="#!">똑Dog한 집사들의 장터</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<p>${contextPath}</p>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="nav-item"><a class="nav-link" href="#!">기획전</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">랭킹</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">신상품</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#!">모든 상품</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#!">간식</a></li>
						<li><a class="dropdown-item" href="#!">사료</a></li>
						<li><a class="dropdown-item" href="#!">건강관리</a></li>
						<li><a class="dropdown-item" href="#!">위생/배변</a></li>
						<li><a class="dropdown-item" href="#!">미용/목욕</a></li>
						<li><a class="dropdown-item" href="#!">급수기/급식기</a></li>
						<li><a class="dropdown-item" href="#!">하우스/울타리</a></li>
						<li><a class="dropdown-item" href="#!">이동장</a></li>
						<li><a class="dropdown-item" href="#!">의류/악세서리</a></li>
						<li><a class="dropdown-item" href="#!">장난감</a></li>
					</ul>
				</li>
			</ul>
			<div class="d-flex">
				<button class="btn" type="submit">커뮤니티로 이동</button>
				<a class="btn" href="#!">MY PAGE</a>
				<button class="btn" type="submit">
					<i class="bi-cart-fill"></i> 장바구니 <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
				</button>
			</div>
		</div>
	</div>
</nav>
</body>