<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/mypage-head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/market/slick/slick.css">
<link rel="stylesheet" href="${contextPath}/resources/css/market/slick/slick-theme.css">

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
				<li><a href="#!">후기 작성</a></li>
				<li><a href="#!" style="color: black;">후기 내역</a></li>
			</ul>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<ul>
				<li>상품 사진을 포함한 상품 사진후기와 일반후기가 있습니다. 각각의 후기 작성 시, 기준에 맞는 적립금이 지급됩니다.</li>
				<li>모든 후기는 관리자 확인 후 적립금이 지급됩니다.</li>
				<li>모든 후기 작성은 구매확정일로부터 60일 내에 가능합니다.</li>
				<li>등록된 후기는 삭제/수정이 불가능 합니다.</li>
			</ul>
			<ul class="sub-ul pb-2">
				<li><a href="#!">전체</a></li>
				<li><a href="#!">승인</a></li>
				<li><a href="#!">승인 대기</a></li>
				<li><a href="#!">조건 미충족</a></li>
			</ul>
			<table class="n-table table-col">
				<colgroup>
					<col style="width: auto">
					<col style="width: 60%">
					<col style="width: 15%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품정보</th>
						<th scope="col">후기 내용</th>
						<th scope="col">후기 종류</th>
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
									<li class="option">${reviewList.PO_NAME}</li>
								</ul>
							</div>
						</td>
						<td>
							<div style="text-align: left; display: flex; float: left; flex-direction: column;">
								<p>2021.04.26 | <span style="color: royalblue;">승인</span></p>
								<div class="d-flex small text-warning my-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<p style="max-width: 90%;">우리 강아지가 너무 좋아해요 우리 강아지가 너무 좋아해요 우리 강아지가 너무 좋아해요 우리 강아지가 너무 좋아해요 우리 강아지가 너무 좋아해요</p>
								<div>
									<input id="likeBtn" type="checkbox" onclick="" style="display: none;">
									<label class="like-btn px-lg-2" for="likeBtn">
										<i class="fas fa-laugh-beam py-1" style="color: orange;"></i>도움돼요 3
									</label>
								</div>
							</div>
						</td>
						<td>
							<p>일반</p>
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
						<td>
							<div style="text-align: left; display: flex; float: left; flex-direction: column;">
								<p> 2021.04.26 | <span style="color: royalblue;">승인</span></p>
								<div class="slick_test3">
									<div class="px-4 px-lg-5 my-5">
										<img class="container" src="https://dummyimage.com/500x550/dee2e6/6c757d.jpg" style="max-height: 20rem; max-width: 20rem;">
									</div>
									<div class="px-4 px-lg-5 my-5">
										<img src="https://dummyimage.com/400x550/dee2e6/6c757d.jpg" style="max-height: 20rem; max-width: 20rem;">
									</div>
									<div class="px-4 px-lg-5 my-5">
										<img src="https://dummyimage.com/350x550/dee2e6/6c757d.jpg" style="max-height: 20rem; max-width: 20rem;">
									</div>
								</div>
								<div class="d-flex small text-warning my-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<p style="max-width: 90%;">우리 강아지가 너무 좋아해요 우리 강아지가 너무 좋아해요 우리 강아지가 너무 좋아해요 우리 강아지가 너무 좋아해요 우리 강아지가 너무 좋아해요</p>
								<div>
									<input id="likeBtn2" type="checkbox" onclick="" style="display: none;">
									<label class="like-btn px-lg-2" for="likeBtn2">
										<i class="fas fa-laugh-beam py-1" style="color: orange;"></i>도움돼요 3
									</label>
								</div>
							</div>
						</td>
						<td>
							<p>사진</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/slick.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/main-slick.js"></script>



</body>
</html>