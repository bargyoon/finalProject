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
				<li>장바구니 상품은 최대 1년 보관(비회원 2일)되며 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
				<li>장바구니에는 최대 100개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는 100개로 제한됩니다.</li>
			</ul>
			<form name="form">
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
							<th scope="col">전체 <strong>${cartCnt}</strong> 개
							</th>
							<th scope="col" style="cursor: pointer">
								<input type="checkbox" class="chk_all" id="chk_all" checked="checked">
							</th>
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
					<c:if test="${cartCnt eq 0}" >
						<p style="font-weight: bold;">! 장바구니에 담긴 상품이 없습니다.</p>
					</c:if>
					
					<c:if test="${cartCnt ne 0}">
					<c:forEach var="cartList" items="${cartList}">
					<tbody>
						<tr>
							<td>${cartList.RNUM}</td>
							<td><input type="checkbox" class="checked_cart" name="cartIdx" value="${cartList.CART_IDX}" checked="checked"></td>
							<td>
								<div class="n-prd-row">
									<a href="#!"><img src="https://dummyimage.com/80x100/dee2e6/6c757d.jpg"></a>
									<ul class="cart-info">
										<li class="name ft-SBAggroM">
											<a href="#!"style="text-decoration: none; color: black;">
											[${cartList.BRAND}] ${cartList.NAME}
											<span style="color: red;"><c:if test="${cartList.PO_STOCK eq 0}"> (품절)</c:if></span>
											</a>
										</li>
										<c:if test="${cartList.PO_NAME eq null}">
											<li class="option">(재고수량 : ${cartList.PO_STOCK}개)</li>
										</c:if>
										<c:if test="${cartList.PO_NAME ne null}">
											<li class="option">${cartList.PO_NAME} / (재고수량 : ${cartList.PO_STOCK}개)</li>
										</c:if>
									</ul>
								</div>
							</td>
							<td>
								<ul class="prd-price">
								<c:if test="${cartList.STATE ne 'sale'}">
									<li class="normal-price" value="${cartList.PRICE}">
										<fmt:formatNumber value="${cartList.PRICE}" type="number" pattern=""></fmt:formatNumber>
									</li>
								</c:if>
									
								<c:if test="${cartList.STATE eq 'sale'}">
								<li class="normal-price" id="normal-price" value="${cartList.PRICE}">
									<del><fmt:formatNumber value="${cartList.PRICE}" type="number" pattern=""></fmt:formatNumber></del>
								</li>								
								<li class="sale-price" id="sale-price" value="${cartList.SALE_PRICE}">
									<fmt:formatNumber value="${cartList.SALE_PRICE}" type="number" pattern=""></fmt:formatNumber>
								</li>
								</c:if>
								</ul>
							</td>
							<td>0</td>
							
							<!-- 수량 -->
							<td>
								<div class="cart-prd-amount">
									<button type="button" id="minus-${cartList.RNUM}" class="prd-reduce-btn down" onclick='count("minus")'>-1</button>
									<input id="cnt-${cartList.CART_IDX}" name="count" type="text" onkeyup='printName()' autocomplete="off" onfocus="this.select();" 
											class="prd-cnt" value="${cartList.COUNT}" onchange="">
									<button type="button" id="plus-${cartList.RNUM}" class="prd-increase-btn up" onclick='count("plus")'>+1</button>
								</div>
								<button type="button" onclick="updateCart()">변경</button>
							</td>
							<td>
							<input name="state${cartList.RNUM}" type="hidden" value="${cartList.STATE}">
							<!-- 주문금액 -->							
								<ul class="prd-price">
									
								<c:if test="${cartList.STATE ne 'sale'}">
									<li id="set-price" value="${cartList.PRICE*cartList.COUNT}"></li>
									(<li id="set-reserve" value="${cartList.PRICE*cartList.COUNT*0.03}"></li>)
								</c:if>
								<c:if test="${cartList.STATE eq 'sale'}">
									<li id="set-sale-price" value="${cartList.SALE_PRICE*cartList.COUNT}"></li>
									(<li id="set-sale-reserve" value="${cartList.SALE_PRICE*cartList.COUNT*0.03}"></li>)
								</c:if>
								</ul>
							</td>
							<td>
								<button type="button" class="cart-del-btn" onclick="deleteCart()">삭제하기</button>
							</td>
							<td>3,000</td>
						</tr>
					</tbody>
					</c:forEach>
					</c:if>
				</table>
				<div class="cart-del py-3">
					<button type="button" onclick="AllDelete()">모두삭제</button>
					<button type="button" onclick="selectDelete()">선택삭제</button>
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
				<button class="cart-buy-btn">구매하기</button>
				<button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>

			</form>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script>
/* checkbox 설정 */
$(".chk_all").click(function(){
 var chk = $(".chk_all").prop("checked");
 if(chk) {
  $("input:checkbox[name='cartIdx']").prop("checked", true);
 } else {
  $("input:checkbox[name='cartIdx']").prop("checked", false);
 }
});
$("input:checkbox[name='cartIdx']").click(function(){
	  $(".chk_all").prop("checked", false);
	 });

/* selectbox 상품개별삭제 */
function selectDelete() {
	 var url = "cart/selectDelete";
	 var selectedArr = new Array();
	 var cartIdx = document.getElementsByName("cartIdx"); //

	  for (var i = 0; i < cartIdx.length; i++) {
	   if (cartIdx[i].checked == true) {
		   selectedArr.push(cartIdx[i].value);
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

//상품 삭제 버튼
function deleteCart(){
	var cartIdx = document.getElementsByName("cartIdx");
	form.action = "cart/delete?cartIdx="+cartIdx;
	form.submit();
} 

//모두 삭제
function AllDelete(){
	form.action = "cart/deleteAll";
	form.submit();
}

//장바구니 변경 ***
/* function updateCart(){
	var cartIdx = document.getElementsByName("count");
	var cartIdx = document.getElementsByName("cartIdx");
	console.dir("count : " + count);
	console.dir("cartIdx : " + cartIdx);
	form.action = "cart/update?count="+count"&cartIdx="cartIdx;
	form.submit();
} */

//상품 개수 증감 버튼 ****작업중
function count(type){
	
	 var cnt  = document.getElementById('cnt-'+cartIdx);
	 var number = cnt.value;
	 console.dir(number);
	 
	 var result = document.getElementByName('count');
	 var price = document.getElementById('price').value;
	 var reserve = document.getElementById('reserve').value;
	 console.dir(price);
	 console.dir(reserve);
	 
	if(type=='plus'){
		number = parseInt(number)+1;
		
	}else if(type == 'minus'){
		if(number<2){
			alert('수량은 한 개 이상 선택해주세요.');
			return false;
		}
		number = parseInt(number)-1;
	}
	result.innerText=number;
	cnt.value = number;
}
</script>




<script>
    $("#check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp88593867'); //가맹점 식별코드

        IMP.request_pay({
            pg: 'html5_inicis',       
            pay_method: 'card',           
            merchant_uid: 'merchant_' + new Date().getTime(),          
            name: '상품이름(테스트)',//결제창에서 보여질 이름
            amount: 10,  //가격 
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',
            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) { //callback
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });
</script>



</body>
</html>