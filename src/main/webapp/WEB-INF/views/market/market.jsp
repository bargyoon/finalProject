<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/shop-head.jsp"%>
<!-- slick css -->
<link rel="stylesheet" href="${contextPath}/resources/css/market/slick/slick.css">
<link rel="stylesheet" href="${contextPath}/resources/css/market/slick/slick-theme.css">

</head>
<body onscroll="checkHeight()">
	<!-- navber -->
	<%@ include file="/WEB-INF/views/include/market/market-nav.jsp"%>
	
	<!-- Header-->
	<header class="slick_test2" style="margin-top: 3.5rem; min-height: 30rem;">
		<div class="">
			<div class="text-center text-white">
				<img src="/resources/img/market/main4.gif" alt="..." style="width: 100%; max-width: 100%; height: auto; margin-top:4.5rem"/>
			</div>
		</div>
		<div class="">
			<div class="text-center text-white">
				<img src="/resources/img/market/main2.png" alt="..." style="width: 100%; max-width: 100%; height: auto; margin-top:4.5rem"/>
			</div>
		</div>
		<div class="">
			<div class="text-center text-white">
				<img src="/resources/img/market/main3.gif" alt="..." style="width: 100%; max-width: 100%; height: auto; margin-top:4.5rem"/>
			</div>
		</div>
	</header>
	<!-- Section-->
	<section class="py-5 mb-5">
		<div class="container px-4 mt-5">
			<div class="text-center gx-4">
				<h1 class="display-6 fw-bolder" style="color: darkorange;">New Arrivals</h1>
				<h1 class="display-6 fw-bolder">신상품</h1>
				<p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
			</div>
		</div>
		<div class="container px-4 mt-5">
			<div class="slick_test">
				<div class="card h-100">
					<a class="btn" href="http://localhost:9090">
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder"> 더독 닥터소프트 <br>야채&식이섬유 1.2kg</h5>
							</div>
						</div>
					</a>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">12,000원</div>
				</div>
				<div class="card h-100">
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.85rem">할인</div>
					<a class="btn" href="http://localhost:9090">
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
							</div>
						</div>
					</a>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="prd-price text-center">1,700원</div>
				</div>
				<div class="card h-100">
					<a class="btn" href="http://localhost:9090">
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder"> 더독 닥터소프트 <br>야채&식이섬유 1.2kg</h5>
							</div>
						</div>
					</a>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">12,000원</div>
				</div>
				<div class="card h-100">
					<a class="btn" href="http://localhost:9090">
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder"> 더독 닥터소프트 <br>야채&식이섬유 1.2kg</h5>
							</div>
						</div>
					</a>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">12,000원</div>
				</div>
				<div class="card h-100">
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.85rem">할인</div>
					<a class="btn" href="http://localhost:9090">
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
							</div>
						</div>
					</a>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="prd-price text-center">1,700원</div>
				</div>
				<div class="card h-100">
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.85rem">할인</div>
					<a class="btn" href="http://localhost:9090">
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
							</div>
						</div>
					</a>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="prd-price text-center">1,700원</div>
				</div>
				<div class="card h-100">
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.85rem">할인</div>
					<a class="btn" href="http://localhost:9090">
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
							</div>
						</div>
					</a>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="prd-price text-center">1,700원</div>
				</div>
			</div>
		</div>
	</section>


	<section class="py-3 my-5" style="background-color: darkgreen;">
		<div class="px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">친환경 제품</h1>
				<p class="lead fw-normal text-white-50 mb-0">주인님들의 옥체에 해롭지 않은 제품들</p>
				<div class="card-footer pt-3 border-top-0 bg-transparent">
					<div class="text-center">
						<a class="btn btn-outline-dark bg-dark text-white" href="#">상품 보러 가기</a>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="py-5">
		<div class="container px-4 mt-5">
			<div class="text-center gx-4">
				<h1 class="display-6 fw-bolder" style="color: darkorange;">Best Item</h1>
				<h1 class="display-6 fw-bolder">인기 제품</h1>
				<p class="lead fw-normal mb-0" style="color: gray;">가장 많이 팔리는 베스트 상품</p>
			</div>
		</div>
		<div class="px-4 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="card h-100">
					<div class="badge-rank position-absolute" style="top: -0.5rem; left: 1rem; background-color: gold;">1위</div>
					<a class="btn" href="#!">
					<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder">더독 닥터소프트 <br>야채&식이섬유 1.2kg</h5>
							</div>
						</div>
					</a>
					<!-- Product reviews-->
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">12,000원</div>
				</div>
				<div class="card h-100">
					<div class="badge-rank position-absolute"
						style="top: -0.5rem; left: 1rem; background-color: silver;">2위</div>
					<a class="btn" href="#!">
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
							</div>
						</div>
					</a>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</div>
				<div class="card h-100">
					<div class="badge-rank position-absolute" style="top: -0.5rem; left: 1rem; background-color: brown;">3위</div>
					<a class="btn" href="#!">
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="card-body pt-4" style="padding-bottom: 0rem;">
							<div class="text-center">
								<h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
							</div>
						</div>
					</a>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<div class="text-center">
						<span style="color: red;">35%</span>
						<span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
					</div>
					<div class="text-center">1,700원</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>

	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/slick.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/main-slick.js"></script>



</body>
</html>