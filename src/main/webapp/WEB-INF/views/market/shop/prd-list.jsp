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
				<span class="category-prd-cnt"><c:out value="${pageUtil.total}"/></span>
			</div>
			<input class="checkbox" type="checkbox" id="reg-log" onchange="isChecked('${listSet.category}')" ${listSet.check ? 'checked' : ''}>
			<label for="reg-log" class="reg-label"></label>
			<div class="d-flex justify-content-end">
				<ul class="sort-option">
					<li><button class="sort-option-btn" onclick="sort('${listSet.category}','pop')">인기순</button></li>
					<li><button class="sort-option-btn" onclick="sort('${listSet.category}','new')">신상품순</button></li>
					<li><button class="sort-option-btn" onclick="sort('${listSet.category}','low')">최저가격순</button></li>
					<li><button class="sort-option-btn" onclick="sort('${listSet.category}','high')">최고가격순</button></li>
				</ul>
			</div>
		</div>
		<div class="my-5 prd-list-area" id="empty-list" style="display: none;">
			<div style="min-height: 50rem; display: flex; flex-direction: column; justify-content: center;">
				<i class="fas fa-paw" style="text-align: center; font-size: 6rem;"></i>
				<p style="font-size: 2rem; margin-top: 2rem;">상품이 없습니다</p>
			</div>
		</div>
		<div class="my-5 prd-list-area" id="prd-list">
			<c:if test="${prdList.size()>0}">
				<c:forEach var="i" begin="0" step="1" end="${prdList.size()-1}">
					<div class="mb-4 prd-area mx-lg-4">
						<a class="btn" href="/market/shop/prd-detail?pn=${prdList[i].prdIdx}" style="top: ${prdList[i].salePer eq 0 ? '1.5rem' : '0rem'}">
							<c:if test="${prdList[i].salePer ne 0}">
								<div class="badge-shop">Sale</div>					
							</c:if>
							<img class="prd-img" src="${files[i].downloadURL}" alt="..."/>
							<div class="pt-3" style="padding-bottom: 0rem;">
								<p class="prd-name mb-1 small"><c:out value="${prdList[i].name}"/></p>
							</div>
							<div class="d-flex small text-warning justify-content-center pb-1">
								<c:if test="${prdList[i].rating>0}">
									<c:forEach var="j" begin="0" step="1" end="${prdList[i].rating-1}">
										<i class="fas fa-star"></i>
									</c:forEach>
								</c:if>
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
			</c:if>
		</div>

		<div class="page_wrap" style="margin-left: 2.4rem" id="pagination">
			<div class="page_nation">
				<a class="arrow prev" onclick="prevBtn('${listSet.category}', ${pageUtil.curPage}, '${listSet.option}')"><i class="fas fa-angle-left"></i></a>
				<c:if test="${pageUtil.blockEnd eq 1}">
					<a class="active">1</a> 
				</c:if>
				
				<c:if test="${pageUtil.blockEnd > 1}">
					<c:forEach var="i" begin="1" step="1" end="${pageUtil.blockEnd}">
						<a onclick="pageBtn('${listSet.category}','${listSet.option}', this.text)" class="active"><c:out value="${i}"/></a> 
					</c:forEach>
				</c:if>
				<a class="arrow next" onclick="nextBtn('${listSet.category}', ${pageUtil.curPage}, ${pageUtil.blockEnd} ,'${listSet.option}')"><i class="fas fa-angle-right"></i></a>
			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript" src="${contextPath}/resources/js/market/shop/prd-list.js"></script>



</body>
</html>