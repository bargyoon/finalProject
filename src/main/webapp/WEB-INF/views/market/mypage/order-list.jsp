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
					<li><a href="/market/mypage/address-list" style="color: black;">주소록 관리</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">주문 내역 조회</p>
			<ul class="sub-ul pb-2">
				<li><a href="/market/mypage">전체 조회</a></li>
				<li><a href="/market/mypage?state=1">입금/결제</a></li>
				<li><a href="/market/mypage?state=2">배송중</a></li>
				<li><a href="/market/mypage?state=3">배송완료</a></li>
				<li><a href="/market/mypage?state=4">구매확정</a></li>
				<li><a href="/market/mypage?state=5">교환</a></li>
				<li><a href="/market/mypage?state=6">환불</a></li>
			</ul>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<ul>
				<li>상품 수령 후 일주일뒤 자동으로 구매확정상태가 되고, 교환/환불이 불가능합니다.</li>
				<li>교환, 환불, 배송 등 문의사항은 문의하기를 눌러주세요.</li>
				<li>주문번호가 동일하더라도 다른 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다.</li>
			</ul>
			
			<!-- 날짜검색 -->
			<div class="mt-5 n-table-filter">
				<div class="n-radio-tab">
						<input type="radio" id="radioOfPeriod0" name="period" value="1" onclick="setDate()">
						<label class="period-label" for="radioOfPeriod0">1주일</label>
						<input type="radio" id="radioOfPeriod1" name="period" value="2" onclick="setDate()">
						<label class="period-label" for="radioOfPeriod1">1개월</label>
						<input type="radio" id="radioOfPeriod2" name="period" value="3" onclick="setDate()">
						<label class="period-label" for="radioOfPeriod2">3개월</label>
						<input type="radio" id="radioOfPeriod3" name="period" value="4" onclick="setDate()">
						<label class="period-label" for="radioOfPeriod3">전체 시기</label>
					</div>
				<form action="enquiry-list" id="dateForm" onsubmit="return resetDate();">
						<div class="n-datepicker">
							<input type="date" id="fromDate" name="fromDate"><span> ~</span>
						</div>
						<div class="n-datepicker">
							<input type="date" id="endDate" name="endDate">
						</div>
						<button type="submit" onclick="search();">조회</button>
				</form>
			</div>
			
			<table class="n-table table-col">
				<colgroup>
					<col style="width: auto">
					<col style="width: 16%">
					<col style="width: 16%">
					<col style="width: 16%">
					<col style="width: 12%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품정보</th>
						<th scope="col">주문일자</th>
						<th scope="col">주문번호</th>
						<th scope="col">주문금액(수량)</th>
						<th scope="col">주문 상태</th>
					</tr>
				</thead>
				<c:forEach var="orderList" items="${orderList}">
				<tbody>
					<tr>
						<td>
							<div class="n-prd-row">
								<a href="#!"><img src="https://dummyimage.com/100x120/dee2e6/6c757d.jpg"></a>
								<ul class="info">
									<li class="brand">${orderList.BRAND}</li>
									<li class="name ft-SBAggroM"><a href="#!" style="text-decoration: none; color: black;">${orderList.NAME}</a></li>
									<li class="option">${orderList.PO_NAME}</li>
								</ul>
							</div>
						</td>
						<td><fmt:formatDate value="${orderList.ORDER_DATE}" pattern="yyyy-MM-dd"/></td>
						<td>${orderList.ORDER_IDX}</td>
						<td>${orderList.PAYMENT_AMOUNT}원<br> ${orderList.ORDER_CNT}개
						</td>
						<td>
						<c:choose>
							<c:when test="${orderList.STATE eq 0}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">입금/결제</p></c:when>
							<c:when test="${orderList.STATE eq 1}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">배송중</p></c:when>
							<c:when test="${orderList.STATE eq 2}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">배송완료</p></c:when>
							<c:when test="${orderList.STATE eq 3}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">구매확정</p></c:when>
							<c:when test="${orderList.STATE eq 4}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">교환</p></c:when>
							<c:when test="${orderList.STATE eq 5}"><p class="ft-SBAggroM mb-3" style="font-size: 20px;">환불</p></c:when>
						</c:choose>
							<p class="mb-2" style="border: 1px solid lightgray;">배송조회</p>
							
							<c:if test="${orderList.STATE eq 3}">
							<div class="text-white" href="#" role="button" style="background-color: black;">
								<div class="btn-group">
									<a class="nav-link link-white" href="#!">후기작성</a>
									<a class="nav-link dropdown-toggle text-white ps-0" id="navbarDropdown" role="button" data-bs-toggle="dropdown"></a>
									<ul class="dropdown-menu" style="text-align: center; min-width: 8rem;" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="/market/mypage/review/photo-form?orderIdx=${orderList.ORDER_IDX}">상품 사진 후기</a></li>
										<li><a class="dropdown-item" href="/market/mypage/review/normal-form?orderIdx=${orderList.ORDER_IDX}">일반후기</a></li>
									</ul>
								</div>
							</div>
							</c:if>
						</td>
					</tr>
					
					
				</tbody>
				</c:forEach>
			</table>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript">
	
	//현재시간으로 설정
	document.getElementById('fromDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
	
	console.dir(document.getElementById('fromDate').valueAsDate);
	
	//최대, 최소 날짜 설정
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; // 1월은 0
	var yyyy = today.getFullYear();
	
	 if(dd<10){
	     dd='0'+dd
	  } 
	if(mm<10){
		 mm='0'+mm
	} 
	
	today = yyyy+'-'+mm+'-'+dd; // yyyy-mm-dd
	
	document.getElementById("fromDate").setAttribute("max", today);
	document.getElementById("endDate").setAttribute("max", today);
	
	function resetDate() {
		
		var fromDate = document.getElementById('fromDate').value;
		var endDate = document.getElementById('endDate').value;
		 var fromArray = fromDate.split('-');
         var endArray = endDate.split('-');   
         
         var start_date = new Date(fromArray[0], fromArray[1], fromArray[2]);
         var end_date = new Date(endArray[0], endArray[1], endArray[2]);
              //날짜를 숫자형태로 바꿔서 비교
         if(start_date.getTime() > end_date.getTime()) {
             alert("종료날짜보다 시작날짜가 작아야합니다.");
             return false;
		}
	
	}
	
	//radio button으로 기간 설정
	function setDate() {
		
		//라디오버튼
		var radioLength = document.getElementsByName('period').length;
		for (var i = 0; i < radioLength; i++) {
            if (document.getElementsByName("period")[i].checked == true) {
            	var radioBnt = document.getElementsByName("period")[i].value;
            	console.dir(radioBnt);
            }
        }
		
		var date = new Date();
		var dd = date.getDate();
		var mm = date.getMonth()+1; // 1월은 0
		var yyyy = date.getFullYear();
		
		if(radioBnt=="1"){ //일주일 
			 dd=dd-7;
			 if(dd<10){dd='0'+dd} 
			 if(mm<10){mm='0'+mm} 
			 date = yyyy+'-'+mm+'-'+dd; // yyyy-mm-dd
			 document.getElementById('fromDate').value = date;
			 document.getElementById('endDate').valueAsDate = new Date();
		}else if(radioBnt=="2"){ //한달
			 mm=mm-1;
			 if(dd<10){dd='0'+dd} 
			 if(mm<10){mm='0'+mm} 
			 date = yyyy+'-'+mm+'-'+dd; 
			 document.getElementById('fromDate').value = date;
			 document.getElementById('endDate').valueAsDate = new Date();
		}else if(radioBnt=="3"){ //3개월
			 mm=mm-3;
			 if(dd<10){dd='0'+dd} 
			 if(mm<10){mm='0'+mm} 
			 date = yyyy+'-'+mm+'-'+dd;
			 document.getElementById('fromDate').value = date;
			 document.getElementById('endDate').valueAsDate = new Date();
		}
	}
		
		
		
	</script>


</body>
</html>