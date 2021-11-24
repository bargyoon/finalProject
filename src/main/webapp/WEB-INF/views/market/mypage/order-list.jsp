<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/mypage-head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</head>
<body onscroll="checkHeight()">
	<%@ include file="/WEB-INF/views/include/market/market-nav.jsp"%>

	<header class="py-2 px-lg-5" style="margin-top: 3.5rem; min-height: 28rem;">
		<div class="px-4 px-lg-5 my-5 mx-5">
			<div>
				<h1 class="display-7 fw-bolder">My Page</h1>
			</div>
		</div>
		<div class="px-lg-5 mx-5" style="display: flex; justify-content: space-between;">
			<div class="px-lg-5" style="display: flex; min-width: 50%;">
				<img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" style="border-radius: 7rem;" />
				<div class="px-4 px-lg-5 my-3">
					<div>
						<div class="mt-4" style="display: flex; flex-direction: column;">
							<h1 class="display-4 fw-bolder">닉네임</h1>
							<div style="display: flex;">
								<h1 class="display-7 fw-bolder">회원등급</h1>
								<p class="px-lg-2 pt-1" style="color: lightgray;">가입일 : 2021.4.26</p>
							</div>
							<a class="fw-normal btn-" href="#!" style="text-decoration: none;">등급별 혜택 확인 <i class="fas fa-chevron-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="px-lg-5 mt-5 mx-5 pt-2" style="display: flex; justify-content: space-between; min-width: 20%">
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<i class="fas fa-coins py-2" style="font-size: 1.5rem;"></i>
					<p class="fw-normal mt-2">적립금</p>
					<p style="font-size: 1.3rem;">10,000</p>
				</div>
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<i class="fas fa-ticket-alt py-2" style="font-size: 1.5rem"></i>
					<p class="fw-normal mt-2">쿠폰</p>
					<p style="font-size: 1.3rem;">3장</p>
				</div>
			</div>
		</div>
	</header>

	<section class="py-5 mb-5" style="display: flex; justify-content: space-between; min-height: 50rem;">
		<aside>
			<div class="px-lg-4 aside-nav">
				<ul class="aside-ul">
					<li class="ft-SBAggroM" style="font-size: 1.3rem;">나의 쇼핑 활동</li>
					<li><hr class="dropdown-divider" /></li>
					<li><a href="#!">주문 내역 조회</a></li>
					<li><a href="#!">구매후기</a></li>
					<li><a href="#!">장바구니</a></li>
					<li><a href="#!">상품문의</a></li>
					<li><a href="#!" style="color: black;">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">주문 내역 조회</p>
			<ul class="sub-ul pb-2">
				<li><a href="#!">입금/결제</a></li>
				<li><a href="#!">배송중</a></li>
				<li><a href="#!">배송완료</a></li>
				<li><a href="#!">구매확정</a></li>
				<li><a href="#!">교환</a></li>
				<li><a href="#!">환불</a></li>
			</ul>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<ul>
				<li>상품 수령 후 일주일뒤 자동으로 구매확정상태가 되고, 교환/환불이 불가능합니다.</li>
				<li>교환, 환불, 배송 등 문의사항은 문의하기를 눌러주세요.</li>
				<li>주문번호가 동일하더라도 다른 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다.</li>
			</ul>
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
					<input type="date">
					<span>~</span>
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
				<c:forEach var="orderList" items="${orderList}">
				<tbody>
					<tr>
						<td>
							<div class="n-prd-row">
								<a href="#!"><img src="https://dummyimage.com/100x120/dee2e6/6c757d.jpg"></a>
								<ul class="info">
									<li class="brand">${orderList.BRAND}</li>
									<li class="name ft-SBAggroM"><a href="#!" style="text-decoration: none; color: black;">${orderList.NAME}</a></li>
									<li class="option">${orderList.PO_NAME}</li>
								</ul>
							</div>
						</td>
						<td><fmt:formatDate value="${orderList.ORDER_DATE}" pattern="yyyy-MM-dd"/></td>
						<td>202104260954500001</td>
						<td>${orderList.PAYMENT_AMOUNT}<br> ${orderList.ORDER_CNT}개
						</td>
						<td>
						<c:choose>
							<c:when test="${orderList.STATE eq 1}">
								<p class="ft-SBAggroM mb-3" style="font-size: 20px;">
								구매확정
								</p>
							</c:when>
						</c:choose>
							<p class="mb-2" style="border: 1px solid lightgray;">배송조회</p>
							<div class="text-white" href="#" role="button" style="background-color: black;">
								<div class="btn-group">
									<a class="nav-link link-white" href="#!">후기작성</a>
									<a class="nav-link dropdown-toggle text-white ps-0" id="navbarDropdown" role="button" data-bs-toggle="dropdown"></a>
									<ul class="dropdown-menu" style="text-align: center; min-width: 8rem;" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="/market/mypage/review/photo-form">상품 사진 후기</a></li>
										<li><a class="dropdown-item" href="/market/mypage/review/normal-form">일반후기</a></li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="n-prd-row">
								<a href="#!"><img src="https://dummyimage.com/100x120/dee2e6/6c757d.jpg"></a>
								<ul class="info">
									<li class="brand">브랜드</li>
									<li class="name ft-SBAggroM"><a href="#!" style="text-decoration: none; color: black;">제품명</a></li>
									<li class="option">옵션</li>
								</ul>
							</div>
						</td>
						<td>2021.04.26</td>
						<td>202104260954500001</td>
						<td>30,000원 <br> 1개
						</td>
						<td>
							<p class="ft-SBAggroM mb-3" style="font-size: 20px;">배송완료</p>
							<p class="mb-2" style="border: 1px solid lightgray;">구매확정</p>
							<div class="text-white" href="#" role="button" style="background-color: black;">
								<div class="btn-group">
									<a class="nav-link link-white" href="#!">문의하기</a>
									<a class="nav-link dropdown-toggle text-white ps-0" id="navbarDropdown" role="button" data-bs-toggle="dropdown"></a>
									<ul class="dropdown-menu" style="text-align: center; min-width: 8rem;" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="#!">환불신청</a></li>
										<li><a class="dropdown-item" href="#!">교환신청</a></li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>



</body>
</html>