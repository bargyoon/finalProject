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
					<li><a href="#!">주문 내역 조회</a></li>
					<li><a href="#!">구매후기</a></li>
					<li><a href="#!">장바구니</a></li>
					<li><a href="#!" style="color: black;">상품문의</a></li>
					<li><a href="#!">주소록 관리</a></li>
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
					<a href="#!">
						<span class="ft-SBAggroM">1:1 Q&A</span><br>
						<span style="font-size: 12px;">질문 전 FAQ(자주 묻는 질문)을 먼저 확인하시면 도움이 됩니다.</span>
					</a>
				</li>
				<li>
					<a href="#!">
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
			<form class="pt-5" method="post">
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
										<select name="qa_kind">
											<option value="">문의유형 선택</option>
											<option value="8">교환</option>
											<option value="9">환불</option>
											<option value="10">취소(출하 전 취소)</option>
											<option value="11">배송</option>
											<option value="12">주문/결제</option>
											<option value="15">회원 관련</option>
											<option value="16">기타 문의</option>
											<option value="17">신고</option>
											<option value="19">기능/작동 오류</option>
										</select>
									</div>
								</td>
								<th>주문번호</th>
								<td>
									<input type="text" name="order_no" readonly="" value="">
									<button type="button" class="btn-outline-dark">조회</button>
									<p class="order-check__txt-type order-check__txt-type--orange" style="display: none;">필수 입력 항목</p>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" class="n-input" name="user_name" value="김영범"></td>
								<th>휴대전화</th>
								<td><input type="text" class="n-input" name="phone" value="010-4717-8981"></td>
							</tr>
							<tr style="border-bottom: 1px solid lightgray;">
								<th style="padding-bottom: 2rem;">이메일</th>
								<td style="padding-bottom: 2rem;"><input type="text" name="email" placeholder="이메일을 입력해주세요"></td>
							</tr>
							<tr>
								<th style="padding-top: 2rem;">제목</th>
								<td style="padding-top: 2rem;"><input type="text" name="title" value="" placeholder="제목을 입력해주세요."></td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td colspan="3"><textarea name="qa_msg" cols="160" rows="10" placeholder="내용을 입력해주세요."></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="d-flex py-3" style="justify-content: center;">
					<button type="button" class="py-2 px-lg-5 btn btn-outline-dark" style="font-size: 14px;">등록</button>
				</div>
			</form>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>



</body>
</html>