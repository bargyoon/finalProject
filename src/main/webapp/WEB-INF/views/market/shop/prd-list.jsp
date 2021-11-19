<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/shop-head.jsp"%>

</head>
<body onscroll="checkHeight()">
	<%@ include file="/WEB-INF/views/include/market/market-nav.jsp"%>

	<section class="pt-5 pb-3" style="margin-top: 8rem;">
		<div class="container text-center mt-5 prd-category">
			<p class="display-7 fw-bolder">이벤트 / 후기</p>
		</div>
	</section>

	<section class="px-lg-4 mt-5 container" style="min-height: 40rem;">
		<div class="category-title px-lg-5">
			<div style="transform: translateY(30%);">
				<span class="category-name ps-4 pe-2">전체</span>
				<span class="category-prd-cnt">55</span>
			</div>
			<input class="checkbox" type="checkbox" id="reg-log">
			<label for="reg-log" class="reg-label"></label>
			<div class="d-flex justify-content-end">
				<ul class="sort-option">
					<li><button class="sort-option-btn">인기순</button></li>
					<li><button class="sort-option-btn">신상품순</button></li>
					<li><button class="sort-option-btn">최저가격순</button></li>
					<li><button class="sort-option-btn">최고가격순</button></li>
				</ul>
			</div>
		</div>
		<div class="my-5 prd-list-area">
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd">
					<div class="badge-shop">Sale</div>
					<img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<p class="prd-name mb-1 small">더독 닥터소프트 야채&식이섬유 1.2kg</p>
					</div>
					<div class="d-flex small text-warning justify-content-center pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd">
					<div class="badge-shop">Sale</div>
					<img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<p class="prd-name mb-1 small">더독 닥터소프트 야채&식이섬유 1.2kg</p>
					</div>
					<div class="d-flex small text-warning justify-content-center pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd">
					<div class="badge-shop">Sale</div>
					<img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<p class="prd-name mb-1 small">더독 닥터소프트 야채&식이섬유 1.2kg</p>
					</div>
					<div class="d-flex small text-warning justify-content-center pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd">
					<div class="badge-shop">Sale</div>
					<img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<p class="prd-name mb-1 small">더독 닥터소프트 야채&식이섬유 1.2kg</p>
					</div>
					<div class="d-flex small text-warning justify-content-center pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd">
					<div class="badge-shop">Sale</div>
					<img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<p class="prd-name mb-1 small">더독 닥터소프트 야채&식이섬유 1.2kg</p>
					</div>
					<div class="d-flex small text-warning justify-content-center pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd">
					<div class="badge-shop">Sale</div>
					<img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<p class="prd-name mb-1 small">더독 닥터소프트 야채&식이섬유 1.2kg</p>
					</div>
					<div class="d-flex small text-warning justify-content-center pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd">
					<div class="badge-shop">Sale</div>
					<img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<p class="prd-name mb-1 small">더독 닥터소프트 야채&식이섬유 1.2kg</p>
					</div>
					<div class="d-flex small text-warning justify-content-center pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd">
					<div class="badge-shop">Sale</div>
					<img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<p class="prd-name mb-1 small">더독 닥터소프트 야채&식이섬유 1.2kg</p>
					</div>
					<div class="d-flex small text-warning justify-content-center pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</a>
			</div>
		</div>
	</section>

	<!-- pagination -->
	<div class="page_btn_wrap">
		<a href="#" class="prev_btn" tabindex="-1" role="button" aria-disabled="true"><i class="fas fa-angle-left"></i></a>
		<a href="#" class="list_btn" tabindex="-1" role="button" aria-disabled="true">목록</a> <a href="#" class="next_btn" tabindex="-1" role="button" aria-disabled="true">
		<i class="fas fa-angle-right"></i></a>
	</div>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>



</body>
</html>