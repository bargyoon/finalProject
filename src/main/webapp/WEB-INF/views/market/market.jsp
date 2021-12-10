<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<img src="${contextPath}/resources/img/market/main4.gif" alt="..." style="width: 100%; max-width: 100%; height: auto;"/>
			</div>
		</div>
		<div class="">
			<div class="text-center text-white">
				<img src="${contextPath}/resources/img/market/main2.png" alt="..." style="width: 100%; max-width: 100%; height: auto;"/>
			</div>
		</div>
		<div class="">
			<div class="text-center text-white">
				<img src="${contextPath}/resources/img/market/main3.gif" alt="..." style="width: 100%; max-width: 100%; height: auto;"/>
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
				<c:forEach var="newPrd" items="${newPrdList}">
					<div class="card h-100">
						<c:if test="${newPrd.SALE_PER ne 0}">
							<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.85rem">할인</div>
						</c:if>
						<a class="btn" href="/market/shop/prd-detail?pn=${newPrd.PRD_IDX}">
							<img class="card-img-top" src="${newPrd.downloadURL}" alt="..." />
							<div class="card-body pt-4" style="padding-bottom: 0rem;">
								<div class="text-center">
									<h6 class="fw-bolder">${newPrd.NAME}</h6>
								</div>
							</div>
						</a>
						<div class="d-flex justify-content-center small text-warning mb-2">
							<c:if test="${newPrd.RATING ne 0}">
								<c:forEach var="i" begin="0" step="1" end="${newPrd.RATING-1}">
		                            <i class="fas fa-star"></i>
		                    	</c:forEach>
		                    </c:if>
						</div>
						<div class="text-center">
							<c:if test="${newPrd.SALE_PER ne 0}">
								<span style="color: red;">${newPrd.SALE_PER}%</span>
								<span class="text-muted text-decoration-line-through" style="font-size: smaller;"><fmt:formatNumber value="${newPrd.PRICE}"/>원</span>
							</c:if>
						</div>
						<c:if test="${newPrd.SALE_PER eq 0}">
				            <div class="text-center"><fmt:formatNumber value="${newPrd.PRICE}"/>원</div>
						</c:if>
						<c:if test="${newPrd.SALE_PER ne 0}">
				            <div class="text-center"><fmt:formatNumber value="${newPrd.SALE_PRICE}"/>원</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>


	<section style="text-align: center;">
		<a href="#!"><img src="${contextPath}/resources/img/market/main1.png"></a>
	</section>


	<section class="py-5 mb-5">
		<div class="container px-4 mt-5">
			<div class="text-center gx-4">
				<h1 class="display-6 fw-bolder" style="color: darkorange;">Best Item</h1>
				<h1 class="display-6 fw-bolder">인기 제품</h1>
				<p class="lead fw-normal mb-0" style="color: gray;">가장 많이 팔리는 베스트 상품</p>
			</div>
		</div>
		<div class="px-4 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach var="bestPrd" items="${bestPrdList}" varStatus="status">
					<div class="card h-100">
						<c:if test="${status.index eq 0}">
							<div class="badge-rank position-absolute" style="top: -0.5rem; left: 1rem; background-color: gold;">${status.index + 1}위</div>
						</c:if>
						<c:if test="${status.index eq 1}">
							<div class="badge-rank position-absolute" style="top: -0.5rem; left: 1rem; background-color: silver;">${status.index + 1}위</div>
						</c:if>
						<c:if test="${status.index eq 2}">
							<div class="badge-rank position-absolute" style="top: -0.5rem; left: 1rem; background-color: brown;">${status.index + 1}위</div>
						</c:if>
						<a class="btn" href="/market/shop/prd-detail?pn=${bestPrd.PRD_IDX}">
						<img class="card-img-top" src="${bestPrd.downloadURL}" alt="..." />
							<div class="card-body pt-4" style="padding-bottom: 0rem;">
								<div class="text-center">
									<h5 class="fw-bolder">${bestPrd.NAME}</h5>
								</div>
							</div>
						</a>
						<div class="d-flex justify-content-center small text-warning mb-2">
							<c:forEach var="i" begin="0" step="1" end="${bestPrd.RATING-1}">
	                            <i class="fas fa-star"></i>
	                    	</c:forEach>
						</div>
						<c:if test="${bestPrd.SALE_PER ne 0}">
							<div class="text-center">
									<span style="color: red;">${bestPrd.SALE_PER}%</span>
								<span class="text-muted text-decoration-line-through" style="font-size: smaller;"><fmt:formatNumber value="${bestPrd.PRICE}"/>원</span>
							</div>
						</c:if>
						<div class="text-center">
							<c:if test="${bestPrd.SALE_PER eq 0}">
				            	<fmt:formatNumber value="${bestPrd.PRICE}"/>원
							</c:if>
							<c:if test="${bestPrd.SALE_PER ne 0}">
				            	<fmt:formatNumber value="${bestPrd.SALE_PRICE}"/>원
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>

	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/slick.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/main-slick.js"></script>



</body>
</html>