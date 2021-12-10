<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>Matrix Template - The Ultimate Multipurpose admin
	template</title>

<!-- Custom CSS -->
<link href="/resources/css/admin/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="/resources/css/admin/style.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.table tbody tr td, th {
	border-right: 1px solid #dee2e6;
}
</style>
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<%@ include file="/WEB-INF/views/admin/include/nav.jsp"%>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">주문관리</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">사용자
										리스트</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>

			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="background-color: transparent;">
							<div class="row">
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab_all tab" data-tab="all"
												onclick="selectTab('state','all')">전체<span>
													${orderMap.totalCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="newOrder" onclick="selectTab('state','newOrder')">신규주문 <span>${orderMap.newOrderCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="delivering" onclick="selectTab('state','delivering')">배송중 <span>${orderMap.deliveringCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="deliverComplete" onclick="selectTab('state','deliverComplete')">배송완료 <span>${orderMap.deliverCompleteCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="newRefund" onclick="selectTab('state','newRefund')">반품대기중 <span>${orderMap.newRefundCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="refundComplete" onclick="selectTab('state','refundComplete')">반품완료 <span>${orderMap.refundCompleteCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="newCancel" onclick="selectTab('state','newCancel')">취소대기중 <span>${orderMap.newCancelCnt}</span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab" data-tab="cancelComplete" onclick="selectTab('state','cancelComplete')">취소완료 <span>${orderMap.cancelCompleteCnt}</span></a>
										</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
			
				<div class="row">

					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h5 class="card-title m-b-0 d-inline-block">주문목록</h5>

							</div>

							<div class="table-responsive">

								<table class="table mb-0">
									<thead class="thead-dark">
										<tr>

											<th scope="col" style="width: 12%;">주문번호/시각</th>
											<th scope="col" class="text-center" style="width: 20%;">주문상품</th>
											<th scope="col" class="text-right" style="width: 8%;">상품금액</th>
											<th scope="col" class="text-center" style="width: 5%;">수량</th>
											<th scope="col" class="text-center" style="width: 15%;">운송장번호</th>
											<th scope="col" class="text-center" style="width: 15%;">배송정보</th>
											<th scope="col" class="text-center" style="width: 15%;">결제내역</th>
											<th scope="col" class="text-center" style="width: 10%;">상태</th>
										</tr>
									</thead>
									<tbody class="customtable">
										<c:forEach items="${orderMap.orderList}" var="orderList">

											<c:choose>
												<c:when test="${orderList.CNT == 1}">

													<c:forEach items="${orderList.specList}" var="specList">

														<tr>

															<td>
																<div>
																	<span style="color: black;">${specList.ORDER_NUM}</span>
																</div>
																<div style="font-size: 10pt; color: gray;">
																	<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
																		value="${specList.ORDER_DATE}" />
																</div>
																<p style="margin-top: 10px;">주문자${specList.USER_NAME}</p>
															</td>
															<td><a><img
																	src="${specList.downloadURL}" style="width: 100px; height: 100px;"></a>
																<div class="d-inline-block">
																	<div style="font-size: 10pt; color: gray;">${specList.ORDER_NUM}</div>
																	<div>
																		<a href="#">${specList.NAME}(${specList.PO_NAME})</a>
																	</div>
																</div></td>
															<td class="text-right  ">${specList.PRICE * specList.ORDER_CNT}</td>
															<td class="text-center">${specList.ORDER_CNT}</td>
															<td>
																<form action="/admin/shopping/update-shipping"
																	method="post">
																	<input type="hidden" name="orderNum" id="orderNum"
																		value="${specList.ORDER_NUM}">
																	<div>
																		<select required name="shippingCompany" class="form-control"
																			id="shippingCompany${specList.ORDER_NUM}">
																			<option value="" selected disabled>택배사 선택</option>
																			<option value="CJ">CJ대한통운</option>
																			<option value="EPOST">우체국택배</option>
																			<option value="REGISTPOST">우편등기</option>
																			<option value="HANJIN">한진택배</option>
																			<option value="LOGEN">로젠택배</option>
																			<option value="GTX">GTX로지스</option>
																			<option value="LOTTE">롯데택배</option>
																			<option value="DS">대신택배</option>
																			<option value="IY">일양로지스</option>
																			<option value="KD">경동택배</option>
																			<option value="NHLOGIS">농협택배</option>
																			<option value="SEBANG">세방택배</option>
																			<option value="CI">천일택배</option>
																			<option value="CVS">CVSnet 편의점택배</option>
																			<option value="HD">합동택배</option>
																			<option value="EMS">EMS</option>
																			<option value="kpacket">K-Packet</option>
																			<option value="DHL">DHL</option>
																			<option value="FEDEX">Fedex</option>
																			<option value="GSMN">GSMNtoN</option>
																			<option value="UPS">UPS</option>
																			<option value="TNT">TNT Express</option>
																			<option value="USPS">USPS</option>
																			<option value="AIRBOY">에어보이익스프레스</option>
																			<option value="DHLMAIL">DHL Global Mail</option>
																			<option value="IPARCEL">i-Parcel</option>
																			<option value="HANWISA">한의사랑택배</option>
																			<option value="GUNYOUNG">건영택배</option>
																			<option value="BUMHAN">범한판토스</option>
																			<option value="APEX">APEX</option>
																			<option value="ECMSExpress">ECMSExpress</option>
																			<option value="GOODTOLUCK">굿투럭</option>
																			<option value="DHLGER">DHL 독일</option>
																			<option value="ACI">ACI</option>
																			<option value="LOTTEGLOBAL">롯데택배(국제택배)</option>
																			<option value="CJGLOBAL">CJ대한통운(국제택배)</option>
																			<option value="SUNGWON">성원글로벌</option>
																			<option value="DAEWOON">대운글로벌</option>
																			<option value="SLX">SLX택배</option>
																			<option value="HONAM">호남택배</option>
																			<option value="GSIEXPRESS">GSI익스프레스</option>
																			<option value="KGBPS">KGB 택배</option>
																			<option value="CUPARCEL">CU편의점택배</option>
																			<option value="VROONG">부릉</option>
																			<option value="todaypickup">오늘의 픽업</option>
																			<option value="CHAINLOGIS">두발히어로</option>
																			<option value="HOMEPICK">홈픽택배</option>
																			<option value="QXPRESS">큐익스프레스</option>
																			<option value="LINEEXP">라인익스프레스</option>
																			<option value="GPSLOGIX">GPS LOGIX</option>
																			<option value="CRLX">시알로지텍</option>
																			<option value="BRIDGE">브릿지로지스</option>
																			<option value="EFS">EFS</option>
																			<option value="FRESH">프레시솔루션</option>
																			<option value="FRESHMATES">프레시메이트</option>
																			<option value="GTSLOGIS">GTS로지스</option>
																			<option value="GENIEGO">지니고</option>
																			<option value="PINGPONG">핑퐁</option>
																			<option value="ETC">기타택배</option>
																		</select>
																	</div>
																	<div>
																		<c:choose>
																			<c:when test="${specList.SHIPPING_NUM ne null}">
																				<input type="text" placeholder="송장번호" required  class="form-control"
																					id="shippingNum" name="shippingNum"
																					value="${specList.SHIPPING_NUM}">
																			</c:when>
																			<c:otherwise>
																				<input type="text" placeholder="송장번호" required class="form-control"
																					id="shippingNum" name="shippingNum" value="">
																			</c:otherwise>
																		</c:choose>
																	</div>
																	<div>
																		<center><button type="submit">등록/수정</button></center>
																	</div>

																</form> <script type="text/javascript">
																(() =>{
																	Array.prototype.forEach.call(document.querySelector("#shippingCompany${specList.ORDER_NUM}").options, e =>{
																		if(e.value == "${specList.SHIPPING_COMPANY}") e.selected = true;
																	})
																})();
																</script>
															</td>

															<td>
																<div class="mb-2">
																	<strong>${specList.USER_NAME }</strong>/<span>전화번호</span>
																	<div class="mb-1" style="font-size: 10pt; color: gray">
																		주소주소주소주소<br>
																		<div>우편번호</div>
																	</div>
																</div>
															</td>
															<td>
																<div>
																	<div
																		style="display: table; width: 100%; margin-bottom: 7px;">
																		<div style="display: table-row-group;">
																			<div class='d-table-cell'>총 결제금액</div>
																			<div class='d-table-cell text-right'>${specList.PAYMENT_AMOUNT}원</div>
																		</div>
																	</div>
																	<div style="display: table; width: 100%; color: gray;">
																		<div style="display: table-row-group;">
																			<div class='d-table-cell'>소계</div>
																			<div class='d-table-cell text-right'>${specList.PAYMENT_AMOUNT+specList.CP_SAVE_MONEY + specList.SAVE_MONEY}원</div>
																		</div>
																		<div style="display: table-row-group;">
																			<div class='d-table-cell'>상품 할인금액</div>
																			<div class='d-table-cell text-right'>${specList.CP_SAVE_MONEY + specList.SAVE_MONEY}원</div>
																		</div>
																	</div>
																	<div style="display: table; width: 100%; color: gray;">
																		<div style="display: table-row-group;">
																			<div class='d-table-cell'>${specList.PAYMENY_METHOD}</div>
																			<div class='d-table-cell text-right'>${specList.PAYMENT_METHOD}<br>신한은행
																			</div>
																		</div>
																	</div>
																</div>
															</td>
															<td class="nav-item text-center "><span> <c:if
																		test="${specList.STATE == 'newOrder'}">신규주문</c:if>
															</span> <c:if test="${specList.STATE != 'newOrder'}">
																	<select name="state" id="state"
																		onchange="changeState(${specList.ORDER_NUM}, this.value)">

																		<c:if test="${specList.STATE == 'delivering'}">
																			<option value="delivering" selected>배송중</option>
																			<option value="deliverComplete">배송완료</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'deliverComplete'}">
																			<option value="delivering">배송중</option>
																			<option value="deliverComplete" selected>배송완료</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'newRefund'}">
																			<option value="newRefund" selected>반품대기중</option>
																			<option value="refundComplete">반품완료</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'refundComplete'}">
																			<option value="newRefund">반품대기중</option>
																			<option value="refundComplete" selected>반품완료</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'newCancel'}">
																			<option value="newCancel" selected>취소대기중</option>
																			<option value="cancelComplete">취소완료</option>
																		</c:if>
																		<c:if test="${specList.STATE == 'cancelComplete'}">
																			<option value="newCancel">취소대기중</option>
																			<option value="cancelComplete" selected>취소완료</option>
																		</c:if>

																	</select>
																</c:if></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach items="${orderList.specList}" var="specList"
														varStatus="status">
														<c:choose>
															<c:when test="${status.count == 1}">
																<tr>

																	<td rowspan="${orderList.CNT}">
																		<div>
																			<span style="color: black;">${specList.ORDER_NUM}</span>
																		</div>
																		<div style="font-size: 10pt; color: gray;">
																			<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
																				value="${specList.ORDER_DATE}" />
																		</div>
																		<p style="margin-top: 10px;">${specList.USER_NAME}</p>
																	</td>
																	<td><a><img
																			src="${specList.downloadURL}" style="width: 100px; height: 100px;"></a>
																		<div class="d-inline-block">
																			<div style="font-size: 10pt; color: gray;">${specList.ORDER_NUM}</div>
																			<div>
																				<a href="#">${specList.NAME}(${specList.PO_NAME})</a>
																			</div>
																		</div></td>
																	<td class="text-right  ">${specList.PRICE}</td>
																	<td class="text-center">${specList.ORDER_CNT}</td>
																	<td rowspan="${orderList.CNT}">
																		<form action="/admin/shopping/update-shipping"
																			method="post">
																			<input type="hidden" name="orderNum" id="orderNum"
																				value="${specList.ORDER_NUM}">
																			<div>
																				<select required name="shippingCompany" class="form-control"
																					id="shippingCompany${specList.ORDER_NUM}">
																					<option value="" selected disabled>택배사 선택</option>
																					<option value="CJ">CJ대한통운</option>
																					<option value="EPOST">우체국택배</option>
																					<option value="REGISTPOST">우편등기</option>
																					<option value="HANJIN">한진택배</option>
																					<option value="LOGEN">로젠택배</option>
																					<option value="GTX">GTX로지스</option>
																					<option value="LOTTE">롯데택배</option>
																					<option value="DS">대신택배</option>
																					<option value="IY">일양로지스</option>
																					<option value="KD">경동택배</option>
																					<option value="NHLOGIS">농협택배</option>
																					<option value="SEBANG">세방택배</option>
																					<option value="CI">천일택배</option>
																					<option value="CVS">CVSnet 편의점택배</option>
																					<option value="HD">합동택배</option>
																					<option value="EMS">EMS</option>
																					<option value="kpacket">K-Packet</option>
																					<option value="DHL">DHL</option>
																					<option value="FEDEX">Fedex</option>
																					<option value="GSMN">GSMNtoN</option>
																					<option value="UPS">UPS</option>
																					<option value="TNT">TNT Express</option>
																					<option value="USPS">USPS</option>
																					<option value="AIRBOY">에어보이익스프레스</option>
																					<option value="DHLMAIL">DHL Global Mail</option>
																					<option value="IPARCEL">i-Parcel</option>
																					<option value="HANWISA">한의사랑택배</option>
																					<option value="GUNYOUNG">건영택배</option>
																					<option value="BUMHAN">범한판토스</option>
																					<option value="APEX">APEX</option>
																					<option value="ECMSExpress">ECMSExpress</option>
																					<option value="GOODTOLUCK">굿투럭</option>
																					<option value="DHLGER">DHL 독일</option>
																					<option value="ACI">ACI</option>
																					<option value="LOTTEGLOBAL">롯데택배(국제택배)</option>
																					<option value="CJGLOBAL">CJ대한통운(국제택배)</option>
																					<option value="SUNGWON">성원글로벌</option>
																					<option value="DAEWOON">대운글로벌</option>
																					<option value="SLX">SLX택배</option>
																					<option value="HONAM">호남택배</option>
																					<option value="GSIEXPRESS">GSI익스프레스</option>
																					<option value="KGBPS">KGB 택배</option>
																					<option value="CUPARCEL">CU편의점택배</option>
																					<option value="VROONG">부릉</option>
																					<option value="todaypickup">오늘의 픽업</option>
																					<option value="CHAINLOGIS">두발히어로</option>
																					<option value="HOMEPICK">홈픽택배</option>
																					<option value="QXPRESS">큐익스프레스</option>
																					<option value="LINEEXP">라인익스프레스</option>
																					<option value="GPSLOGIX">GPS LOGIX</option>
																					<option value="CRLX">시알로지텍</option>
																					<option value="BRIDGE">브릿지로지스</option>
																					<option value="EFS">EFS</option>
																					<option value="FRESH">프레시솔루션</option>
																					<option value="FRESHMATES">프레시메이트</option>
																					<option value="GTSLOGIS">GTS로지스</option>
																					<option value="GENIEGO">지니고</option>
																					<option value="PINGPONG">핑퐁</option>
																					<option value="ETC">기타택배</option>
																				</select>
																			</div>
																			<div>
																				<c:choose>
																					<c:when test="${specList.SHIPPING_NUM ne null}">
																						<input type="text" placeholder="송장번호" required class="form-control"
																							id="shippingNum" name="shippingNum"
																							value="${specList.SHIPPING_NUM}">
																					</c:when>
																					<c:otherwise>
																						<input type="text" placeholder="송장번호" required  class="form-control"
																							id="shippingNum" name="shippingNum" value="">
																					</c:otherwise>
																				</c:choose>
																			</div>
																			<div>
																				<center><button
																						type="submit">등록/수정</button></center>
																			</div>

																		</form> <script type="text/javascript">
																(() =>{
																	Array.prototype.forEach.call(document.querySelector("#shippingCompany${specList.ORDER_NUM}").options, e =>{
																		if(e.value == "${specList.SHIPPING_COMPANY}") e.selected = true;
																	})
																})();
																</script>
																	</td>



																	<td rowspan="${orderList.CNT}">
																		<div class="mb-2">
																			<strong>${specList.USER_NAME}</strong>/<span>전화번호</span>
																			<div class="mb-1"
																				style="font-size: 10pt; color: gray">
																				주소주소주소주소<br>
																				<div>우편번호</div>
																			</div>
																		</div>
																	</td>
																	<td rowspan="${orderList.CNT}">
																		<div>
																			<div
																				style="display: table; width: 100%; margin-bottom: 7px;">
																				<div style="display: table-row-group;">
																					<div class='d-table-cell'>총 결제금액</div>
																					<div class='d-table-cell text-right'>${specList.PAYMENT_AMOUNT}원</div>
																				</div>
																			</div>
																			<div
																				style="display: table; width: 100%; color: gray;">
																				<div style="display: table-row-group;">
																					<div class='d-table-cell'>소계</div>
																					<div class='d-table-cell text-right'>${specList.PAYMENT_AMOUNT+specList.CP_SAVE_MONEY + specList.SAVE_MONEY}원</div>
																				</div>
																				<div style="display: table-row-group;">
																					<div class='d-table-cell'>상품 할인금액</div>
																					<div class='d-table-cell text-right'>${specList.CP_SAVE_MONEY + specList.SAVE_MONEY}원</div>
																				</div>
																			</div>
																			<div
																				style="display: table; width: 100%; color: gray;">
																				<div style="display: table-row-group;">
																					<div class='d-table-cell'>결제방법</div>
																					<div class='d-table-cell text-right'>${specList.PAYMENT_METHOD}<br>신한은행
																					</div>
																				</div>
																			</div>
																		</div>
																	</td>
																	<td rowspan="${orderList.CNT}"
																		class="nav-item text-center "><span> <c:if
																				test="${specList.STATE == 'newOrder'}">신규주문</c:if>
																	</span> <c:if test="${specList.STATE != 'newOrder'}">
																			<select name="state" id="state"
																				onchange="changeState(${specList.ORDER_NUM}, this.value)">

																				<c:if test="${specList.STATE == 'delivering'}">
																					<option value="delivering" selected>배송중</option>
																					<option value="deliverComplete">배송완료</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'deliverComplete'}">
																					<option value="delivering">배송중</option>
																					<option value="deliverComplete" selected>배송완료</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'newRefund'}">
																					<option value="newRefund" selected>반품대기중</option>
																					<option value="refundComplete">반품완료</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'refundComplete'}">
																					<option value="newRefund">반품대기중</option>
																					<option value="refundComplete" selected>반품완료</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'newCancel'}">
																					<option value="newCancel" selected>취소대기중</option>
																					<option value="cancelComplete">취소완료</option>
																				</c:if>
																				<c:if test="${specList.STATE == 'cancelComplete'}">
																					<option value="newCancel">취소대기중</option>
																					<option value="cancelComplete" selected>취소완료</option>
																				</c:if>

																			</select>
																		</c:if></td>

																</tr>
															</c:when>
															<c:otherwise>
																<tr>

																	<td><a><img
																			src="${specList.downloadURL}"  style="width: 100px; height: 100px;"></a>
																		<div class="d-inline-block">
																			<div style="font-size: 10pt; color: gray;">${specList.ORDER_NUM}</div>
																			<div>
																				<a href="#">${specList.NAME}(${specList.PO_NAME})</a>
																			</div>
																		</div></td>
																	<td class="text-right  ">${specList.PRICE * specList.ORDER_CNT}</td>
																	<td class="text-center">${specList.ORDER_CNT}</td>


																</tr>
															</c:otherwise>
														</c:choose>

													</c:forEach>

												</c:otherwise>
											</c:choose>


										</c:forEach>
										
									</tbody>
								</table>
								<div class="border-top">
										<div class="card-body">
											
											<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
										</div>
									</div>

							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Right sidebar -->
				<!-- ============================================================== -->
				<!-- .right-sidebar -->
				<!-- ============================================================== -->
				<!-- End Right sidebar -->
				<!-- ============================================================== -->
			</div>

			<footer class="footer text-center">
				All Rights Reserved by Matrix-admin. Designed and Developed by <a
					href="https://wrappixel.com">WrapPixel</a>.
			</footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="/resources/js/admin/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="/resources/js/admin/popper.min.js"></script>
	<script src="/resources/js/admin/bootstrap.min.js"></script>
	<script src="/resources/js/admin/perfect-scrollbar.jquery.min.js"></script>
	<script src="/resources/js/admin/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="/resources/js/admin/waves.js"></script>
	<!--Menu sidebar -->
	<script src="/resources/js/admin/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="/resources/js/admin/custom.min.js"></script>
	<script src="/resources/js/admin/common/paging.js"></script>
	<script src="/resources/js/admin/common/select-tab.js"></script>
	

	
	<script type="text/javascript">
		let changeState = (orderNum, state) =>{
 		
    	return fetch('/admin/shopping/update-order-state',{
 			method:"post",
 			body: JSON.stringify({orderNum : orderNum, state : state}),
 			 headers:{
 			    'Content-Type': 'application/json'
 			  }
    	}).then(res => {
    		alert('상태가 변경되었습니다.');
    		location.reload();
    	})
    		
 	
 	}
		
		let searchKeyword = () =>{
			
			var keyword = document.querySelector("#inp").value
			
			keyword = keyword.trim()

			URLSearch.set("keyword", String(keyword));
			if(keyword == ''){
				alert("검색어를 입력해주세요.")
				return
			}
		 	 const newParam = URLSearch.toString();
		 	 location.href = location.pathname + '?' + newParam
			
		}
		
	   
	</script>


</body>

</html>