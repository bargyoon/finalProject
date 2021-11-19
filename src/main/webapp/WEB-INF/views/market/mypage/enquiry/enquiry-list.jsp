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
					<li><a href="#!">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">상품문의</p>
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
					<col style="width: 45%">
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품정보</th>
						<th scope="col">내용</th>
						<th scope="col">문의 유형</th>
						<th scope="col">작성일</th>
						<th scope="col">처리 상태</th>
					</tr>
				</thead>
				<tbody>
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
						<td class="enquiry_title text-start" onclick="openEnquiry()">배송 언제쯤 도착할까요 ?</td>
						<td>배송문의</td>
						<td>2021.08.15</td>
						<td style="color: steelblue;">답변 완료</td>
					</tr>
					<tr class="enquiry_context eq-click">
						<td>&nbsp;</td>
						<td class="text-start" colspan="3">작년에 시켰는데 택배 언제 도착할까요 ?</td>
						<td>&nbsp;</td>
					</tr>
					<tr class="eq-click">
						<td>스토어 담당자<br>윤수환</td>
						<td colspan="3" class="text-start">
							<p class="enquiry-answer" style="line-height: 2rem;">
								안녕하세요 똑Dog한 집사들 장터 고객센터 입니다.<br>
								먼저, 이용에 불편을 끼쳐 드린 점 진심으로 사과드립니다.<br>
								확인결과 고객님의 상품은 내년에 도착합니다.<br>
								다른 도움이 필요하시다면 고객센터(1234-4567)로 문의 부탁드립니다.<br>
								언제나 고객님의 편안한 쇼핑을 위하여 최선을 다하는 똑Dog한 집사들의 장터가 되겠습니다.<br>
								감사합니다.
							</p>
						</td>
						<td style="font-size: 14px;">21.08.16<br>15:31</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/enquiry-list.js"></script>



</body>
</html>