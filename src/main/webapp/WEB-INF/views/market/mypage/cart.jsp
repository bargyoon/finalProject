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
				<img class="my-img" src="https://cdn.hellodd.com/news/photo/202005/71835_craw1.jpg" />
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
					<li><a href="/market/mypage/cart" style="color: black">장바구니</a></li>
					<li><a href="/market/mypage/address-list">주소록 관리</a></li>
					<li><a href="/market/mypage/enquiry/enquiry-list">구매상품문의</a></li>
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
							<th scope="col">주문금액</th>
							<th scope="col">주문관리</th>
						</tr>
					</thead>
					<c:if test="${cartList.size() ne 0}">
						<tbody>
						<c:forEach var="cart" items="${cartList}" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td><input type="checkbox" class="checked_cart" name="cartIdx" checked="checked" value="${cart.CART_IDX}"></td>
								<td>
									<div class="n-prd-row">
										<a href="/market/shop/prd-detail?pn=${cart.PRD_IDX}"><img src="${files[status.index].downloadURL}"></a>
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
								<td id="cp-sale-total">
									0 원
								</td>
								<td>
									<button type="button" onclick="useCoupon()">쿠폰조회 및 적용</button>
								</td>
							</tr>
							<tr>
								<th>적립금 할인</th>
								<td>
									<input id="sm-price" type="number" value="0" style="width: 3rem"> 원
									(총 보유 적립금 : <span style="color: steelblue;"><fmt:formatNumber value="${authentication.saveMoney}"/> 원</span>)
								</td>
								<td>
									<button type="button" onclick="useSm(${authentication.saveMoney})">적립금 사용</button>
								</td>
							</tr>
							<tr>
								<th>할인 합계</th>
								<td id="sale-total" colspan="2"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="cart-total p-5 mx-5">
					<div>
						<span style="color: gray;">상품 가격</span>
						<p id="total_price"></p>
					</div>
					<i class="fas fa-minus"></i>
					<div>
						<span style="color: gray;">할인 합계</span>
						<p id="sale-total-sub"></p>
					</div>
					<i class="fas fa-equals"></i>
					<div>
						<span style="color: gray;">최종 결제 가격</span>
						<p id="last-price"></p>
						<span id="sale-percent" style="color: red; margin-left: 0.5rem;"></span>
					</div>
				</div>
				<input type="hidden" id="last-price-hidden" value="0"/>
				<input type="hidden" id="cp-hidden" value="0"/>
				<input type="hidden" id="cp-idx-hidden" value="0"/>
				<button type="button" class="cart-buy-btn" onclick="buyBtn('${authentication.userIdx}')">구매하기</button>
			</form>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	
	<script type="text/javascript">
	
		makeOrdNo = () => {
		    let date = new Date();
		    let year = String(date.getFullYear());
		    let month = date.getMonth()+1;
		    month = month < 10 ? '0' + month : month;
		    let day = date.getDate();
		    day = day < 10 ? '0' + day : day;
		    let ranNum = Math.floor(Math.random() * 999999);
		    
		    return year+month+day+ranNum;
		}
	
	
	
		calAmount = () => {
			
			let checkboxs = document.querySelectorAll(".checked_cart");
			let checkboxNum = [];
			
			for(var i = 0; i< checkboxs.length; i++){
				if(checkboxs[i].checked){
					checkboxNum.push(i);
				} else {
					checkboxNum.push(-1);
				}	
			}
			
			let prdSalePrice = 0; //상품 자체 할인 가격
			let couponSalePer = Number(document.getElementById("cp-hidden").value); //쿠폰 할인 퍼센트
			let smPrice = Number(document.getElementById("sm-price").value); //적립금 할인 가격
			let saleTotalPrice = 0; //할인 합계
			let totalPrice = 0; //상품가격
			let lastPrice = 0; //최종결제가격
			
			<c:forEach var="cart" items="${cartList}" varStatus="status">
				if(checkboxNum[${status.index}] == ${status.index}){
					totalPrice += Number(${cart.PRICE * cart.COUNT});
					if(Number(${cart.SALE_PRICE}) != 0){
						prdSalePrice += Number(${(cart.PRICE - cart.SALE_PRICE) * cart.COUNT});
					}
				}
			</c:forEach>
			
			if((totalPrice * 0.05) < smPrice){
				document.getElementById("sm-price").value = totalPrice * 0.05;
				smPrice = totalPrice * 0.05;
			}
			
			saleTotalPrice = prdSalePrice + (totalPrice * Number(couponSalePer) / 100) + smPrice;
			lastPrice = totalPrice - saleTotalPrice;
			
			document.getElementById("prd-sale-total").innerText = Number(prdSalePrice).toLocaleString() + " 원"; //상품 자체 할인가격 화면에 표시
			document.getElementById("cp-sale-total").innerText = Number((totalPrice * Number(couponSalePer) / 100)).toLocaleString() + " 원"; //쿠폰 할인 가격 화면에 표시
			document.getElementById("sale-total").innerText = Number(saleTotalPrice).toLocaleString() + " 원"; //할인 합계 가격 화면에 표시
			document.getElementById("sale-total-sub").innerText = Number(saleTotalPrice).toLocaleString() + " 원"; //할인 합계 가격 아래쪽 화면에 표시
			document.getElementById("total_price").innerText = Number(totalPrice).toLocaleString() + " 원"; //상품 원가 화면에 표시
			document.getElementById("last-price").innerText = Number(lastPrice).toLocaleString() + " 원"; //최종 가격 화면에 표시
			document.getElementById("sale-percent").innerText = Number((saleTotalPrice)/Number(totalPrice) * 100).toFixed(2) + " %"; //할인 퍼센트 화면에 표시
			
			document.getElementById("last-price-hidden").value = Number(lastPrice); //최종가격 input hidden에 넣어주기

		}	
		
		calAmount();
		
		useSm = () => {
			let totalPrice = 0;
			let smValue = document.getElementById("sm-price").value;
			let checkboxs = document.querySelectorAll(".checked_cart");
			let checkboxNum = [];
			
			for(var i = 0; i< checkboxs.length; i++){
				if(checkboxs[i].checked){
					checkboxNum.push(i);
				} else {
					checkboxNum.push(-1);
				}	
			}
			
			if(document.getElementById("last-price-hidden").value == 0){
				alert("상품의 옵션을 먼저 선택해주세요.");
				return;
			}
			
			if(Number(${authentication.saveMoney}) < smValue){
				alert("입력하신 적립금이 보유하신 적립금보다 많습니다.");
				document.getElementById("sm-price").value = 0;
				calAmount();
				return;
			}
			
			<c:forEach var="cart" items="${cartList}" varStatus="status">
				if(checkboxNum[${status.index}] == ${status.index}){
					if(Number(${cart.SALE_PRICE}) != 0){
						totalPrice += Number(${cart.SALE_PRICE * cart.COUNT});
					} else {
						totalPrice += Number(${cart.PRICE * cart.COUNT});
					}
				}
			</c:forEach>		
					
			if(totalPrice * 0.05 < smValue){
				alert("적립금은 주문금액의 5%까지 사용가능 합니다.");
				document.getElementById("sm-price").value = totalPrice * 0.05;
				calAmount();
				return;
			}
			
			calAmount();
		}
		
		
		buyBtn = (userIdx) => {
			
	    	var IMP = window.IMP;
	    	IMP.init("imp96539619");
			
			let lastPrice = Number(document.getElementById("last-price-hidden").value); // 최종 결제 금액
			let couponSalePer = document.getElementById("cp-hidden"); //coupon 할인 퍼센트
			let couponIdx = Number(document.getElementById("cp-idx-hidden").value); // 쿠폰 IDX
			let saveAmount = Number(document.getElementById("sm-price").value); // 적립금 사용액
			let totalPrice = 0;
			
			let ordNo = makeOrdNo();
			let prdName = '';
			
			let checkboxs = document.querySelectorAll(".checked_cart");
			let checkboxNum = [];
			let dtIdxs = [];
			let orderCnts = [];
			let prdIdxs = [];
			let cartIdxs = [];
			
			for(var i = 0; i< checkboxs.length; i++){
				if(checkboxs[i].checked){
					checkboxNum.push(i);
				} else {
					checkboxNum.push(-1);
				}	
			}
			
			if(${cartList.size()} > 1){
				prdName = "${cartList[0].NAME}" + " 외 " + ${cartList.size()-1} + " 개";
			} else if(${cartList.size()} == 1) {
				prdName = "${cartList[0].NAME}";
			}
			
			<c:forEach var="cart" items="${cartList}" varStatus="status">
				if(checkboxNum[${status.index}] == ${status.index}){
					dtIdxs.push(${cart.DT_IDX});
					orderCnts.push(Number(document.getElementById("cnt-${cart.CART_IDX}").value));
					prdIdxs.push(${cart.PRD_IDX});
					cartIdxs.push(Number(${cart.CART_IDX}));
					if(Number(${cart.SALE_PRICE}) != 0){
						totalPrice += Number(${cart.SALE_PRICE * cart.COUNT});
					} else {
						totalPrice += Number(${cart.PRICE * cart.COUNT});
					}
				}
			</c:forEach>
			
			let couponSale = Number((totalPrice * Number(couponSalePer) / 100)); 
			let orderInfos = [];
			
			for(let i = 0; i < dtIdxs.length; i++){
				orderInfos.push({
					orderNum : Number(ordNo),
					userIdx : userIdx,
					proIdx : prdIdxs[i],
					dtIdx : dtIdxs[i],
					orderCnt : orderCnts[i],
					saveMoney : saveAmount,
					ucIdx : couponIdx,
					cpSaveMoney : couponSale,
					paymentAmount : lastPrice,
					cartIdx : cartIdxs[i]
				})
			}
			
			
			fetch("/market/shop/check-stock", {
				method : "POST",
				body : JSON.stringify(orderInfos),
				headers:{
					"Content-type": "application/json;"
				}
			})
			.then(response => {
				if(response.ok){
					return response.json()
				} else {
					alert("로그인이 필요합니다.");
					throw new Error(response.status);
				}
			})
			.then(memberInfo => {
				if(memberInfo.userName == "disavailable"){
					alert("상품의 재고가 부족합니다.");
				} else {
		    		IMP.request_pay({ // param
				        pg : 'html5_inicis',
				        merchant_uid: ordNo, // 상점에서 관리하는 주문 번호
				        name : prdName,
				        amount : lastPrice,
				        buyer_email : memberInfo.email,
				        buyer_name : memberInfo.userName,
				        buyer_addr : memberInfo.address
				    }, (rsp) => { // callback
				    	if(rsp.success){
							jQuery.ajax({
								url: "/market/shop/iamport-certification/" + rsp.imp_uid, //cross-domain error가 발생하지 않도록 주의해주세요
								type: 'GET'
							})
							.done(data => {
								if (rsp.paid_amount == data.response.amount) {
									fetch("/market/shop/regist-order", {
										method : "POST",
										headers:{
											"Content-type": "application/json;"
										},
										body : JSON.stringify(orderInfos)
									})
									.then(response => {
										if(response.ok){
											var msg = '결제가 완료되었습니다.';
										    msg += '\n고유ID : ' + rsp.imp_uid;
										    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
										    msg += '\결제 금액 : ' + rsp.paid_amount;
										    msg += '카드 승인번호 : ' + rsp.apply_num;
							        		alert(msg);
										} else {
											jQuery.ajax({
												url: "/market/shop/get-access-token",
												type : "GET",
											})
											.done(data => {
												jQuery.ajax({
													url : "https://final-cors.herokuapp.com/https://api.iamport.kr/payments/cancel",
													method: "POST",
													headers: {
														"Content-type": "application/json",
														"Authorization": data.response.token
													},
													data: JSON.stringify({
													   	imp_uid: rsp.imp_uid, //환불 uid
													    reason: "테스트 결제 환불", // 환불사유
													}),
										    	})
										    	.done(data => {
													alert("결제에 실패하여 자동취소처리 하였습니다.");
												})
												.catch(error => {
													throw new Error(response.status);
												})
											})
										}
									});
								} else {
									jQuery.ajax({
										url: "/market/shop/get-access-token",
										type : "GET",
									})
									.done(data => {
										jQuery.ajax({
											url : "https://cors-anywhere.herokuapp.com/https://api.iamport.kr/payments/cancel",
											method: "POST",
											headers: {
												"Content-type": "application/json",
												"Authorization": data.response.token
											},
											data: JSON.stringify({
												imp_uid: rsp.imp_uid, //환불 uid
												reason: "테스트 결제 환불", // 환불사유
											}),
										})
										.done(data => {
											alert("결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.");
										})
										.catch(error => {
											throw new Error(response.status);
										})
									})
								}
							});
						} else {
							var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        
					        alert(msg);
						}
		    		})
				}
			})
		
		}
		
		/* selectbox 상품개별삭제 */
		function selectDelete() {
			 var url = "cart/selectDelete";
			 var selectedArr = new Array();
			 var cartIdx = document.getElementsByName("cartIdx"); //
			 console.dir(selectedArr);
			console.dir(cartIdx);
			console.dir(cartIdx.value);
			  for (var i = 0; i < cartIdx.length; i++) {
			   if (cartIdx[i].checked == true) {
				   selectedArr.push(cartIdx[i].value);
				   console.dir(selectedArr);
			   }
			  }
			
			 if (selectedArr.length == 0) {
				 alert("삭제하실 항목을 적어도 하나는 체크해 주세요.");
			 } else {
			  	$.ajax({
			  		url : url,
			  		type : 'POST',
			  		traditional : true,
			  		data : {
			  			selectedArr : selectedArr
			  		},
			  		success : function(jdata){
			  			if(jdata = 1){
			  				location.replace("cart")
			  			}else{
			  				alert("삭제 실패");
			  			}
			  		}
			  	});
			 }
			}
		
	</script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/cart.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</body>
</html>