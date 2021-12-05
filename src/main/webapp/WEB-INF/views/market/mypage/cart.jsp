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
				<li>장바구니 상품은 최대 1년 보관(비회원 2일)되며 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
				<li>장바구니에는 최대 100개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는 100개로 제한됩니다.</li>
			</ul>
			<form>
				<table class="n-table table-col">
					<colgroup>
						<col width="5%">
						<col width="4%">
						<col width="20%">
						<col width="5%">
						<col width="8%">
						<col width="16%">
						<col width="7%">
						<col width="9%">
						<col width="12%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">전체 <strong>1</strong> 개
							</th>
							<th scope="col" style="cursor: pointer"><input
								type="checkbox" class="chk_all" id="chk_all" checked=""></th>
							<th scope="col">상품명(옵션)</th>
							<th scope="col">판매가</th>
							<th scope="col">등급 할인</th>
							<th scope="col">수량</th>
							<th scope="col">주문금액<br>(적립 예정)
							</th>
							<th scope="col">주문관리</th>
							<th scope="col">배송비</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><input type="checkbox" class="checked_cart" name="cart_no" value="589117569" checked="checked"></td>
							<td>
								<div class="n-prd-row">
									<a href="#!"><img src="https://dummyimage.com/80x100/dee2e6/6c757d.jpg"></a>
									<ul class="cart-info">
										<li class="name ft-SBAggroM"><a href="#!"style="text-decoration: none; color: black;">[브랜드]제품명</a></li>
										<li class="option">옵션 / 재고수량</li>
									</ul>
								</div>
							</td>
							<td>
								<ul class="prd-price">
									<li class="sale-price"><del>70,000</del></li>
									<li class="normal-price">50,000</li>
								</ul>
							</td>
							<td>0</td>
							<td>
								<div class="cart-prd-amount">
									<button type="button" class="prd-reduce-btn" onclick="">-1</button>
									<input name="prd-cnt" type="text" onkeyup="" autocomplete="off" onfocus="this.select();" value="1" onchange="">
									<button type="button" class="prd-increase-btn " onclick="">+1</button>
								</div>
							</td>
							<td>
								<ul class="prd-price">
									<li>50,000</li>
									<li>(1,500)</li>
								</ul>
							</td>
							<td>
								<button type="button" class="cart-del-btn">삭제하기</button>
							</td>
							<td>3,000</td>
						</tr>
						<tr>
							<td>2</td>
							<td><input type="checkbox" class="checked_cart" name="cart_no" value="589117569" checked="checked"></td>
							<td>
								<div class="n-prd-row">
									<a href="#!"><img src="https://dummyimage.com/80x100/dee2e6/6c757d.jpg"></a>
									<ul class="cart-info">
										<li class="name ft-SBAggroM"><a href="#!" style="text-decoration: none; color: black;">[브랜드]제품명</a></li>
										<li class="option">옵션 / 재고수량</li>
									</ul>
								</div>
							</td>
							<td>
								<ul class="prd-price">
									<li class="sale-price"><del>50,000</del></li>
									<li class="normal-price">30,000</li>
								</ul>
							</td>
							<td>0</td>
							<td>
								<div class="cart-prd-amount">
									<button type="button" class="prd-reduce-btn" onclick="">-1</button>
									<input name="prd-cnt" type="text" onkeyup="" autocomplete="off" onfocus="this.select();" value="1" onchange="">
									<button type="button" class="prd-increase-btn " onclick="">+1</button>
								</div>
							</td>
							<td>
								<ul class="prd-price">
									<li>30,000</li>
									<li>(900)</li>
								</ul>
							</td>
							<td>
								<button type="button" class="cart-del-btn">삭제하기</button>
							</td>
							<td>3,000</td>
						</tr>
					</tbody>
				</table>
				<div class="cart-del py-3">
					<button type="button" onclick="">모두삭제</button>
					<button type="button" onclick="">선택삭제</button>
				</div>
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
								<td colspan="2">40,000 원</td>
							</tr>
							<tr>
								<th>등급 할인</th>
								<td colspan="2">0 원</td>
							</tr>
							<tr>
								<th>쿠폰 할인</th>
								<td>0 원</td>
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
						<p>120,000 원</p>
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
				<button class="cart-buy-btn">구매하기</button>
			</form>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>



</body>
</html>