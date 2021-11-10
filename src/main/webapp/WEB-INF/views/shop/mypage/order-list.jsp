<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<title>똑Dog한 집사들의 장터 - 마이 페이지</title>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/shop/mymage.css" />
</head>
<body>
	<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand fw-bolder" href="#!">똑Dog한 집사들의 장터</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
				data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link" href="#!">기획전</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">랭킹</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">신상품</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
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
						</ul></li>
				</ul>
				<div class="d-flex">
					<button class="btn" type="submit">커뮤니티로 이동</button>
					<a class="btn" href="#!">MY PAGE</a>
					<button class="btn" type="submit">
						<i class="bi-cart-fill"></i> 장바구니 
						<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
				</div>
			</div>
		</div>
	</nav>
	
	
	
	
	<header class="bg-dark py-2"
		style="margin-top: 3.5rem; min-height: 28rem;">
		<div class="px-4 px-lg-5 my-5 mx-5">
			<div class="text-white">
				<h1 class="display-7 fw-bolder">My Page</h1>
			</div>
		</div>
		<div class="px-lg-5 mx-5" style="display: flex; justify-content: space-between;">
			<div class="px-lg-5" style="display: flex; min-width: 50%;">
				<img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" style="border-radius: 7rem;" />
				<div class="px-4 px-lg-5 my-3">
					<div class="text-white">
						<div class="mt-4" style="display: flex; flex-direction: column;">
							<h1 class="display-4 fw-bolder">닉네임</h1>
							<div style="display: flex;">
								<h1 class="display-7 fw-bolder">회원등급</h1>
								<p class="fw-normal text-white-50 px-lg-2 pt-1">가입일 :
									2021.4.26</p>
							</div>
							<a class="fw-normal text-white-50" href="#!"
								style="text-decoration: none;">등급별 혜택 확인 </a>
						</div>
					</div>
				</div>
			</div>
			<div class="px-lg-5 mt-5 mx-5 pt-2"
				style="display: flex; justify-content: space-between; min-width: 30%">
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<i class="fas fa-coins py-2" style="color: white; font-size: 1.5rem;"></i>
					<p class="fw-normal text-white-50 mt-2">적립금</p>
					<p class="text-white" style="font-size: 1.3rem;">10,000</p>
				</div>
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<i class="fab fa-product-hunt py-2" style="color: white; font-size: 1.5rem"></i>
					<p class="fw-normal text-white-50 mt-2">포인트</p>
					<p class="text-white" style="font-size: 1.3rem;">10,000</p>
				</div>
				<a class="mt-5" style="display: flex; flex-direction: column; text-decoration: none;">
					<i class="fas fa-ticket-alt py-2" style="color: white; font-size: 1.5rem"></i>
					<p class="fw-normal text-white-50 mt-2">쿠폰</p>
					<p class="text-white" style="font-size: 1.3rem;">3장</p>
				</a>
			</div>
		</div>
	</header>
	
	
	
	
	<section class="py-5 mb-5"
		style="display: flex; justify-content: space-between; min-height: 50rem;">
		<aside>
			<div class="px-lg-4 aside-nav">
				<ul class="aside-ul">
					<li class="ft-SBAggroM" style="font-size: 1.3rem;">나의 쇼핑 활동</li>
					<li><hr class="dropdown-divider" /></li>
					<li><a href="#!" style="color: black;">주문 내역 조회</a></li>
					<li><a href="#experience">구매후기</a></li>
					<li><a href="#education">장바구니</a></li>
					<li><a href="#skills">상품문의</a></li>
					<li><a href="#interests">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">주문 내역 조회</p>
			<ul class="sub-ul pb-2">
				<li><a href="file:///C:/Users/djffk/OneDrive/바탕%20화면/final_project_view_test/mypage/order-list.html">입금/결제</a></li>
				<li><a href="#experience">배송중</a></li>
				<li><a href="#education">배송완료</a></li>
				<li><a href="#skills">구매확정</a></li>
				<li><a href="#interests">교환</a></li>
				<li><a href="#awards">환불</a></li>
			</ul>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<div class="mt-5 n-table-filter">
				<div class="n-radio-tab">
					<input type="radio" id="radioOfPeriod0" name="radioOfPeriod">
					<label class="period-label" for="radioOfPeriod0">1주일</label>
					<input type="radio" id="radioOfPeriod1" name="radioOfPeriod">
					<label class="period-label" for="radioOfPeriod1">1개월</label>
					<input type="radio" id="radioOfPeriod2" name="radioOfPeriod">
					<label class="period-label" for="radioOfPeriod2">3개월</label> 
					<input type="radio" id="radioOfPeriod3" name="radioOfPeriod">
					<label class="period-label" for="radioOfPeriod3">전체 시기</label>
				</div>
				<div class="n-datepicker">
					<input type="date"> <span>~</span>
				</div>
				<div class="n-datepicker">
					<input type="date">
				</div>
				<button type="button" onclick="search();">조회</button>
			</div>
			<table class="n-table table-col">
				<colgroup>
					<col style="width: auto">
					<col style="width: 16%">
					<col style="width: 16%">
					<col style="width: 16%">
					<col style="width: 12%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품정보</th>
						<th scope="col">주문일자</th>
						<th scope="col">주문번호</th>
						<th scope="col">주문금액(수량)</th>
						<th scope="col">주문 상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="n-prd-row">
								<a href="#!"> <img
									src="https://dummyimage.com/100x120/dee2e6/6c757d.jpg">
								</a>
								<ul class="info">
									<li class="brand">브랜드</li>
									<li class="name ft-SBAggroM"><a href="#!"
										style="text-decoration: none; color: black;">제품명</a></li>
									<li class="option">옵션</li>
								</ul>
							</div>
						</td>
						<td>2021.04.26</td>
						<td>202104260954500001</td>
						<td>50,000원 <br> 1개
						</td>
						<td>
							<p class="ft-SBAggroM mb-1" style="font-size: 20px;">구매확정</p>
							<p style="border: 1px solid lightgray;">배송조회</p>
							<p class="text-white" id="navbarDropdown" href="#" role="button"
								data-bs-toggle="dropdown" style="background-color: black;">후기작성</p>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#!">일반 후기</a></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item" href="#!">상품 사진 후기</a></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>

	<aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="upBtn()">
		<i class="fas fa-arrow-alt-circle-up"></i>
	</aside>
	
	
	
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p>
		</div>
	</footer>
	
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/shop/main.js"></script>

</body>
</html>