<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">병명 등록</h4>
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
				<div id="content">
					<section>
						<div class="section-body">
							<form id="disease_add" method="post" enctype="multipart/form-data" class="form form-validate"
								role="form" autocomplete="off" novalidate="novalidate">
								<input type="hidden" name="idx" value="0">
								<!-- default_type - js 처리용 -->
								<input type="hidden" name="default_type" id="default_type"
									value="parcel">
								<div class="row">
									<div class="col-md-6">
										<div class="row ">
											<div class="col-md-12">
												<div class="card">
													<div class="card-header">
														<h6 class="card-title m-b-0 d-inline-block">병명이미지</h6>


														<span class="btn btn-flat btn-primary float-right"
															id="reset-img">reset</span>


													</div>
													<div id="prod_image_dropzone2"
														style="height: calc(100% - 50px);">
														<div class="card-body">
															<div class="drop-zone drop-img">
																<span class="drop-zone__prompt">이미지를 드래그 하거나 클릭해서
																	추가하세요</span> <input type="file" name="diseaseIcon"
																	class="drop-zone__input img-1" multiple>
															</div>
															<div id="prod_image_list" class="ui-sortable"></div>
														</div>
													</div>
												</div>
											</div>
											
										</div>
									</div>
									<div class="col-md-6">
										<div class="row ">

											<div class="col-md-12">
												<div class="card" style="min-height: 280px;">
													<div class="card-header">
														<h6 class="card-title m-b-0">병명 상세 정보</h6>
													</div>
													<div class="card-body">
														<div class="form-group">
															<label for="" class="control-label">병명</label>
															<div class="">
																<input type="text"
																	class="form-control prod-title-fixed-top inline-blocked"
																	name="name" value="" required
																	>
															</div>
														</div>
														<div class="form-group">
															<div class="row">
																<div class="col-md-6 m-margin-bottom-xl">
																	<label class="control-label">카테고리</label> <select
																		class="form-control" name="category" required>
																		<option value="" selected disabled>카테고리 선택</option>
																		<option value="cat">고양이</option>
																		<option value="dog">강아지</option>
																	</select>
																</div>
																<div class="col-md-6 m-margin-bottom-xl">
																	<label class="control-label">가격(원)</label> <input
																		type="text" class="form-control" name="price" value="" required>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label for="explain" class="control-label">세부설명</label>
															<div class="">
																<textarea
																	class="form-control prod-title-fixed-top inline-blocked"
																	name="explain" id="explain" required
																	></textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div>
							<button class="btn btn-primary" type="submit">저장</button>
						</div>
							</form>
						</div>
						<!--섹션 끝 -->
						
					</section>
				</div>
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
	<script src="/resources/js/admin/drag-drop.js"></script>
	<!--This page JavaScript -->

	

</body>

</html>
