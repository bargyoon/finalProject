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
				<img class="my-img" src="https://cdn.hellodd.com/news/photo/202005/71835_craw1.jpg" />
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
					<a href="/market/mypage/acc-money"><i class="fas fa-coins py-2" style="font-size: 1.5rem;"></i></a>
					<p class="fw-normal mt-2">적립금</p>
					<p style="font-size: 1.3rem;">${memberInfo.saveMoney}</p>
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
					<li><a href="/market/mypage">주문 내역 조회</a></li>
					<li><a href="/market/mypage/review/review-list2">구매후기</a></li>
					<li><a href="/market/mypage/cart">장바구니</a></li>
					<li><a href="/market/mypage/enquiry/enquiry-list" >구매상품문의</a></li>
					<li><a href="/market/mypage/address-list">주소록 관리</a></li>
					<li><a href="/market/mypage/enquiry/faq?type=1" style="color: black;">FAQ</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">1:1 문의</p>
			<ul class="cs-nav">
				<li><span class="ft-SBAggroM">Tel. 1234-4567</span><br>
				<span style="font-size: 12px;">평일: 09:00~18:00(점심 12:00~13:00)</span></li>
				<li>
					<a href="/market/mypage/enquiry/enquiry-list">
						<span class="ft-SBAggroM">1:1 Q&A</span><br>
						<span style="font-size: 12px;">질문 전 FAQ(자주 묻는 질문)을 먼저 확인하시면 도움이 됩니다.</span>
					</a>
				</li>
				<li>
					<a href="/market/mypage/enquiry/faq?type=1">
						<span class="ft-SBAggroM">FAQ</span><br>
						<span style="font-size: 12px;">자주 묻는 질문</span>
					</a>
				</li>
			</ul>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			
			<!-- 검색 -->
			<form id="faq-search" class="mb-3" action="" method="get">
				<p class="py-3 mb-0" style="font-size: 1rem;">FAQ</p>
				<input type="text" id="keyword" name="keyword" value="${keyword}">
				<a class="faq-search btn btn-outline-dark" id="btnSearch" 
					type="submit" href="">검색</a>
				
			</form>
			
			<ul class="faq-nav">
				<li><a class="selected" href="/market/mypage/enquiry/faq?type=1">주문/결제</a></li>
				<li><a href="/market/mypage/enquiry/faq?type=2">배송</a></li>
				<li><a href="/market/mypage/enquiry/faq?type=3">교환/환불</a></li>
				<li><a href="/market/mypage/enquiry/faq?type=4">회원관련</a></li>
				<li><a href="/market/mypage/enquiry/faq?type=5">신고</a></li>
				<li><a href="/market/mypage/enquiry/faq?type=6">상품 문의</a></li>
				<li><a href="/market/mypage/enquiry/faq?type=7">적립금</a></li>
				<li><a href="/market/mypage/enquiry/faq?type=8">기타 문의</a></li>
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
				
				<c:forEach var="faqList" items="${faqList}">
				<tbody>
					<tr>
						<td>${faqList.RNUM}</td>
						<td onclick="openFaq(${faqList.RNUM})">${faqList.TITLE}</td>
					</tr>
					<tr class="faq-answer" id="faq-answer-${faqList.RNUM}">
						<td>답변</td>
						<td>
							<p>${faqList.AW_CONTEXT}</p>
						</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
		<%-- <c:url var="getURL" value="/enquiry/enquiry-list"></c:url> --%>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/faq.js"></script>
	 <script>	
		
		$(document).on('click', '#btnSearch', function(e){
			
			e.preventDefault();	
			
			var url = document.location.href;
			var urlArr = url.split('&');
			url = urlArr[0];
			url = url + "&keyword=" + $('#keyword').val();	
			location.href = url;	
			console.log(url);
	
		});	
	
		
		</script> 

</body>
</html>