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



<title>똑DOG한 집사들 ADMIN</title>

<!-- Custom CSS -->
<link href="/resources/css/admin/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="/resources/css/admin/style.min.css" rel="stylesheet">


<style>
.d-table-cell input {
	vertical-align: middle;
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
						<h4 class="page-title">문의사항</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">문의사항</li>
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

				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body no-padding">
								<form>
									<div class="form-group row">

										<div class="col-sm-9">
											<div>
												<div
													style="display: table; width: 100%; margin-bottom: 5px;">
													<div style="display: table-row-group;">
														<div class='d-table-cell' style="width: 15%;">문의상태</div>
														<div class='d-table-cell '>
															<input type="radio" name="grade" checked><label
																class="ml-2 mr-2">전체</label> <input type="radio"
																name="grade"><label class="ml-2 mr-2">답변대기</label>
															<input type="radio" name="grade"><label
																class="ml-2 mr-2">답변완료</label>

														</div>
													</div>
												</div>
												<div
													style="display: table; width: 100%; margin-bottom: 5px;">
													<div style="display: table-row-group;">
														<div class='d-table-cell' style="width: 15%;">구매평 유형</div>
														<div class='d-table-cell '>
															<input type="radio" name="comment-type" checked><label
																class="ml-2 mr-2">전체</label> <input type="radio"
																name="comment-type"><label class="ml-2 mr-2">일반문의</label>
															<input type="radio" name="comment-type"><label
																class="ml-2 mr-2">포토문의</label>
														</div>
													</div>
												</div>
												<div
													style="display: table; width: 100%; margin-bottom: 5px;">
													<div style="display: table-row-group;">
														<div class='d-table-cell' style="width: 15%;">비밀문의
															여부</div>
														<div class='d-table-cell '>
															<input type="radio" name="allow-type" checked><label
																class="ml-2 mr-2">전체</label> <input type="radio"
																name="allow-type"><label class="ml-2 mr-2">비밀문의</label>
															<input type="radio" name="allow-type"><label
																class="ml-2 mr-2">공개문의</label>

														</div>
													</div>
												</div>
												<div
													style="display: table; width: 100%; margin-bottom: 5px;">
													<div style="display: table-row-group;">
														<div class='d-table-cell' style="width: 15%;">키워드 검색</div>
														<div class='d-table-cell '>
															<input type="text" class="form-control"
																style="width: 50%" placeholder="작성자 내용 검색"
																name="keyword">
														</div>
													</div>
												</div>

											</div>
											<div class="border-top">
												<div class="card-body">
													<button class="btn-secondary float-right ml-2">검색</button>
													<button class="btn-primary float-right">초기화</button>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>

				</div>
				<div class="row">

					<div class="col-12">
						<div class="card-head ">
							<header class=" comments-header ml-3">
								<div>
									<label class="no-margin"> <input type="checkbox"
										class="all-check" style="vertical-align: middle;"> <span
										class="ml-2">전체문의 <span class="text-primary"
											id="review_total_count">3</span></span>
									</label>
								</div>
							</header>


						</div>
						<div class="card" id="review_list">
							<div class="card-body no-padding ">
								<div style="">
									<div class="card"
										style="display: table; border-collapse: collapse; width: 100%;">
										<c:forEach items="${qnaList}" var="qnaList">


											<div class="border-bottom "
												style="display: table-row-group; padding: 20px 30px 20px 0;">
												<div class="d-table-cell pt-3"
													style="width: 2%; vertical-align: top;">
													<label><input type="checkbox"></label>
												</div>
												<div class="d-table-cell pt-3"
													style="vertical-align: top; width: 20%;">
													<div class="" style="font-size: 12pt;">
														<div class="d-inline-block" style="cursor: pointer;">${qnaList.TITLE }</div>
														<c:choose>
															<c:when test="${qnaList.IS_ANSWER == 0}">
																<span class="d-inline-block text-cyan ml-1">답변 대기</span>
															</c:when>
															<c:otherwise>
																<span class="d-inline-block text-danger ml-1">답변
																	완료</span>
															</c:otherwise>
														</c:choose>


													</div>
													<div class="pt-2">
														<c:choose>
															<c:when test="${qnaList.TYPE == 0}">
                                                    		상품문의 - ${qnaList.NAME}
                                                    	</c:when>
															<c:when test="${qnaList.TYPE == 1}">
                                                    		교환문의(${qnaList.TELL})
                                                    	</c:when>
															<c:when test="${qnaList.TYPE == 2}">
                                                    		환불문의(${qnaList.TELL})
                                                    	</c:when>
															<c:when test="${qnaList.TYPE == 3}">
                                                    		취소문의(${qnaList.TELL})
                                                    	</c:when>
															<c:when test="${qnaList.TYPE == 4}">
                                                    		배송문의(${qnaList.TELL})
                                                    	</c:when>
															<c:when test="${qnaList.TYPE == 5}">
                                                    		주문/결제문의(${qnaList.TELL})
                                                    	</c:when>
															<c:when test="${qnaList.TYPE == 6}">
                                                    		회원관련문의(${qnaList.TELL})
                                                    	</c:when>
															<c:when test="${qnaList.TYPE == 7}">
                                                    		기타문의(${qnaList.TELL})
                                                    	</c:when>
															<c:when test="${qnaList.TYPE == 8}">
                                                    		신고(${qnaList.TELL})
                                                    	</c:when>
															<c:when test="${qnaList.TYPE == 9}">
                                                    		기능/작동 오류(${qnaList.TELL})
                                                    	</c:when>

														</c:choose>
													</div>
													<span class="d-inline-block  text-primary">${qnaList.USER_NAME}</span>
													<span class="d-inline-block ml-2" style="color: gray;"><fmt:formatDate
															pattern="yyyy-MM-dd hh:mm:ss" value="${qnaList.REG_DATE}" /></span>
													<div class="pt-2  pb-3">${qnaList.CONTEXT }</div>

												</div>


												<c:if test="${qnaList.IS_ANSWER == 0}">
													<div class="d-table-cell board_thumb_wrap"
														style="padding: 10px; width: 63%">
														<div>
															<textarea rows="2" cols="" class="form-control" style="width:70%; margin-left:30%"></textarea>
														</div>
													</div>

													<div class="d-table-cell text-right"
														style="vertical-align: middle; width: 10%">
														<button class="btn btn-cyan">답변달기</button>
													</div>
												</c:if>


											</div>
										</c:forEach>




									</div>
								</div>
							</div>
							<div class="border-top">
								<div class="card-body">
									<button class="btn-secondary ">submit</button>
									<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
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
	<!--This page JavaScript -->

	<script src="/resources/js/admin/common/paging.js"></script>
	<script src="/resources/js/admin/common/select-tab.js"></script>


</body>

</html>