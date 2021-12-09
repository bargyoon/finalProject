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
				<img class="my-img" src="https://cdn.hellodd.com/news/photo/202005/71835_craw1.jpg" />
				<div class="px-4 px-lg-5 my-3 pf-div">
					<div>
						<div class="mt-4" style="display: flex; flex-direction: column;">
							<h1 class="display-4 fw-bolder">${memberInfo.nickName}</h1>
							<div style="display: flex;">
								<p class="px-lg-2 pt-1" style="color: lightgray;">가입일 : ${memberInfo.joinDate}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="px-lg-5 mt-5 mx-5 pt-2" style="display: flex; justify-content: space-between; min-width: 20%">
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<a href="/market/mypage/acc-money"><i class="fas fa-coins py-2" style="font-size: 1.5rem;"></i></a>
					<p class="fw-normal mt-2">적립금</p>
					<p style="font-size: 1.3rem;"><fmt:formatNumber value="${memberInfo.saveMoney}"/> 원</p>
				</div>
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<a href="/market/mypage/coupon-list"><i class="fas fa-ticket-alt py-2" style="font-size: 1.5rem"></i></a>
					<p class="fw-normal mt-2">쿠폰</p>
					<p style="font-size: 1.3rem;">${couponCnt}장</p>
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
					<li><a href="/market/mypage" style="color: black;">주문 내역 조회</a></li>
					<li><a href="/market/mypage/review/review-list2">구매후기</a></li>
					<li><a href="/market/mypage/cart">장바구니</a></li>
					<li><a href="/market/mypage/address-list">주소록 관리</a></li>
					<li><a href="/market/mypage/enquiry/enquiry-list">구매상품문의</a></li>
					<li><a href="/market/mypage/enquiry/faq?type=1">FAQ</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">주문 내역 조회</p>
			<ul class="order-nav sub-ul pb-2">
				<li><a class="selected" href="/market/mypage">전체 조회</a></li>
				<li><a href="/market/mypage?state=newOrder">입금/결제</a></li>
				<li><a href="/market/mypage?state=delivering">배송중</a></li>
				<li><a href="/market/mypage?state=deliverComplete">배송완료</a></li>
				<li><a href="/market/mypage?state=orderComplete">구매확정</a></li>
				<li><a href="/market/mypage?state=exchange">교환</a></li>
				<li><a href="/market/mypage?state=newRefund">환불</a></li>
			</ul>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<ul>
				<li>상품 수령 후 일주일뒤 자동으로 구매확정상태가 되고, 교환/환불이 불가능합니다.</li>
				<li>교환, 환불, 배송 등 문의사항은 문의하기를 눌러주세요.</li>
				<li>주문번호가 동일하더라도 다른 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다.</li>
			</ul>
			
			<!-- 날짜검색 -->
			<div class="mt-5 n-table-filter">
				<div class="n-radio-tab">
						<input type="radio" id="radioOfPeriod0" name="period" value="1" onclick="setDate()">
						<label class="period-label" for="radioOfPeriod0">1주일</label>
						<input type="radio" id="radioOfPeriod1" name="period" value="2" onclick="setDate()">
						<label class="period-label" for="radioOfPeriod1">1개월</label>
						<input type="radio" id="radioOfPeriod2" name="period" value="3" onclick="setDate()">
						<label class="period-label" for="radioOfPeriod2">3개월</label>
						<input type="radio" id="radioOfPeriod3" name="period" value="4" onclick="setDate()">
						<label class="period-label" for="radioOfPeriod3">전체 시기</label>
					</div>
				<form action="" id="dateForm" onsubmit="return resetDate();">
						<div class="n-datepicker">
							<input type="date" id="fromDate" name="fromDate"><span> ~</span>
						</div>
						<div class="n-datepicker">
							<input type="date" id="endDate" name="endDate">
						</div>
						<button class="order-search" type="submit" onclick="search();">조회</button>
				</form>
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
								<a href="#!"><img src="${orderList.downloadURL}"></a>
								<ul class="info">
									<li class="brand">${orderList.BRAND}</li>
									<li class="name ft-SBAggroM"><a href="#!" style="text-decoration: none; color: black;">${orderList.NAME}</a></li>
									<li class="option">${orderList.PO_NAME}</li>
								</ul>
							</div>
						</td>
						<td><fmt:formatDate value="${orderList.ORDER_DATE}" pattern="yyyy-MM-dd"/></td>
						<td>${orderList.ORDER_IDX}</td>
						<td>${orderList.PAYMENT_AMOUNT}원<br> ${orderList.ORDER_CNT}개
						</td>
						<td>
						<c:choose>
							<c:when test="${orderList.STATE eq 'newOrder'}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">입금/결제</p></c:when>
							<c:when test="${orderList.STATE eq 'delivering'}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">배송중</p></c:when>
							<c:when test="${orderList.STATE eq 'deliverComplete'}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">배송완료</p></c:when>
							<c:when test="${orderList.STATE eq 'orderComplete'}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">구매확정</p></c:when>
							<c:when test="${orderList.STATE eq 'exchange'}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">교환</p></c:when>
							<c:when test="${orderList.STATE eq 'newRefund'}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">환불</p></c:when>
						</c:choose>
						
						<c:if test="${(orderList.STATE eq 'delivering')}">
							<p class="mb-2" style="border: 1px solid lightgray;">배송조회</p>
						</c:if>
							<!-- 구매확정/배송완료 상태만 후기작성 버튼 보임 -->
							<c:if test="${(orderList.STATE eq 'orderComplete' || orderList.STATE eq 'deliverComplete') and orderList.IS_REVIEW eq 0}">
							<div class="text-white" href="#" role="button" style="background-color: black;">
								<div class="btn-group">
									<a class="nav-link link-white" href="#!">후기작성</a>
									<a class="nav-link dropdown-toggle text-white ps-0" id="navbarDropdown" role="button" data-bs-toggle="dropdown"></a>
									<ul class="dropdown-menu" style="text-align: center; min-width: 8rem;" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="/market/mypage/review/photo-form?orderIdx=${orderList.ORDER_IDX}">상품 사진 후기</a></li>
										<li><a class="dropdown-item" href="/market/mypage/review/normal-form?orderIdx=${orderList.ORDER_IDX}">일반후기</a></li>
									</ul>
								</div>
							</div>
							</c:if>
						</td>
					</tr>
					
					
				</tbody>
				</c:forEach>
			</table>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/date-search.js"></script>
	<script type="text/javascript">
		let tabBtns = document.querySelector('.order-nav').children;
		for (var i = 0; i < tabBtns.length; i++) {
			let tabBtn = tabBtns[i].children[0];
			
			if(tabBtn.href==document.location.href){
				tabBtn.classList.add('selected');
			}else{
				tabBtn.classList.remove('selected');
			}
		}
	</script>

</body>
</html>