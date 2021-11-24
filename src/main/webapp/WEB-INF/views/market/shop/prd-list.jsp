<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/shop-head.jsp"%>

</head>
<body onscroll="checkHeight()">
	<%@ include file="/WEB-INF/views/include/market/market-nav.jsp"%>

	<section class="pt-5 pb-3" style="margin-top: 8rem;">
		<div class="container text-center mt-5 prd-category">
			<p class="display-7 fw-bolder">상품 카테고리</p>
			<div class="pb-3">
				<hr style="width: 9rem;">
			</div>
			<ul>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=all">전체</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=snack">간식</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=feed">사료</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=health">건강관리</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=potty">위생/배변</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=beauty">미용/목욕</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=feeder">급수기/급식기</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=kennel">하우스/울타리</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=vari-kennel">이동장</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=clothes">의류/악세서리</a></li>
				<li><a class="dropdown-item" href="/market/shop/prd-list?category=toy">장난감</a></li>
			</ul>
		</div>
	</section>

	<section class="px-lg-4 mt-5 container" style="min-height: 40rem;">
		<div class="category-title px-lg-5">
			<div style="transform: translateY(30%);">
				<span class="category-name ps-4 pe-2"><c:out value="${categoryWord}"/></span>
				<span class="category-prd-cnt"><c:out value="${prdList.size()}"/></span>
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
			<c:forEach var="i" begin="0" step="1" end="${prdList.size()-1}">
				<div class="mb-4 prd-area mx-lg-4">
					<a class="btn" href="/market/shop/prd-detail?${prdList[i]}">
						<c:if test="${prdList[i].salePer ne null}">
							<div class="badge-shop">Sale</div>					
						</c:if>
						<img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
						<div class="pt-3" style="padding-bottom: 0rem;">
							<p class="prd-name mb-1 small"><c:out value="${prdList[i].name}"/></p>
						</div>
						<div class="d-flex small text-warning justify-content-center pb-1">
							<c:forEach var="j" begin="0" step="1" end="${prdList[i].rating-1}">
								<i class="fas fa-star"></i>
							</c:forEach>
						</div>
						<div class="text-center">
							<c:if test="${prdList[i].salePer ne 0}">
								<span style="color: red;"><c:out value="${prdList[i].salePer}%"/></span>
								<span class="text-muted text-decoration-line-through" style="font-size: smaller;"><fmt:formatNumber value="${prdList[i].price}"/>원</span>
							</c:if>
						</div>
						<c:if test="${prdList[i].salePer ne 0}">
							<div class="text-center"><fmt:formatNumber value="${prdList[i].price * (1-prdList[i].salePer/100)}"/>원</div>
						</c:if>
						<c:if test="${prdList[i].salePer eq 0}">
							<div class="text-center"><fmt:formatNumber value="${prdList[i].price}"/>원</div>
						</c:if>
					</a>
				</div>
			</c:forEach>
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