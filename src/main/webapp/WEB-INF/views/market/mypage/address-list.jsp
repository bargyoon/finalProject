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
					<li><a href="#!">주문 내역 조회</a></li>
					<li><a href="#!">구매후기</a></li>
					<li><a href="#!">장바구니</a></li>
					<li><a href="#!">상품문의</a></li>
					<li><a href="#!" style="color: black;">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">배송지 관리</p>
			<table class="simple-table">
				<colgroup>
					<col style="width: 20%;">
					<col style="width: auto;">
					<col style="width: 15%;">
					<col style="width: 8%;">
				</colgroup>
				<thead>
					<tr>
						<td>배송지</td>
						<td>주소</td>
						<td>연락처</td>
						<td>&nbsp;</td>
					</tr>
				</thead>
				<c:forEach var="addressList" items="${addressList}">
				<tbody>
					<tr>
						<td class="name">
							<ul>
								<li id="addressName">${addressList.addressName}</li>
							</ul>
						</td>
						<td class="address" >
						<c:if test="${addressList.isDefault eq 'Y'}">
							<span>기본배송지</span>
						</c:if>
							<ul>
								<li id="address">${addressList.address}</li>
								<li style="color: gray;" id="address2">${addressList.address2}</li>
							</ul>
						</td>
						<td class="address-tell">
							<ul>
								<li>휴대폰 연락처</li>
								<li>집 연락처</li>
							</ul>
						</td>
						<td class="address-btn">
							<ul>
								<li><button type="button" id="pop">수정</button></li>
								<c:if test="${addressList.isDefault eq 'N'}">
									<li><button type="button">삭제</button></li>
								</c:if>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="name">
							<ul>
								<li>이름</li>
								<li style="color: gray;">배송지 이름</li>
							</ul>
						</td>
						<td class="address">경기도 화성시 동탄</td>
						<td class="address-tell">
							<ul>
								<li>휴대폰 연락처</li>
								<li>집 연락처</li>
							</ul>
						</td>
						<td class="address-btn">
							<ul>
								<li><button type="button">수정</button></li>
								<li><button type="button">삭제</button></li>
							</ul>
						</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			<div class="address-btn my-3">
				<button>배송지 등록</button>
			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function(){
	    document.getElementById("pop").onclick = function(){
	        window.open("address-pop","","width=600px,height=400px,top=200px;");

	    }
	    
		openWin.document.getElementById("addressName").value=document.getElementById("addressName").value;

	}; 
	
	
</script>

</body>
</html>