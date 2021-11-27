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
#clickedTab {
	border-bottom: 2px solid blue;
	color: mediumblue;
	cursor: default;
}

.tab {
	cursor: pointer;
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
						<h4 class="page-title">Tables</h4>
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
										<h4>
											<a class="tab_all tab" data-tab="all"
												onclick="selectTab('state','all')">전체<span> 4</span></a>
										</h4>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h4>
											<a class="tab_n tab" data-tab="N"
												onclick="selectTab('state','N')">판매중 <span>4</span></a>
										</h4>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h4>
											<a class="tab_n tab" data-tab="N"
												onclick="selectTab('state','N')">품절 <span>0</span></a>
										</h4>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h4>
											<a class="tab_n tab" data-tab="N"
												onclick="selectTab('state','N')">숨김 <span>0</span></a>
										</h4>
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
					<div class="col-md-12">
						<div class="card">
							<div class="card-body no-padding">
								<form>
									<div class="form-group row">
										<label for="postSearch"><i
											style="position: absolute; top: 28px;" class="fas fa-search"></i></label>
										<label><a><i
												style="position: absolute; top: 28px; right: 26%; z-index: 999;"
												class="fas fa-times"></i></a></label>
										<div class="col-sm-9">
											<input type="text" class="form-control ml-3"
												placeholder="작성자 내용 검색" name="keyword">
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>

				</div>
				<div class="row">

					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h5 class="card-title m-b-0 d-inline-block">상품목록</h5>

								<button class="btn-primary float-right btn-lg">상품추가</button>

							</div>

							<div class="table-responsive">
								<form method="post">
									<table class="table mb-0">
										<thead class="thead-dark">
											<tr>
												<th><input type="checkbox" id="mainCheckbox" /></th>
												<th scope="col">NO</th>
												<th scope="col">상품명</th>
												<th scope="col">판매가</th>
												<th scope="col">카테고리</th>
												<th scope="col">상태</th>
												<th scope="col">재고</th>
												<th scope="col">등록일</th>
											</tr>
										</thead>
										<tbody class="customtable">
											<tr>
												<td><label class="mt-3"> <input type="checkbox"
														class="listCheckbox" /> <span class="checkmark"></span>
												</label></td>
												<td>01</td>
												<td><a><img
														src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>
													<div class="d-inline-block">
														<a href="#">화장품</a>
													</div></td>
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
														class="listCheckbox" /> <span class="checkmark"></span>
												</label></td>
												<td>02</td>
												<td><a><img
														src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>
													<div class="d-inline-block">
														<a href="#">화장품</a>
													</div></td>
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
														class="listCheckbox" /> <span class="checkmark"></span>
												</label></td>
												<td>03</td>
												<td><a><img
														src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>
													<div class="d-inline-block">
														<a href="#">화장품</a>
													</div> <span class="badge badge-danger">SALE</span></td>
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
														class="listCheckbox" /> <span class="checkmark"></span>
												</label></td>
												<td>04</td>
												<td><a><img
														src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>
													<div class="d-inline-block">
														<a href="#">화장품</a>
													</div></td>
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
											<button class="btn-secondary ">submit</button>
										</div>
									</div>
								</form>
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

	<script src="/resources/js/admin/datatables.min.js"></script>
	<script type="text/javascript">
	const URLSearch = new URLSearchParams(location.search);
    (() =>{
	     let loadState = URLSearch.get('state')
	     	document.querySelectorAll('.tab').forEach(e =>{
	     		if(loadState == null) {
	     			document.querySelector(".tab_all").id = "clickedTab"
	     		}else if(loadState == e.dataset.tab) e.id = "clickedTab"
	     	})
    })();
    let selectTab = (state,res) =>{
  		 if(location.search.includes(state)){
  		
  			 URLSearch.set(state, String(res));
     	 	 const newParam = URLSearch.toString();
     	 	 location.href = location.pathname + '?' + newParam
  	 	}else{
  			location.href = location.pathname+'?'+state+'='+res
  		}
  	  
   }
   
    </script>

</body>

</html>