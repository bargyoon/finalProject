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
			<img class="prd-detail-img" src="${prdFileInfo.prdImage.downloadURL}" alt="..." />
			<div class="prd-detail-info">
				<p class="prd-name mb-2" style="font-size: 23px; font-weight: bold;"><c:out value="${prdInfo.name}"/></p>
				<input type="hidden" id="prd-name" value="${prdInfo.name}">
				<div class="d-flex small text-warning pb-1">
					<c:if test="${prdInfo.rating ne 0}">
						<c:forEach var="i" begin="0" step="1" end="${prdInfo.rating-1}">
							<i class="fas fa-star"></i>
						</c:forEach>
						<button class="review-btn" type="button" onclick="focusReview()"><c:out value="(${reviews.size()})"/></button>
					</c:if>
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
						<button class="fw-bolder" type="button" onclick="useCoupon('${sessionScope.authentication.userIdx}')">쿠폰 적용</button>
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
							<input id="have-sm-hidden" type="hidden" value="${sessionScope.authentication.saveMoney}">
							<input id="have-sm" style="outline: none;" type="text" readonly="readonly" value="${sessionScope.authentication.saveMoney} 원" />
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
					<button class="cart-btn" type="button" onclick="registCart('${prdInfo.prdIdx}', '${sessionScope.authentication.userIdx}')">장바구니</button>
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
					<span class="badge text-white pt-2 rounded-pill" style="background-color: lightslategrey;">${cntByReviewType.photoReviewCnt + cntByReviewType.normalReviewCnt}</span>
				</li>
				<li>/</li>
				<li>
					<button type="button" onclick="focusQnA()">상품 Q&A</button>
					<span class="badge text-white pt-2 rounded-pill" style="background-color: lightslategrey;">${qnaList.size()}</span>
				</li>
			</ul>
		</div>
		<hr>
		<div class="prd-description my-5">
			<img src="${prdFileInfo.subImage.downloadURL}">
		</div>
		<div class="prd-review-tab my-5">
			<p id="prd-review-tit">구매평</p>
			<hr style="margin-top: 0;">
			<ul class="review-nav mt-3">
				<li><button id="focus-r" type="button" onclick="changeOption('${prdInfo.prdIdx}', '')"> 전체 <span style="font-size: 13px;">(${cntByReviewType.photoReviewCnt + cntByReviewType.normalReviewCnt} 건)</span></button></li>
				<li><button type="button" onclick="changeOption('${prdInfo.prdIdx}', '1')">사진후기 <span style="font-size: 13px;">(${cntByReviewType.photoReviewCnt} 건)</span></button></li>
				<li><button type="button" onclick="changeOption('${prdInfo.prdIdx}', '0')">일반후기 <span style="font-size: 13px;">(${cntByReviewType.normalReviewCnt} 건)</span></button></li>
			</ul>
		</div>
		<div class="prd-review-area my-5">
			<c:if test="${reviews.size() ne 0}">
				<c:forEach var="i" begin="0" step="1" end="${reviews.size()-1}">
					<div class="d-flex my-5">
						<div class="prd-review-content mx-5">
							<div class="d-flex justify-content-between" style="min-height: 60px;">
								<p style="font-weight: bold;">${reviews[i].userName}</p>
								<p style="color: lightslategray;"><fmt:formatDate pattern="yyyy-MM-dd" value="${reviews[i].regDate}"/></p>
							</div>
							<div class="d-flex text-warning pb-1">
								<c:forEach var="j" begin="0" step="1" end="${reviews[i].rating-1}">
									<i class="fas fa-star"></i>
								</c:forEach>
							</div>
							<p class="mt-2">옵션 : ${reviews[i].dtName}</p>
							<p class="review-content-text">
								${reviews[i].rvContent}
							</p>
							<c:if test="${reviews[i].type eq 1}">
								<div class="extend-img-area"></div>
								<div class="review-content-imgs my-3">
									<c:forEach var="k" begin="0" step="1" end="${reviewFiles[i].size()}">
										<c:if test="${reviewFiles[i].size() ne 0}">
											<div onclick="changeImgSize(this)">
												<img src="${reviewFiles[i][k].downloadURL}" style="max-width: 200px; max-height: 200px;">
											</div>
										</c:if>
									</c:forEach>
								</div>
							</c:if>
							<div class="mt-3">
								<input id="likeBtn-${reviews[i].rvIdx}" type="checkbox" onclick="checkLike(${reviews[i].rvIdx})" style="display: none;">
								<label class="like-btn px-lg-2" for="likeBtn-${reviews[i].rvIdx}"><i class="fas fa-laugh-beam py-1" style="color: orange;"></i> 
									도움돼요 <input id="like-${reviews[i].rvIdx}" onclick="checkLike(${reviews[i].rvIdx})" class="like-val" type="text" value="${reviews[i].recommand}">
								</label>
								
							</div>
						</div>
					</div>
					<hr>
				</c:forEach>
				<div class="page_wrap" style="margin-left: 2.4rem" id="pagination">
					<div class="page_nation">
						<a class="arrow prev" onclick="prevBtn('${prdInfo.prdIdx}',${pageUtil.curPage}, '${listSet.option}')"><i class="fas fa-angle-left"></i></a>
						<c:if test="${pageUtil.blockEnd eq 1}">
							<a class="active">1</a> 
						</c:if>
						
						<c:if test="${pageUtil.blockEnd > 1}">
							<c:forEach var="i" begin="1" step="1" end="${pageUtil.blockEnd}">
								<a onclick="pageBtn('${prdInfo.prdIdx}', '${listSet.option}', this.text)" class="active"><c:out value="${i}"/></a> 
							</c:forEach>
						</c:if>
						<a class="arrow next" onclick="nextBtn('${prdInfo.prdIdx}', ${pageUtil.curPage}, ${pageUtil.blockEnd} ,'${listSet.option}')"><i class="fas fa-angle-right"></i></a>
					</div>
				</div>
			</c:if>
			<c:if test="${reviews.size() eq 0}">
				<div class="pt-5 pb-5" style="text-align: center;">
                    <p>상품 후기가 없습니다</p>
               </div>
			</c:if>
		</div>
		<div class="prd-review-tab">
			<div class="d-flex justify-content-between" style="margin-top: 8rem;">
				<input type="text" readonly="readonly" value="Q&A" id="focus-q">
				<a href="#!"><button class="prd-enquiry-btn px-3 py-1" type="button">문의 작성</button></a>
			</div>
			<c:if test="${qnaList.size() ne 0}">
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
						<c:forEach var="qna" items="${qnaList}" varStatus="status">
							<tr>
								<td>상품</td>
								<td id="enquiry-${status.index}" class="enquiry_title text-start" onclick="openEnquiry(this)">
									<c:if test="${qna.isAnswer eq 1}">
										<span style="border: 1px solid steelblue; color: steelblue; padding: 2px;">답변완료</span>
									</c:if>
									배송 언제쯤 도착할까요 ?
								</td>
								<td>${qna.userName}</td>
								<td>${qna.regDate}</td>
							</tr>
							<c:if test="${qna.isAnswer eq 1}">
								<tr id="enquiry-${status.index}-context" class="enquiry_context eq-click" style="display: none">
									<td style="color: royalblue; font-size: 30px;">Q</td>
									<td class="text-start">${qna.context}</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr id="enquiry-${status.index}-answer" class="eq-click" style="display: none">
									<td style="color: red; font-size: 30px;">A</td>
									<td class="text-start">
										<p class="enquiry-answer" style="line-height: 2rem;">${qna.awContext}</p>
									</td>
									<td>스토어 담당자<br>윤수환
									</td>
									<td style="font-size: 14px;">${qna.awRegDate}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<div class="page_wrap" style="margin-left: 2.4rem" id="pagination">
					<div class="page_nation">
						<a class="arrow prev" onclick="prevBtnQna('${prdInfo.prdIdx}',${pageUtilQna.curPage})"><i class="fas fa-angle-left"></i></a>
						<c:if test="${pageUtilQna.blockEnd eq 1}">
							<a class="active">1</a> 
						</c:if>
						
						<c:if test="${pageUtilQna.blockEnd > 1}">
							<c:forEach var="i" begin="1" step="1" end="${pageUtilQna.blockEnd}">
								<a onclick="pageBtnQna('${prdInfo.prdIdx}', this.text)" class="active"><c:out value="${i}"/></a> 
							</c:forEach>
						</c:if>
						<a class="arrow next" onclick="nextBtnQna('${prdInfo.prdIdx}', ${pageUtilQna.curPage}, ${pageUtilQna.blockEnd})"><i class="fas fa-angle-right"></i></a>
					</div>
				</div>
			</c:if>
			<c:if test="${qnaList.size() eq 0}">
				<hr>
				<div class="pt-5 pb-5" style="text-align: center;">
                    <p>해당 상품에 대한 문의가 없습니다</p>
               </div>
			</c:if>
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