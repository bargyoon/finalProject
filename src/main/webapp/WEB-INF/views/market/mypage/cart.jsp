<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/mypage-head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
					<li><a href="#!">상품문의</a></li>
					<li><a href="/market/mypage/address-list">주소록 관리</a></li>
					<li><a href="/market/mypage/enquiry/faq?type=1">FAQ</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">장바구니</p>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<ul>
				<li>배송비용은 브랜드별로 상이합니다.</li>
				<li>2개 이상의 브랜드를 주문하신 경우, 주문번호가 동일하더라도 개별 배송됩니다.</li>
				<li>결제 시 각종 할인 적용이 달라질 수 있습니다.</li>
				<li>장바구니 상품은 최대 1년 보관 되며 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
				<li>장바구니에는 최대 20개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는 20개로 제한됩니다.</li>
			</ul>
			<form name="form">
				<table class="n-table table-col">
					<colgroup>
						<col width="5%">
						<col width="4%">
						<col width="20%">
						<col width="5%">
						<col width="16%">
						<col width="7%">
						<col width="9%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">전체 <strong>${cartList.size()}</strong> 개
							</th>
							<th scope="col" style="cursor: pointer">
								<input type="checkbox" class="chk_all" id="chk_all" checked="checked">
							</th>
							<th scope="col">상품명(옵션)</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">주문금액<br>(적립 예정)
							</th>
							<th scope="col">주문관리</th>
						</tr>
					</thead>
					<c:if test="${cartList.size() ne 0}">
						<tbody>
						<c:forEach var="cart" items="${cartList}" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td><input type="checkbox" class="checked_cart" name="cartIdx" checked="checked"></td>
								<td>
									<div class="n-prd-row">
										<a href="#!"><img src="https://dummyimage.com/80x80/dee2e6/6c757d.jpg"></a>
										<ul class="cart-info">
											<li class="name ft-SBAggroM">
												<a href="#!"style="text-decoration: none; color: black;">
												[${cart.BRAND}] ${cart.NAME}
												<span style="color: red;"><c:if test="${cart.PO_STOCK eq 0}"> (품절)</c:if></span>
												</a>
											</li>
											<c:if test="${cart.PO_NAME ne null}">
												<li class="option">${cart.PO_NAME} / (재고수량 : ${cart.PO_STOCK}개)</li>
											</c:if>
										</ul>
									</div>
								</td>
								<td>
									<ul class="prd-price">
										<c:if test="${cart.STATE ne 'sale'}">
											<li class="normal-price" value="${cart.PRICE}">
												<fmt:formatNumber value="${cart.PRICE}"/>
											</li>
										</c:if>
											
										<c:if test="${cart.STATE eq 'sale'}">
											<li class="normal-price" id="normal-price" value="${cart.PRICE}">
												<fmt:formatNumber value="${cart.PRICE}"/>
											</li>								
											<li class="sale-price" id="sale-price" value="${cart.SALE_PRICE}">
												<del><fmt:formatNumber value="${cart.SALE_PRICE}"/></del>
											</li>
										</c:if>
									</ul>
								</td>
								
								<td>
									<div class="cart-prd-amount">
										<button type="button" class="prd-reduce-btn" onclick="changeCnt('-', ${cart.CART_IDX})">-1</button>
										<input id="cnt-${cart.CART_IDX}" type="number" class="prd-cnt" value="${cart.COUNT}">
										<button type="button" class="prd-increase-btn" onclick="changeCnt('+', ${cart.CART_IDX})">+1</button>
									</div>
									<button type="button" onclick="updateCnt(${cart.CART_IDX}, ${cart.DT_IDX})">변경</button>
								</td>
								<td>
								<input name="state${cart.RNUM}" type="hidden" value="${cart.STATE}">
									<ul class="prd-price">
										<c:if test="${cart.STATE ne 'sale'}">
											<li id="price" value="${cart.PRICE*cart.COUNT}">
												(<fmt:formatNumber value="${cart.SALE_PRICE}"/>)
											</li>
										</c:if>
										<c:if test="${cart.STATE eq 'sale'}">
											<li id="sale-price" value="${cart.SALE_PRICE*cart.COUNT}">
												<fmt:formatNumber value="${cart.SALE_PRICE*cart.COUNT}"/>
											</li>
											<li id="sale-reserve" value="${cart.SALE_PRICE*cart.COUNT*0.03}">
												<del>(<fmt:formatNumber value="${cart.SALE_PRICE*cart.COUNT*0.03}"/>)</del>
											</li>
										</c:if>
									</ul>
								</td>
								<td>
									<button type="button" class="cart-del-btn" onclick="deleteCart(${cart.CART_IDX})">삭제하기</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<div class="cart-del py-3">
						<button type="button" onclick="deleteAll()">모두삭제</button>
						<button type="button" onclick="selectDelete()">선택삭제</button>
					</div>
				</c:if>
				</table>
				<c:if test="${cartList.size() eq 0}">
					<div style="text-align:center; min-height: 30rem; padding-top: 15rem;">
	                	<p>장바구니에 담긴 상품이 없습니다.</p>
	                </div>
	            </c:if>
				<div class="cart-discount-info">
					<p>할인 금액</p>
					<table class="cart-discount-table">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 20%;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th>상품 할인</th>
								<td id="prd-sale-total" colspan="2"></td>
							</tr>
							<tr>
								<th>쿠폰 할인</th>
								<td id="cp-sale-total">0 원</td>
								<td>
									<button type="button">쿠폰조회 및 적용</button>
								</td>
							</tr>
							<tr>
								<th>적립금 할인</th>
								<td>0 원 (총 보유 적립금 : <span style="color: steelblue;">10,000 원</span>)</td>
								<td>
									<button type="button">적립금 사용</button>
								</td>
							</tr>
							<tr>
								<th>할인 합계</th>
								<td colspan="2">40,000 원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="cart-total p-5 mx-5">
					<div>
						<span style="color: gray;">상품 가격</span>
						<p id="total_price">120,000 원</p>
					</div>
					<i class="fas fa-minus"></i>
					<div>
						<span style="color: gray;">할인 합계</span>
						<p>40,000 원</p>
					</div>
					<i class="fas fa-equals"></i>
					<div>
						<span style="color: gray;">최종 결제 가격</span>
						<p>80,000 원</p>
						<span style="color: red; margin-left: 0.5rem;">33% SAVE</span>
					</div>
				</div>
				<button type="button" class="cart-buy-btn">구매하기</button>
				<input type="hidden" name="hidden-total">
			</form>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	
	<script type="text/javascript">
		let totalSale = 0;
		let saleShow = document.getElementById("prd-sale-total");
		<c:forEach var="cart" items="${cartList}">
			totalSale += Number(${cart.SALE_PRICE * cart.COUNT});
		</c:forEach>
		let totalSaleStr = totalSale.toLocaleString();
		saleShow.innerText = totalSaleStr + " 원";
	
	</script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/cart.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</body>
</html>