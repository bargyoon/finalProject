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
					<a href="/market/mypage/acc-money"><i class="fas fa-coins py-2" style="font-size: 1.5rem;"></i></a>
					<p class="fw-normal mt-2">적립금</p>
					<p style="font-size: 1.3rem;">${memberInfo.saveMoney}</p>
				</div>
				<div class="mt-5" style="display: flex; flex-direction: column;">
					<a href="/market/mypage/coupon-list"><i class="fas fa-ticket-alt py-2" style="font-size: 1.5rem"></i></a>
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
					<li><a href="/market/mypage/enquiry/enquiry-list" style="color: black;">상품문의</a></li>
					<li><a href="/market/mypage/address-list">주소록 관리</a></li>
					<li><a href="/market/mypage/enquiry/faq?type=1">FAQ</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">1:1 문의</p>
			<ul class="cs-nav">
				<li>
					<span class="ft-SBAggroM">Tel. 1234-4567</span><br>
					<span style="font-size: 12px;">평일: 9:00~18:00(점심 12:00~13:00)</span>
				</li>
				<li>
					<a href="market/mypage/enquiry-list">
						<span class="ft-SBAggroM">1:1 Q&A</span><br>
						<span style="font-size: 12px;">질문 전 FAQ(자주 묻는 질문)을 먼저 확인하시면 도움이 됩니다.</span>
					</a>
				</li>
				<li>
					<a href="market/mypage/faq">
						<span class="ft-SBAggroM">FAQ</span><br>
						<span style="font-size: 12px;">자주 묻는 질문</span>
					</a>
				</li>
			</ul>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			<p class="py-3 mb-0" style="font-size: 1rem;">1:1 Q&A</p>
			<ul class="px-lg-3">
				<li>제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사은품 및 부속 사용/분실 시, 교환/환불이 불가능 합니다.</li>
				<li>교환을 원하시는 상품(사이즈)의 재고가 부족 시, 교환이 불가합니다.</li>
				<li>고객님의 주문내역을 선택, 질문이 필요한 상품을 선택하시면 1:1상담이 가능합니다.</li>
				<li>1:1문의 처리 내역은 <span style="text-decoration: underline;">마이페이지>상품문의</span>를 통해 확인하실 수 있습니다.</li>
			</ul>
			<form action="/market/mypage/enquiry/upload" class="pt-5" 
				method="post" onsubmit="return check(this);" >
				<p class="mb-0">문의작성</p>
				<hr class="mt-0" style="height: 2px; opacity: 1;">
				<div class="py-2">
					<table class="container2 qa-table">
						<colgroup>
							<col style="width: 12%;">
							<col style="width: 50%;">
							<col style="width: 10%;">
							<col style="width: 50%;">
						</colgroup>
						<tbody>
							<tr>
								<th>문의유형</th>
								<td>
									<div class="bg-select">
										<select name="type" id="type">
											<option value="0">문의유형 선택</option>
											<option value="1">교환</option>
											<option value="2">환불</option>
											<option value="3">취소(출하 전 취소)</option>
											<option value="4">배송</option>
											<option value="5">주문/결제</option>
											<option value="6">회원 관련</option>
											<option value="7">기타 문의</option>
											<option value="8">신고</option>
											<option value="9">기능/작동 오류</option>
										</select>
									</div>
								</td>
								<th>주문번호</th>
								<td>
									<input type="text" name="orderIdx" id="orderIdx" readonly="readonly" value="">
									<button type="button" id="pop" class="btn-outline-dark">조회</button>
									<p class="order-check__txt-type order-check__txt-type--orange" style="display: none;">필수 입력 항목</p>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" class="n-input" name="user_name" value="${memberInfo.userName}" readonly="readonly"></td>
								<th>휴대전화(선택)</th>
								<td><input type="text" class="n-input" name="tell" placeholder="010-0000-0000"></td>
							</tr>
							<tr style="border-bottom: 1px solid lightgray;">
								<th style="padding-bottom: 2rem;">이메일</th>
								<td style="padding-bottom: 2rem;"><input type="text" name="email" value="${memberInfo.email}" readonly="readonly"></td>
							</tr>
							<tr>
								<th style="padding-top: 2rem;">제목</th>
								<td style="padding-top: 2rem;"><input type="text" name="title" value="" placeholder="제목을 입력해주세요."></td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td colspan="3">
									<textarea id="inputContent" name="context" cols="160" rows="10" placeholder="내용을 입력해주세요."></textarea>
									<p class="limit_text_alert" id="cntLength">(20자 / 0자) </p>
									<span id="contentCheck" class="valid-msg"></span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="d-flex py-3" style="justify-content: center;">
					<button type="submit" class="py-2 px-lg-5 btn btn-outline-dark" style="font-size: 14px;">등록</button>
				</div>
			</form>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script>

	//글자 수 200자 제한
	$("#inputContent").keyup(function (e){
	  
		var content = $(this).val();
		
		//실시간 글자수 세기
		$("#cntLength").html("(20자 / " + content.length +"자)"); 
		
		if(content.length > 200){
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 200));
			$('#cntLength').html("(200 / 최대 200자)");
		}
	});
		
	function check(i) {
		
		var target = document.getElementById("type");
		target = target.options[target.selectedIndex].value;     // 옵션 value 값		
		var orderIdx = document.getElementById("orderIdx").value.length;
		var content = document.getElementById("inputContent").value.length;
		if(orderIdx==0 || content==0 || target == 0){
			document.querySelector('#contentCheck').innerHTML = '모든 정보를 입력해야합니다.';
	        return false;
		}
	   }
	
	window.onload = function(){
        document.getElementById("pop").onclick = function(){
            window.open("enquiry-pop","","width=600px,height=400px,top=200px;");
        }

    };
	

</script>


	



</body>
</html>