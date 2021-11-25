<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
											<a style="border-bottom: 2px solid blue;">전체<span>
													4</span></a>
										</h4>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h4>
											<a>등록대기중 <span>4</span></a>
										</h4>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h4>
											<a>등록완료 <span>0</span></a>
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

					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h5 class="card-title m-b-0 d-inline-block">상품목록</h5>

							</div>

							<div class="table-responsive">
								<form method="post">
									<table class="table mb-0">
										<thead class="thead-dark">
											<tr>
												<th><input type="checkbox" id="mainCheckbox" /></th>
												<th scope="col">NO</th>
												<th scope="col">사진</th>
												<th scope="col">금액</th>
												<th scope="col">병명</th>
												<th scope="col">상태</th>
												<th scope="col">작성자</th>
												<th scope="col">등록일</th>
											</tr>
										</thead>
										<tbody class="customtable">
											<c:forEach items="${datas}" var="data" varStatus="status">
												<tr>
													<td><label class="mt-3"> <input
															type="checkbox" class="listCheckbox" /> <span
															class="checkmark"></span>
													</label></td>
													<td>${status.index+1}</td>
													<td><img id="img-r" src="${data.files.downloadURL}" onclick="fnImgPop('${data.files.downloadURL}')"
													style="width:60px; height:60px">
													
													</td>
													<td><input type="text" style="border: none;" readonly
														value="${data.priceImg.price}" class="input_price"></input>
														<span class="btn btn-secondary btn-sm ml-4"
														id="btn_update">수정</span></td>

													<td>${data.disease.name}(${data.disease.category})</td>
													<td><c:choose>
															<c:when test="${data.priceImg.state eq 'N'}">등록대기중</c:when>
															<c:when test="${data.priceImg.state eq 'Y'}">등록완료</c:when>
														</c:choose></td>
													<td>${data.priceImg.userIdx}</td>
													<td>${data.priceImg.regDate }</td>

												</tr>
											</c:forEach>
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
												<td><span>10000원</span><span
													class="btn btn-secondary btn-sm ml-4">수정</span></td>
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
	<script type="text/javascript">
	let flg=true;
   
    
     let fnImgPop = (url) =>{
                var img=new Image();
                img.src=url;
                
                var OpenWindow=window.open('','_blank', 'width='+630+', height='+930+', menubars=no, scrollbars=auto');
                OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+600+"'  height='"+900+"' onclick='self.close()'>");
        }
            

    
	</script>


</body>

</html>