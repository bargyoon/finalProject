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
												onclick="selectTab('state','all')">전체<span><c:out
														value="${datas.totalCnt }"></c:out></span></a>
										</h4>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h4>
											<a class="tab_n tab" data-tab="sale"
												onclick="selectTab('state','sale')">판매중 <span><c:out
														value="${datas.saleCnt }"></c:out></span></a>
										</h4>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h4>
											<a class="tab_n tab" data-tab="soldout"
												onclick="selectTab('state','soldout')">품절 <span><c:out
														value="${datas.soldoutCnt }"></c:out></span></a>
										</h4>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h4>
											<a class="tab_n tab" data-tab="hidden"
												onclick="selectTab('state','hidden')">숨김 <span><c:out
														value="${datas.hiddenCnt }"></c:out></span></a>
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
												placeholder="작성자 내용 검색" name="keyword" onsubmit="selectTab('keyword','this.value')">
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

								<span class="btn-primary float-right btn-lg" onclick="location.href='/admin/shopping/add-item'">상품추가</span>

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
										
										<c:forEach items="${datas.prdList}" var="data"
												varStatus="status">
											<tr>
												<td><label class="mt-3"> <input type="checkbox"
														class="listCheckbox" /> <span class="checkmark"></span>
												</label></td>
												<td>01</td>
												<td><a><img style="height: 60px; widht: 60px;"
														src="${data.downloadURL}"></a>
													<div class="d-inline-block">
														<a href="#">(${data.BRAND})${data.NAME}/${data.PO_NAME}</a>
													</div></td>
												<td>${data.SALE_PRICE}원</td>
												<td>
												<c:choose>
														<c:when test="${data.CATEGORY eq 'feed'}">사료</c:when>
														<c:when test="${data.CATEGORY eq 'snack'}">간식</c:when>
														<c:when test="${data.CATEGORY eq 'health'}">건강관리</c:when>
														<c:when test="${data.CATEGORY eq 'potty'}">위생/배변</c:when>
														<c:when test="${data.CATEGORY eq 'beauty'}">미용/목욕</c:when>
														<c:when test="${data.CATEGORY eq 'feeder'}">급수기/급식기</c:when>
														<c:when test="${data.CATEGORY eq 'kennel'}">하우스/울타리</c:when>
														<c:when test="${data.CATEGORY eq 'vari-kennel'}">이동장</c:when>
														<c:when test="${data.CATEGORY eq 'clothes'}">의류/악세서리</c:when>
														<c:when test="${data.CATEGORY eq 'toy'}">장난감</c:when>
														
													</c:choose>
												
												
												</td>
												<td class="nav-item dropdown" href="" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false"><span>
													<c:choose>
														<c:when test="${data.STATE eq 'sale'}">판매중</c:when>
														<c:when test="${data.STATE eq 'soldout'}">품절</c:when>
														<c:when test="${data.STATE eq 'hidden'}">숨김</c:when>
													</c:choose>
													</span><i
													class="m-r-10 mdi mdi-chevron-down ml-2"> </i>
													<div class="dropdown-menu" aria-labelledby="navbarDropdown">
														<c:if test="${data.STATE ne 'sale'}"><a class="dropdown-item" href="#">판매중</a></c:if> 
														<c:if test="${data.STATE ne 'soldout'}"><a class="dropdown-item" href="#">품절</a></c:if> 
														<c:if test="${data.STATE ne 'hidden'}"><a class="dropdown-item" href="#">숨김</a></c:if> 
														<div class="dropdown-divider"></div>
														<a class="dropdown-item text-warning" href="#">삭제</a>
													</div></td>

												<td>${data.PO_STOCK }</td>
												<td>${data.REG_DATE}</td>

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
											<div
												class="dataTables_paginate paging_simple_numbers float-right"
												id="zero_config_paginate">
												<ul class="pagination">
													<li class="paginate_button page-item previous disabled"
														id="zero_config_previous"><a
														aria-controls="zero_config" data-dt-idx="0" tabindex="0"
														class="page-link" onclick="prevBtn(${pageUtil.curPage})">Previous</a></li>
													<c:if test="${pageUtil.blockEnd eq 1}">
														<li class="paginate_button page-item active"><a
															href="#" aria-controls="zero_config" data-dt-idx="1"
															tabindex="0" class="page-link">1</a></li>
													</c:if>
													<c:if test="${pageUtil.blockEnd > 1}">
														<c:forEach var="i" begin="1" step="1"
															end="${pageUtil.blockEnd}">

															<li class="paginate_button page-item"><a href="#"
																aria-controls="zero_config" class="page-link"
																onclick="changePage(${i})">${i}</a></li>
														</c:forEach>
													</c:if>


													<li class="paginate_button page-item next"
														id="zero_config_next"><a href="#"
														aria-controls="zero_config" class="page-link"
														onclick="nextBtn(${pageUtil.curPage},${pageUtil.blockEnd})">Next</a></li>
												</ul>
											</div>
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

    
   	let prevBtn = (page) => {
		if(page == 1){
			alert("첫번째 페이지 입니다.")
			return;
		}
		
		page--;

		changePage(page);
		
	}
	
	let nextBtn = (page, blockEnd) => {
		if(page == blockEnd){
			alert("마지막 페이지 입니다.")
			return;
		}
		
		page++;
		
		changePage(page);
		
	}
    let changePage = (page) =>{
    	
      		 URLSearch.set('page', String(page));
         	 const newParam = URLSearch.toString();
         	 location.href = location.pathname + '?' + newParam
      	 
    }
   
    </script>

</body>

</html>