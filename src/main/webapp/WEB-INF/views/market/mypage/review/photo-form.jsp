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
					<li><a href="#!" style="color: black">구매후기</a></li>
					<li><a href="#!">장바구니</a></li>
					<li><a href="#!">상품문의</a></li>
					<li><a href="#!">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">상품 사진 후기 작성</p>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<ul>
				<li>상품 사진 후기 작성시 600원의 적립금을 평일 기준 2일 전후로 지급합니다.</li>
				<li>등록하신 후기는 공개되어 회원이 조회 가능하며, 댓글이 등록될 수 있습니다.</li>
				<li>작성된 후기는 사이트의 홍보 콘텐츠로 사용될 수 있습니다.</li>
				<li>아래에 해당할 경우 적립금 지급이 보류되며, 이미 지급받으셨더라도 2차 검수를 통해 적립금을 회수할 수 있고 블라인드 처리 및 계정 제재의 사유가 됩니다.
					<ul style="font-size: 13px;">
						<li>이메일, 휴대전화 번호 등 개인정보/광고/비속어가 포함된 후기</li>
						<li>상품 상세 페이지 등의 판매 이미지 사용, 관련없는 상품의 사진, 타인의 사진을 도용한 후기</li>
						<li>상품과 관련없거나 문자 및 기호의 단순 나열, 반복된 내용의 후기</li>
						<li>상품의 전체 형태가 또렷하게 보이지 않는 후기</li>
					</ul>
				</li>
			</ul>
			<div class="d-flex n-prd-row pt-4">
				<a href="#!"><img src="https://dummyimage.com/100x120/dee2e6/6c757d.jpg"></a>
				<ul class="info p-4">
					<li class="brand">브랜드</li>
					<li class="name ft-SBAggroM"><a href="#!" style="text-decoration: none; color: black;">제품명</a></li>
					<li class="option">${reviewList.PO_NAME}</li>
				</ul>
			</div>
			<form action="" method="post" enctype="multipart/form-data">
				<div class="d-flex pt-2">
					<p class="label">
						제품에 대해 나의 별점은 ?<br>
						<span style="font-size: 12px;">(선택하지 않을 시 별 5개로 선택됩니다.)</span>
					</p>
					<div class="d-flex star_area px-lg-5"
						style="transform: translateY(20%);">
						<input type="radio" name="star-rating" value="1" id="star1">
						<label for="star1" class="bi-star-fill star"></label>
						<input type="radio" name="star-rating" value="2" id="star2">
						<label for="star2" class="bi-star-fill star"></label>
						<input type="radio" name="star-rating" value="3" id="star3">
						<label for="star3" class="bi-star-fill star"></label>
						<input type="radio" name="star-rating" value="4" id="star4">
						<label for="star4" class="bi-star-fill star"></label>
						<input type="radio" name="star-rating" value="5" id="star5">
						<label for="star5" class="bi-star-fill star"></label>
					</div>
				</div>
				<hr>
				<div class="d-flex my-4 photo_ex">
					<i class="p-4 fas fa-images" style="font-size: 7rem;"></i>
					<div class="px-lg-3 py-3">
						<p class="ft-SBAggroM mb-1">상품 사진 후기 작성 예시</p>
						<ul class="px-lg-4" style="font-size: 14px;">
							<li>또렷하게 보이도록 상품 전체를 직접 촬영한 사진을 등록해야 합니다.</li>
							<li>사진은 최대 5개까지 업로드가 가능합니다.</li>
						</ul>
						<input id="input_img" type="file" name="files" accept="image/*" multiple>
					</div>
				</div>
				<p>업로드 사진 미리보기는 최대 3개만 보여집니다.</p>
				<div class="pb-3" id="preview_imgs"></div>
				<hr>
				<p>상품에 대한 평가를 20자 이상 남겨주세요.</p>
				<div class="container2" style="padding: 0;">
					<textarea class="review_text" placeholder="내용" name="review-content" onkeyup=""></textarea>
					<p class="limit_text_alert">0 자 / 20자 이상</p>
				</div>
				<div>
					<input type="checkbox" name="ad-check" id="ad_agree">
					<label class="ad_check_label px-1" for="ad_agree">작성된 후기는 사이트의 홍보 콘텐츠로 사용될 수 있습니다. (필수)</label>
				</div>
				<div class="d-flex py-3" style="justify-content: center;">
					<button type="button" class="py-2 px-lg-5 btn btn-outline-dark" style="font-size: 14px;" onclick="">등록</button>
				</div>
			</form>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/review-photo.js"></script>



</body>
</html>