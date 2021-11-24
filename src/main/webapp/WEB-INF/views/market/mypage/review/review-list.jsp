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
					<li><a href="#!" style="color: black">구매후기</a></li>
					<li><a href="#!">장바구니</a></li>
					<li><a href="#!">상품문의</a></li>
					<li><a href="#!">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">구매 후기</p>
			<ul class="sub-ul pb-2">
				<li><a href="#!" style="color: black;">후기 작성</a></li>
				<li><a href="#!">후기 내역</a></li>
			</ul>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<ul>
				<li>상품 사진을 포함한 상품 사진후기와 일반후기가 있습니다. 각각의 후기 작성 시, 기준에 맞는 적립금이 지급됩니다.</li>
				<li>모든 후기는 관리자 확인 후 적립금이 지급됩니다.</li>
				<li>모든 후기 작성은 구매확정일로부터 60일 내에 가능합니다.</li>
				<li>등록된 후기는 삭제/수정이 불가능 합니다.</li>
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
					<input type="date"><span>~</span>
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
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품정보</th>
						<th scope="col">구매확정일</th>
						<th scope="col">상품 사진 후기</th>
						<th scope="col">일반 후기</th>
					</tr>
				</thead>
				<c:forEach var="reviewList" items="${reviewList}">
				<tbody>
					<tr>
						<td>
							<div class="n-prd-row">
								<a href="#!"><img src="https://dummyimage.com/100x120/dee2e6/6c757d.jpg"></a>
								<ul class="info">
									<li class="brand">${reviewList.BRAND}</li>
									<li class="name ft-SBAggroM"><a href="#!" style="text-decoration: none; color: black;">${reviewList.NAME}</a></li>
									<li class="option">${reviewList.PO_NAME}</li>
								</ul>
							</div>
						</td>
						<td><fmt:formatDate value="${reviewList.ORDER_DATE}" pattern="yyyy-MM-dd"/><br>
						</td>
						<td><a class="btn-review" href="/market/mypage/review/photo-form">작성하기</a></td>
						<td><a class="btn-review" href="/market/mypage/review/normal-form">작성하기</a></td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>



</body>
</html>