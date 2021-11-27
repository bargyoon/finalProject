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
					<i class="fas fa-coins py-2" style="font-size: 1.5rem;"></i>
					<p class="fw-normal mt-2">적립금</p>
					<p style="font-size: 1.3rem;">${memberInfo.saveMoney}</p>
				</div>
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<i class="fas fa-ticket-alt py-2" style="font-size: 1.5rem"></i>
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
					<li><a href="/market/mypage">주문 내역 조회</a></li>
					<li><a href="/market/mypage/review/review-list2">구매후기</a></li>
					<li><a href="/market/mypage/cart">장바구니</a></li>
					<li><a href="#!">상품문의</a></li>
					<li><a href="#!">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">적립금</p>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<ul class="acc-money-ul">
				<li>현재적립금</li>
				<li>${memberInfo.saveMoney} 원</li>
			</ul>
			<ul class="acc-note">
				<li>적립금은 구매 확정 시 지급됩니다. (별도의 구매 확정이 없더라도 상품 수령 후 7일이 지난 경우에는 자동 구매 확정 됩니다.)</li>
				<li>구매 후기 작성 시 적립금 지급됩니다.</li>
				<li>적립금은 상품 금액의 5%까지만 사용 가능합니다.</li>
			</ul>
			<ul class="sub-ul pt-4 pb-2">
				<li><a href="/market/mypage/acc-money">전체</a></li>
				<li><a href="/market/mypage/acc-money?state=0">적립</a></li>
				<li><a href="/market/mypage/acc-money?state=1">사용</a></li>
			</ul>
			<table class="simple-table">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 17%;">
					<col style="width: auto;">
					<col style="width: 23%;">
				</colgroup>
				<thead>
					<tr>
						<td>상태</td>
						<td>적립금</td>
						<td>적립 내용</td>
						<td>적용 일시</td>
					</tr>
				</thead>
				<c:forEach var="reserveList" items="${reserveList}">
				<tbody>
					<tr>
					<c:choose>
						<c:when test="${reserveList.STATE eq '1'}"> <!-- 1일 때 적립 -->
							<td class="acc-state">적립</td>
						</c:when>
						<c:when test="${reserveList.STATE ne '1'}">
							<td class="acc-state">사용</td>
						</c:when>
					</c:choose>
					
						<td class="acc-amount">+${reserveList.AMOUNT}</td>
						<td class="acc-context">
							<ul>
							<c:choose>
							 <c:when test="${reserveList.TYPE == '1'}"><li class="acc-reason">일반 후기 작성 적립금 지급</li></c:when>
							 <c:when test="${reserveList.TYPE == '2'}"><li class="acc-reason">상품 사진 후기 작성 적립금 지급</li></c:when>
							 <c:when test="${reserveList.TYPE == '3'}"><li class="acc-reason">주문 적립</li></c:when>
							</c:choose>
								<li class="acc-prd">${reserveList.NAME}</li>
							</ul>
						</td>
						<td class="acc-date"><fmt:formatDate value="${reserveList.REG_DATE}" pattern="yyyy-MM-dd"/></td>
					</tr>
				
				</tbody>
				</c:forEach>
			</table>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/acc-money.js"></script>



</body>
</html>