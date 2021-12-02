<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/mypage-head.jsp"%>

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
					<li><a href="#!" style="color: black;">상품문의</a></li>
					<li><a href="/market/mypage/address-list">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">1:1 문의</p>
			<ul class="cs-nav">
				<li><span class="ft-SBAggroM">Tel. 1234-4567</span><br>
				<span style="font-size: 12px;">평일: 9:00~18:00(점심 12:00~13:00)</span></li>
				<li>
					<a href="#!">
						<span class="ft-SBAggroM">1:1 Q&A</span><br>
						<span style="font-size: 12px;">질문 전 FAQ(자주 묻는 질문)을 먼저 확인하시면 도움이 됩니다.</span>
					</a>
				</li>
				<li>
					<a href="#!">
						<span class="ft-SBAggroM">FAQ</span><br>
						<span style="font-size: 12px;">자주 묻는 질문</span>
					</a>
				</li>
			</ul>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<form id="faq-search" class="mb-3" action="" method="get">
				<p class="py-3 mb-0" style="font-size: 1rem;">FAQ</p>
				<input type="text" name="faq_search_value"><a class="btn btn-outline-dark" type="submit" href="#!">검색</a>
			</form>
			<ul class="faq-nav">
				<li><a href="faq-type-1">주문/결제</a></li>
				<li><a href="faq-type-2">배송</a></li>
				<li><a href="faq-type-3">교환/환불</a></li>
				<li><a href="faq-type-4">회원관련</a></li>
				<li><a href="faq-type-5">신고</a></li>
				<li><a href="faq-type-6">상품 문의</a></li>
				<li><a class="faq-type-7" href="faq-type-7">적립금</a></li>
				<li><a href="faq-type-8">기타 문의</a></li>
			</ul>
			<table class="n-table table-col faq-table">
				<colgroup>
					<col style="width: 10%">
					<col style="width: 90%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td onclick="openFaq(1)">재고가 없어요. 언제쯤 구입할 수 있을까요?</td>
					</tr>
					<tr class="faq-answer" id="faq-answer-1">
						<td>답변</td>
						<td>
							<p>일반적으로 입점 업체의 품절 상품 재입고 여부 및 일정은 무신사 스토어에서는 정확히 알기 어렵습니다.
							재입고 여부는 상품 상세 페이지의 상품문의 게시판을 통하여 문의하시는 것이 가장 정확합니다. 재입고 알림을
							등록하시면 재입고 알림 문자를 받아보실 수 있습니다.</p>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td onclick="openFaq(2)">가격이 떨어져 예전에 구매했을 때 보다 싸게 팔고 있는 경우 차액 환불이 되나요?</td>
					</tr>
					<tr class="faq-answer" id="faq-answer-2">
						<td>답변</td>
						<td>
							<p>판매 가격의 변동에 따른 차액을 보상해드리지 않습니다.</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/faq.js"></script>



</body>
</html>