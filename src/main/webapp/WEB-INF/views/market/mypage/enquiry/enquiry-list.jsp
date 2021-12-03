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
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">상품문의</p>
			<hr class="mt-0" style="height: 3px; opacity: 1;">
			
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
					<col style="width: 45%">
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품정보</th>
						<th scope="col">내용</th>
						<th scope="col">문의 유형</th>
						<th scope="col">작성일</th>
						<th scope="col">처리 상태</th>
					</tr>
				</thead>
				
				<c:forEach var="enquiryList" items="${enquiryList}">
				<tbody class="tbody">
					<tr>
						<td>
							<div class="n-prd-row">
								<a href="#!"><img src="https://dummyimage.com/100x120/dee2e6/6c757d.jpg"></a>
								<ul class="info">
									<li class="brand">${enquiryList.BRAND}</li>
									<li class="name ft-SBAggroM"><a href="#!" style="text-decoration: none; color: black;">${enquiryList.NAME}</a></li>
									<li class="option">${enquiryList.PO_NAME}</li>
								</ul>
							</div>
						</td>
						<td class="enquiry_title text-start" onclick="openEnquiry()">${enquiryList.TITLE}</td>
						<c:choose>
							<c:when test="${enquiryList.TYPE eq '1'}"><td>교환문의</td></c:when>
							<c:when test="${enquiryList.TYPE eq '2'}"><td>환불문의</td></c:when>
							<c:when test="${enquiryList.TYPE eq '3'}"><td>취소문의</td></c:when>
							<c:when test="${enquiryList.TYPE eq '4'}"><td>배송문의</td></c:when>
							<c:when test="${enquiryList.TYPE eq '5'}"><td>주문/결제문의</td></c:when>
							<c:when test="${enquiryList.TYPE eq '6'}"><td>회원문의</td></c:when>
							<c:when test="${enquiryList.TYPE eq '7'}"><td>기타문의</td></c:when>
							<c:when test="${enquiryList.TYPE eq '8'}"><td>신고문의</td></c:when>
							<c:when test="${enquiryList.TYPE eq '9'}"><td>기능오류</td></c:when>
						</c:choose>
						<td><fmt:formatDate value="${enquiryList.REG_DATE}" pattern="yyyy-MM-dd"/></td>
						<c:if test="${enquiryList.IS_ANSWER eq 1}">
							<td style="color: steelblue;">답변</td>
						</c:if>
						<c:if test="${enquiryList.IS_ANSWER ne 1}">
							<td style="color: red;">미답변</td>
						</c:if>
					</tr>
					
					<!-- 문의 내용 -->
					<tr class="enquiry_context eq-click">
						<td>&nbsp;</td>
						<td class="text-start" colspan="3">${enquiryList.CONTEXT}</td>
						<td>&nbsp;</td>
					</tr>
					
					<!-- 답변 -->
					<c:if test="${enquiryList.IS_ANSWER eq 1}">
						<tr class="eq-click">
							<td>스토어 담당자<br>윤수환</td>
							<td colspan="3" class="text-start">
								<p class="enquiry-answer" style="line-height: 2rem;">
									안녕하세요 똑Dog한 집사들 장터 고객센터 입니다.<br>
									먼저, 이용에 불편을 끼쳐 드린 점 진심으로 사과드립니다.<br>
									확인결과 고객님의 상품은 내년에 도착합니다.<br>
									다른 도움이 필요하시다면 고객센터(1234-4567)로 문의 부탁드립니다.<br>
									언제나 고객님의 편안한 쇼핑을 위하여 최선을 다하는 똑Dog한 집사들의 장터가 되겠습니다.<br>
									감사합니다.
								</p>
							</td>
							<td style="font-size: 14px;">21.08.16<br>15:31</td>
						</tr>
					</c:if>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/enquiry-list.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/mypage/date-search.js"></script>


</body>
</html>