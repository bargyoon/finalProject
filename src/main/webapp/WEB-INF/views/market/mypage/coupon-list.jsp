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
					<li><a href="/market/mypage/address-list">주소록 관리</a></li>
					<li><a href="/market/mypage/enquiry/enquiry-list">구매상품문의</a></li>
					<li><a href="/market/mypage/enquiry/faq?type=1">FAQ</a></li>
				</ul>
			</div>
		</aside>
		<div class="container2" style="display: flex; flex-direction: column;">
			<p class="py-3 mb-0" style="font-size: 1.3rem;">쿠폰 <span style="color: steelblue;">${couponCnt}장</span></p>
			<table class="simple-table">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: auto;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 0%;">
				</colgroup>
				<thead>
					<tr>
						<td>쿠폰번호</td>
						<td>쿠폰명</td>
						<td>할인율</td>
						<td>적용 범위</td>
						<td>유효 기간</td>
						<td>&nbsp;</td>
					</tr>
				</thead>
				
				<c:forEach var="couponList" items="${couponList}">
				<tbody>
				
					<tr>
						<td>${couponList.UC_IDX} </td>
						<td class="cp-name">
						
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<%-- <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/> --%>
						<fmt:parseDate var="expDate" value="${couponList.EXP_DATE}" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber var="todayTime" value="${today.time / (1000*60*60*24)}" integerOnly="true"/>
						<fmt:parseNumber var="expDateTime" value="${expDate.time / (1000*60*60*24)}" integerOnly="true"/>
						
						<c:choose>
								<c:when test="${expDateTime - todayTime < 3}">
									<span>만료임박</span> 
								</c:when>
						</c:choose>	
						
							${couponList.NAME} 
						</td>
						<td class="cp-percent"><c:out value="${couponList.SALE_PER}%"/></td>
						<td class="cp-range">일부 대상</td>
						<td>
							<ul>
								<li><fmt:formatDate value="${couponList.REG_DATE}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${couponList.EXP_DATE}" pattern="yyyy-MM-dd"/></li>
								<li style="color: gray;">${expDateTime - todayTime + 1}일 남음</li>
							</ul>
						</td>
					</tr>							
				</tbody>
				</c:forEach>
			</table>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>



</body>
</html>