<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/shop-head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/market/slick/slick.css">
<link rel="stylesheet" href="${contextPath}/resources/css/market/slick/slick-theme.css">

</head>
<body onscroll="checkHeight()">
	<%@ include file="/WEB-INF/views/include/market/market-nav.jsp"%>
	<c:set var="optionInfos" value="${prdInfoMap.optionList}"/>
	<c:set var="prdInfo" value="${prdInfoMap.prdInfo}"/>
	<section class="pt-5 pb-3" style="margin-top: 8rem;">
		<div class="container text-center mt-5 prd-category">
			<p class="display-7 fw-bolder">상품 카테고리</p>
			<div class="pb-3">
				<hr style="width: 9rem;">
			</div>
			<ul>
				<li><a class="dropdown-item" href="#!">전체</a></li>
				<li><a class="dropdown-item" href="#!">간식</a></li>
				<li><a class="dropdown-item" href="#!">사료</a></li>
				<li><a class="dropdown-item" href="#!">건강관리</a></li>
				<li><a class="dropdown-item" href="#!">위생/배변</a></li>
				<li><a class="dropdown-item" href="#!">미용/목욕</a></li>
				<li><a class="dropdown-item" href="#!">급수기/급식기</a></li>
				<li><a class="dropdown-item" href="#!">하우스/울타리</a></li>
				<li><a class="dropdown-item" href="#!">이동장</a></li>
				<li><a class="dropdown-item" href="#!">의류/악세서리</a></li>
				<li><a class="dropdown-item" href="#!">장난감</a></li>
			</ul>
		</div>
	</section>

	<section class="container" style="margin-top: 10rem;">
		<div class="prd-detail">
			<img class="prd-detail-img" src="https://dummyimage.com/500x500/dee2e6/6c757d.jpg" alt="..." />
			<div class="prd-detail-info">
				<p class="prd-name mb-2" style="font-size: 23px; font-weight: bold;"><c:out value="${prdInfo.name}"/></p>
				<input type="hidden" id="prd-name" value="${prdInfo.name}">
				<div class="d-flex small text-warning pb-1">
					<c:forEach var="i" begin="0" step="1" end="${prdInfo.rating-1}">
						<i class="fas fa-star"></i>
					</c:forEach>
					<button class="review-btn" type="button" onclick="focusReview()"><c:out value="(${reviews.size()})"/></button>
				</div>
				<div class="d-flex justify-content-between mt-2">
					<p style="font-size: 18px;"><fmt:formatNumber value="${prdInfo.price}"/></p>
					<button class="review-btn" type="button">
						<i class="fas fa-share-alt"></i>
					</button>
				</div>
				<hr class="mt-0">
				<ul class="prd-detail-sub">
					<li id="sm-amount" class="pb-1">구매혜택 <span class="fw-normal" style="padding-left: 0.8rem;">상품주문가격의 5% 적립</span></li>
					<li class="pb-1">배송방법 <span class="fw-normal" style="padding-left: 0.8rem;">택배</span></li>
					<li class="pb-1">배송비 <span class="fw-normal" style="padding-left: 1.55rem;">50,000원 이상 구매시 무료</span></li>
				</ul>
				<div class="prd-option p-3">
					<p>옵션선택</p>
					<hr>
					<select class="prd-option-select" onchange="addOption(this.value)">
						<option value="">상품 옵션 선택</option>
							<c:forEach var="i" begin="0" step="1" end="${optionInfos.size()-1}">
								<c:if test="${optionInfos[i].poStock eq 0}">
									<option class="sold-out-prd" value="null">
										<c:out value="${optionInfos[i].poName} (품절)"/>
									</option>
								</c:if>
								<c:if test="${optionInfos[i].poStock ne 0}">
									<option value="${optionInfos[i].dtIdx}">
										<c:out value="${optionInfos[i].poName} (${optionInfos[i].poStock} 개 남음)"/>
									</option>
								</c:if>
							</c:forEach>
					</select>
				</div>
				<div class="option-form">
					<c:forEach var="i" begin="0" step="1" end="${optionInfos.size()-1}">
						<input type="checkbox" name="dtIdxs" value="${optionInfos[i].dtIdx}">
					</c:forEach>
				</div>
				<div class="mt-5 discount-div">
					<div class="d-flex justify-content-between">
						<input id="uc-idx" name="uc-idx" type="hidden" value="0">
						<input id="cp-amount-hidden" type="hidden" value="0">
						<button class="fw-bolder" type="button" onclick="useCoupon()">쿠폰 적용</button>
						<span id="cp-amount" style="font-size: 15px;">버튼을 눌러 쿠폰을 적용하세요.</span>
					</div>
					<div class="mt-3 d-flex justify-content-between">
						<span id="sm-use" style="font-size: 15px;">적립금 사용</span>
						<input id="sm-value-hidden" name="sm-amount" type="hidden" value="0">
						<strong>
							<input id="sm-value" value="" onkeyup="applySm()">
							<label for="sm-value" style="font-size: 15px;">원</label>
						</strong>
					</div>
					<div style="font-family: 'SBAggroL'; flex-direction:column; color: gray;" class="d-flex justify-content-between">
						<div>
							<span>사용 가능 적립금 : </span>
							<input id="sm-available-hidden" type="hidden" value="0">
							<input id="sm-available" style="outline: none;" type="text" readonly="readonly" value="0">
						</div>
						<div>
							<span>총 보유 적립금 : </span>
							<input id="have-sm-hidden" type="hidden" value="10000">
							<input id="have-sm" style="outline: none;" type="text" readonly="readonly" value="10000 원" />
						</div>
					</div>
				</div>
				<div class="pt-4 d-flex justify-content-between">
					<p class="mb-0">총 상품금액</p>
					<input type="hidden" id="total-price-hidden" value="0">
					<input class="fw-bolder" type="text" id="prd-total-price" readonly="readonly" value="0 원"></input>
				</div>
				<div class="mt-4 d-flex justify-content-between buy-btns">
					<button class="buy-btn" type="submit" onclick="requestPay('${prdInfo.prdIdx}', '${sessionScope.authentication.userIdx}')">구매하기</button>
					<button class="cart-btn" type="button">장바구니</button>
				</div>
			</div>
		</div>
	</section>


	<section class="container mb-5" style="min-height: 40rem; margin-top: 15rem;">
		<div class="prd-detail-tab">
			<ul class="detail-tab-ul d-flex mt-2">
				<li><button type="button">상세정보</button></li>
				<li>/</li>
				<li>
					<button type="button" onclick="focusReview()">구매평</button>
					<span class="badge text-white pt-2 rounded-pill" style="background-color: lightslategrey;">40</span>
				</li>
				<li>/</li>
				<li>
					<button type="button" onclick="focusQnA()">상품 Q&A</button>
					<span class="badge text-white pt-2 rounded-pill" style="background-color: lightslategrey;">0</span>
				</li>
			</ul>
		</div>
		<hr>
		<div class="prd-description my-5">
			<img src="../img/description_sample_img.jpg">
		</div>
		<div class="prd-review-tab my-5">
			<p id="prd-review-tit">구매평</p>
			<hr style="margin-top: 0;">
			<ul class="review-nav mt-3">
				<li><button id="focus-r" type="button"> 전체 <span style="font-size: 13px;">(${reviews.size()} 건)</span></button></li>
				<li><button type="button">사진후기 <span style="font-size: 13px;">(10건)</span></button></li>
				<li><button type="button">일반후기 <span style="font-size: 13px;">(30건)</span></button></li>
			</ul>
		</div>
		<div class="prd-review-area my-5">
			<div class="d-flex my-5">
				<img src="https://dummyimage.com/100x100/dee2e6/6c757d.jpg" style="border-radius: 7rem; height: 100px; width: 100px;" />
				<div class="prd-review-content mx-5">
					<div class="d-flex justify-content-between" style="min-height: 60px;">
						<p style="font-weight: bold;">NICKNAME</p>
						<p style="color: lightslategray;">2021.11.15</p>
					</div>
					<div class="d-flex text-warning pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<p class="mt-2">옵션 : 옵션</p>
					<p class="review-content-text">
						각 브랜드 사료 성분 검사에서 나쁜거 안나오고 좋은 사료여서 주문했습니다.<br>
						강아지가 너무 잘 먹어어요.<br>
						혹시 몰라 제일 작은 용량으로 시킨건데<br>
						다음에 큰 용량으로 주문해야겠습니다.<br>
						유통기한은 짧지도 넉넉하지도 않은편입니다.
					</p>
					<div class="extend-img-area"></div>
					<div class="review-content-imgs my-3">
						<div onclick="changeImgSize(this)">
							<img src="https://dummyimage.com/500x500/dee2e6/6c757d.jpg" style="max-width: 200px; max-height: 200px;">
						</div>
						<div onclick="changeImgSize(this)">
							<img src="https://dummyimage.com/500x500/dee2e6/6c757d.jpg" style="max-width: 200px; max-height: 200px;">
						</div>
						<div onclick="changeImgSize(this)">
							<img src="https://dummyimage.com/500x500/dee2e6/6c757d.jpg" style="max-width: 200px; max-height: 200px;">
						</div>
						<div onclick="changeImgSize(this)">
							<img src="https://dummyimage.com/500x500/dee2e6/6c757d.jpg" style="max-width: 200px; max-height: 200px;">
						</div>
					</div>
					<div class="mt-3">
						<input id="likeBtn" type="checkbox" onclick="" style="display: none;">
						<label class="like-btn px-lg-2" for="likeBtn"><i class="fas fa-laugh-beam py-1" style="color: orange;"></i> 도움돼요 3</label>
					</div>
				</div>
			</div>
			<hr>
			<div class="d-flex my-5">
				<img src="https://dummyimage.com/100x100/dee2e6/6c757d.jpg" style="border-radius: 7rem; height: 100px; width: 100px;" />
				<div class="prd-review-content mx-5">
					<div class="d-flex justify-content-between" style="min-height: 60px;">
						<p style="font-weight: bold;">NICKNAME</p>
						<p style="color: lightslategray;">2021.11.15</p>
					</div>
					<div class="d-flex text-warning pb-1">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<p class="mt-2">옵션 : 옵션</p>
					<p class="review-content-text">
						각 브랜드 사료 성분 검사에서 나쁜거 안나오고 좋은 사료여서 주문했습니다.<br>
						강아지가 너무 잘 먹어어요.<br>
						혹시 몰라 제일 작은 용량으로 시킨건데<br>
						다음에 큰 용량으로 주문해야겠습니다.<br>
						유통기한은 짧지도 넉넉하지도 않은편입니다.
					</p>
					<div class="mt-3">
						<input id="likeBtn" type="checkbox" onclick=""style="display: none;">
						<label class="like-btn px-lg-2" for="likeBtn"><i class="fas fa-laugh-beam py-1" style="color: orange;"></i> 도움돼요 3</label>
					</div>
				</div>
			</div>
		</div>
		<div class="prd-review-tab">
			<div class="d-flex justify-content-between" style="margin-top: 8rem;">
				<input type="text" readonly="readonly" value="Q&A" id="focus-q">
				<a href="#!"><button class="prd-enquiry-btn px-3 py-1" type="button">문의 작성</button></a>
			</div>
			<table class="prd-detail-qna mt-3">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: auto;">
					<col style="width: 15%;">
					<col style="width: 15%;">
				</colgroup>
				<thead>
					<tr style="font-size: 14px; text-align: center;">
						<th>문의유형</th>
						<th>문의/답변</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>배송</td>
						<td id="enquiry-1" class="enquiry_title text-start" onclick="openEnquiry(this)">
							<span style="border: 1px solid steelblue; color: steelblue; padding: 2px;">답변완료</span>배송 언제쯤 도착할까요 ?
						</td>
						<td>닉네임</td>
						<td>2021.08.15</td>
					</tr>
					<tr id="enquiry-1-context" class="enquiry_context eq-click">
						<td style="color: royalblue; font-size: 30px;">Q</td>
						<td class="text-start">작년에 시켰는데 택배 언제 도착할까요 ?</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr id="enquiry-1-answer" class="eq-click">
						<td style="color: red; font-size: 30px;">A</td>
						<td class="text-start">
							<p class="enquiry-answer" style="line-height: 2rem;">
								안녕하세요 똑Dog한 집사들 장터 고객센터 입니다.<br>
								먼저, 이용에 불편을 끼쳐 드린 점 진심으로 사과드립니다.<br>
								확인결과 고객님의 상품은 내년에 도착합니다.<br>
								다른 도움이 필요하시다면 고객센터(1234-4567)로 문의 부탁드립니다.<br>
								언제나 고객님의 편안한 쇼핑을 위하여 최선을 다하는 똑Dog한 집사들의 장터가 되겠습니다.<br>
								감사합니다.
							</p>
						</td>
						<td>스토어 담당자<br>윤수환
						</td>
						<td style="font-size: 14px;">21.08.16<br>15:31
						</td>
					</tr>
					<tr>
						<td>상품</td>
						<td id="enquiry-2" class="enquiry_title text-start">배송 언제쯤 도착할까요 ?</td>
						<td>닉네임</td>
						<td>2021.08.15</td>
					</tr>
					<tr>
						<td>배송</td>
						<td id="enquiry-3" class="enquiry_title text-start" onclick="openEnquiry(this)">
							<span style="border: 1px solid steelblue; color: steelblue; padding: 2px;">답변완료</span>배송 언제쯤 도착할까요 ?
						</td>
						<td>닉네임</td>
						<td>2021.08.15</td>
					</tr>
					<tr id="enquiry-3-context" class="enquiry_context eq-click">
						<td style="color: royalblue; font-size: 30px;">Q</td>
						<td class="text-start">작년에 시켰는데 택배 언제 도착할까요 ?</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr id="enquiry-3-answer" class="eq-click">
						<td style="color: red; font-size: 30px;">A</td>
						<td class="text-start">
							<p class="enquiry-answer" style="line-height: 2rem;">
								안녕하세요 똑Dog한 집사들 장터 고객센터 입니다.<br>
								먼저, 이용에 불편을 끼쳐 드린 점 진심으로 사과드립니다.<br>
								확인결과 고객님의 상품은 내년에 도착합니다.<br>
								다른 도움이 필요하시다면 고객센터(1234-4567)로 문의 부탁드립니다.<br>
								언제나 고객님의 편안한 쇼핑을 위하여 최선을 다하는 똑Dog한 집사들의 장터가 되겠습니다.<br>
								감사합니다.
							</p>
						</td>
						<td>스토어 담당자<br>윤수환
						</td>
						<td style="font-size: 14px;">21.08.16<br>15:31
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="prd-review-tab">
			<p id="prd-review-tit">환불규정</p>
			<hr style="margin-top: 0;">
			<ul class="mt-1">
				<li>규정 1</li>
				<li>규정 2</li>
				<li>규정 3</li>
				<li>규정 4</li>
				<li>규정 5</li>
			</ul>
		</div>
		<div class="prd-review-tab">
			<p id="prd-review-tit">구매시 주의사항</p>
			<hr style="margin-top: 0;">
			<ul class="mt-1">
				<li>주의사항 1</li>
				<li>주의사항 2</li>
				<li>주의사항 3</li>
				<li>주의사항 4</li>
				<li>주의사항 5</li>
			</ul>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>

        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/shop/prd-detail.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/slick.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/main-slick.js"></script>



</body>
</html>