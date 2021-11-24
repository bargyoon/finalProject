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
<style type="text/css">
	table *{
		text-align: center;
	}
	
	.explain{
		overflow: hidden;
		max-height: 93px;
		max-width: 600px;
		text-overflow: ellipsis;
		white-space: nowrap;
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
		<%@ include file="/WEB-INF/views/admin/include/nav.jsp"%>
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">병명 리스트 관리</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">병명리스트</li>
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
								<h5 class="card-title m-b-0 d-inline-block">병명 목록</h5>

								<button class="btn-primary float-right btn-lg" onclick="location.reload()">병명 추가</button>

							</div>

							<div class="table-responsive">
								<form method="post">
									<table class="table mb-0">
										<thead class="thead-dark">
											<tr>
												<th style="width:5%"><input type="checkbox" id="mainCheckbox" /></th>
												<th scope="col" style="width:5%">NO</th>
												<th scope="col" style="width:10%">사진</th>
												<th scope="col" style="width:10%">병명</th>
												<th scope="col" style="width:40%">설명</th>
												<th scope="col" style="width:10%">가격</th>
												<th scope="col" style="width:10%">등록개수</th>
												<th scope="col" style="width:10%">종류</th>

											</tr>
										</thead>
										<tbody class="customtable">
											<c:forEach items="${datas}" var="data" varStatus="status">
												<tr>
												<td><label class="mt-3"> <input type="checkbox"
														class="listCheckbox" />
												</label></td>
												<td>${status.index+1}</td>
												<td><a><img style="height: 60px; widht: 60px;"
														src="${data.files.downloadURL }"></a>

												</td>
												<td>${data.disease.name}</td>
												<td><div class="explain">${data.disease.explain}</div></td>
												<td>${data.disease.price}원</td>
												<td>${data.disease.count}</td>
												<td>${data.disease.category}</td>

											</tr>
											</c:forEach>
											
											<tr>
												<td><label class="mt-3"> <input type="checkbox"
														class="listCheckbox" />
												</label></td>
												<td>02</td>
												<td><a><img
														src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>

												</td>
												<td>10000원</td>
												<td>4</td>
												<td class="nav-item dropdown" href="" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false"><span>반품중</span><i
													class="m-r-10 mdi mdi-chevron-down ml-2"> </i>
													<div class="dropdown-menu" aria-labelledby="navbarDropdown">
														<a class="dropdown-item" href="#">Action</a> <a
															class="dropdown-item" href="#">Another action</a>
														<div class="dropdown-divider"></div>
														<a class="dropdown-item" href="#">Something else here</a>
													</div></td>

												<td>4</td>
												<td>4</td>

											</tr>
											<tr>
												<td><label class="mt-3"> <input type="checkbox"
														class="listCheckbox" />
												</label></td>
												<td>03</td>
												<td><a><img
														src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>


												</td>
												<td>10000원</td>
												<td>4</td>
												<td class="nav-item dropdown" href="" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false"><span>반품중</span><i
													class="m-r-10 mdi mdi-chevron-down ml-2"> </i>
													<div class="dropdown-menu" aria-labelledby="navbarDropdown">
														<a class="dropdown-item" href="#">Action</a> <a
															class="dropdown-item" href="#">Another action</a>
														<div class="dropdown-divider"></div>
														<a class="dropdown-item" href="#">Something else here</a>
													</div></td>

												<td>4</td>
												<td>4</td>

											</tr>
											<tr>
												<td><label class="mt-3"> <input type="checkbox"
														class="listCheckbox" />
												</label></td>
												<td>04</td>
												<td><a><img
														src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>

												</td>
												<td>10000원</td>
												<td>4</td>
												<td class="nav-item dropdown" href="" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false"><span>반품중</span><i
													class="m-r-10 mdi mdi-chevron-down ml-2"> </i>
													<div class="dropdown-menu" aria-labelledby="navbarDropdown">
														<a class="dropdown-item" href="#">Action</a> <a
															class="dropdown-item" href="#">Another action</a>
														<div class="dropdown-divider"></div>
														<a class="dropdown-item" href="#">Something else here</a>
													</div></td>

												<td>4</td>
												<td>4</td>

											</tr>
										</tbody>
									</table>
									<div class="border-top">
										<div class="card-body">
											<button class="btn-secondary">submit</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<footer class="footer text-center">
				All Rights Reserved by Matrix-admin. Designed and Developed by <a
					href="https://wrappixel.com">WrapPixel</a>.
			</footer>
		</div>
	</div>
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

	<script src="/resources/js/admin/datatables.min.js"></script>
	<script type="text/javascript">
	
		
		
	</script>
</body>

</html>