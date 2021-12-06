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
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
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
						<h4 class="page-title">사용자관리</h4>
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
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Basic Datatable</h5>
								<div class="table-responsive">
									<div id="zero_config_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12 col-md-6">
												<div class="dataTables_length" id="zero_config_length">
													<label>Show <select name="zero_config_length"
														aria-controls="zero_config" id="text"
														class="form-control form-control-sm"><option
																value="10">10</option>
															<option value="25">25</option>
															<option value="50">50</option>
															<option value="100">100</option></select> entries
													</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6">
												<div id="zero_config_filter" class="dataTables_filter">
													<label>Search:<input type="search"
														class="form-control form-control-sm" placeholder=""
														aria-controls="zero_config"></label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<table id="zero_config"
													class="table table-bordered"
													role="grid" aria-describedby="zero_config_info">
													<thead>
														<tr role="row" style="width: 100%">
															<th class="sorting_asc" style="width: 55.2812px;">이름
																- 아이디</th>
															<th style="width: 72.125px;">닉네임</th>
															<th style="width: 51px;">주소</th>
															<th  style="width: 25.1406px;">이메일</th>
															<th  style="width: 58.7812px;">가입일</th>
															<th style="width: 53.8125px;">탈퇴여부</th>
														</tr>
													</thead>
													<tbody>

														<c:forEach items="${memberList}" var="member">
															<tr>
																<td >${member.userName} - ${member.userId }</td>
																<td>${member.nickName}</td>
																<td>${member.address}</td>
																<td>${member.email}</td>
																<td><fmt:formatDate
															pattern="yyyy-MM-dd" value="${member.joinDate}" /></td>
																<td>
																<c:choose>
																	<c:when test="${member.isLeave == 1}">
																	O
																	</c:when>
																	<c:otherwise>
																	X
																	</c:otherwise>
																	
																</c:choose>
																
																</td>
															</tr>
														</c:forEach>
														
													</tbody>
													
												</table>
											</div>
										</div>
										<div class="card-body">

											<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
										</div>
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
	(() =>{
	     let loadState = URLSearch.get('state')
	     	document.querySelectorAll('.tab').forEach(e =>{
	     		if(loadState == null) {
	     			document.querySelector(".tab_all").id = "clickedTab"
	     		}else if(loadState == e.dataset.tab) e.id = "clickedTab"
	     	})
	     	
	     let pageState = URLSearch.get('page')
	     document.querySelectorAll('.page-link').forEach(e =>{
	     		if(pageState == null) {
	     			document.querySelector(".tab_all").id = "clickedTab"
	     		}else if(pageState == e.dataset.page) e.class = "active"
	     	})
    })();
	</script>


</body>

</html>