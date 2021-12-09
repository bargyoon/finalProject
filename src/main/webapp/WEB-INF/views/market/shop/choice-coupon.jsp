<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/shop-head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/market/mypage.css">
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>"/>
	<fmt:formatDate pattern="yyyy-MM-dd" value="<%=new java.util.Date()%>" var="nowStr"/>
	<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowNum"/>
	<div class="container2 mt-3" style="display: flex; flex-direction: column;">
		<p class="py-3 mb-0" style="font-size: 1.3rem;">쿠폰 <span style="color: steelblue;">${couponList.size()}장</span></p>
		<c:if test="${couponList.size() ne 0}">
			<table class="simple-table">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: auto;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
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
				<tbody>
					<c:forEach var="i" begin="0" step="1" end="${couponList.size()-1}">
						<tr onclick="selectCoupon('${type}', '${couponList[i].salePer}', '${couponList[i].couponIdx}')">
							<td><input type="text" readonly="readonly" value="${couponList[i].couponIdx}"></td>
							<td class="cp-name">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${couponList[i].ucExpDate}" var="userExpDate"/>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${couponList[i].regDate}" var="userRegDate"/>
								<fmt:parseNumber value="${couponList[i].ucExpDate.time / (1000*60*60*24)}" integerOnly="true" var="userExpDateNum"/>
								<c:if test="${(userExpDateNum - nowNum) < 2}">
									<span>만료임박</span> 
								</c:if>
								${couponList[i].name}</td>
							<td class="cp-percent">${couponList[i].salePer}</td>
							<td class="cp-range">${couponList[i].type}</td>
							<td>
								<ul>
									<li><c:out value="${userRegDate} ~ ${userExpDate}"/></li>
									<li style="color: gray;">${(userExpDateNum - nowNum) + 1}일 남음</li>
								</ul>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<c:if test="${couponList.size() eq 0}">
			<div style="text-align: center;">
				<hr>
				<p class="mt-5 pt-5">보유한 쿠폰이 없습니다.</p>
			</div>
		</c:if>
	</div>
	<script type="text/javascript" src="${contextPath}/resources/js/market/shop/choice-coupon.js"></script>
</body>
</html>