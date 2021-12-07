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
						<h4 class="page-title">댓글관리</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">댓글관리</li>
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
				<form class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-body no-padding">

								<div class="form-group row">

									<div class="col-sm-9">
										<div>
											<div style="display: table; width: 100%; margin-bottom: 5px;">
												<div style="display: table-row-group;">
													<div class='d-table-cell' style="width: 15%;">검색 종류</div>
													<div class='d-table-cell '>
														<input type="radio" name="option" id="search_option"
															value="c.nickname" checked><label class="ml-2 mr-2">작성자</label>
														<input type="radio" value="content" name="option"
															id="search_option"><label class="ml-2 mr-2">게시글</label>
														<input type="radio" name="option" id="search_option"
															value="bd_title"><label class="ml-2 mr-2">제목</label>
														<input type="radio" name="option" id="search_option"
															value="c.cm_content"><label class="ml-2 mr-2">댓글내용</label>
													</div>
												</div>
											</div>
											<div style="display: table; width: 100%; margin-bottom: 5px;">
												<div style="display: table-row-group;">
													<div class='d-table-cell' style="width: 15%;">키워드 검색</div>
													<div class='d-table-cell '>
														<input type="search" class="form-control"
															style="width: 50%" placeholder="작성자 내용 검색" name="keyword"
															aria-label="Search" required id="inp"
															value="${dataMap.keyword }">
													</div>
												</div>
											</div>

										</div>
										<div class="border-top">
											<div class="card-body">
												<button class="btn-secondary float-right ml-2"
													onclick="searchKeyword()">검색</button>
												<button class="btn-primary float-right" type="button"
													onclick="javascript:location.href=location.pathname">초기화</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>

				</form>
				<div class="row">

					<div class="col-12">

						<div class="card">
							<div class="card-header">
								<header>
									<input type="checkbox" class="all-check"
										style="vertical-align: middle;"> <span class="ml-2">전체
										댓글 <span class="text-primary">${totalCnt}</span>
									</span> <span class="float-right"> <select class="form-control"
										onchange="changeCategory()" aria-hidden="true" name="category"
										id="categorySelect">
											<option value="all">전체</option>


											<option value="info" data-select2-id="17">정보게시판</option>
											<option value="dog" data-select2-id="18">강아지게시판</option>

											<option value="cat" data-select2-id="20">고양이게시판</option>
											<option value="review" data-select2-id="21">후기게시판</option>
											<option value="meet" data-select2-id="22">모임게시판</option>
											<option value="consulting" data-select2-id="23">상담게시판</option>


									</select>
									</span>
								</header>

							</div>
							<form action="#" method="post">
								<div
									class="comment-widgets scrollable ps-container ps-theme-default"
									data-ps-id="4d3d0b7d-4667-4dfb-6173-498416fca048">
									<!-- Comment Row -->
									<c:forEach items="${cmList}" var="comment">
										<c:choose>
											<c:when test="${comment.CM_TYPE == 0 }">
												<div class="d-flex flex-row comment-row">
													<div class="p-2">
														<label><input type="checkbox"></label>
													</div>
													<div class="comment-text active w-100">
														<h6 class="font-medium">
															<a class="text-primary">${comment.NICKNAME}</a> <small><a>[${comment.CATEGORY}]${comment.BD_TITLE}</a></small>
														</h6>
														<div class="nav-item dropdown" href=""
															data-toggle="dropdown" aria-haspopup="true"
															aria-expanded="false"
															style="float: right; margin-top: -20px">

															<i class="m-r-10 mdi mdi-menu "> </i>
															<div class="dropdown-menu"
																aria-labelledby="navbarDropdown">
																<a class="dropdown-item" href="#">Action</a> <a
																	class="dropdown-item" href="#">Another action</a>
																<div class="dropdown-divider"></div>
																<a class="dropdown-item" href="#">Something else
																	here</a>
															</div>
														</div>

														<span class="m-b-15 d-block">${comment.CM_CONTENT}</span>


													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="d-flex flex-row comment-row">
													<div class="p-2">
														<label><input type="checkbox"></label>
													</div>
													<div class="comment-text active w-100">
														<h6 class="font-medium">
															<a class="text-primary">${comment.NICKNAME}</a> <small><a>[${comment.CATEGORY}]${comment.BD_TITLE}</a></small>
														</h6>
														<div class="nav-item dropdown" href=""
															data-toggle="dropdown" aria-haspopup="true"
															aria-expanded="false"
															style="float: right; margin-top: -20px">

															<i class="m-r-10 mdi mdi-menu "> </i>
															<div class="dropdown-menu"
																aria-labelledby="navbarDropdown">
																<a class="dropdown-item" href="#">Action</a> <a
																	class="dropdown-item" href="#">Another action</a>
																<div class="dropdown-divider"></div>
																<a class="dropdown-item" href="#">Something else
																	here</a>
															</div>
														</div>
														<blockquote>
															<p>
																<span class="_delete_c20211114d4744b20ab346"
																	style="font-size: 13px;"> :
																	${comment.ORIGIN_TIT} - ${comment.ORIGIN_NICK}</span>
															</p>
														</blockquote>
														<span class="m-b-15 d-block">${comment.CM_CONTENT}</span>


													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<!-- Comment Row -->

									<!-- Comment Row -->
									<div class="d-flex flex-row comment-row">
										<div class="p-2">
											<label><input type="checkbox"></label>
										</div>
										<div class="comment-text active w-100">
											<h6 class="font-medium">
												<a class="text-primary">관리자</a> <small><a>게시판 종류</a></small>
											</h6>
											<div class="nav-item dropdown" href="" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"
												style="float: right; margin-top: -20px">

												<i class="m-r-10 mdi mdi-menu "> </i>
												<div class="dropdown-menu" aria-labelledby="navbarDropdown">
													<a class="dropdown-item" href="#">Action</a> <a
														class="dropdown-item" href="#">Another action</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">Something else here</a>
												</div>
											</div>
											<blockquote>
												<p>
													<span class="_delete_c20211114d4744b20ab346"
														style="font-size: 13px;"> : 원래 게시물 - 관리자</span>
												</p>
											</blockquote>
											<span class="m-b-15 d-block">댓글 내용</span>


										</div>
									</div>
									<div class="ps-scrollbar-x-rail"
										style="left: 0px; bottom: 0px;">
										<div class="ps-scrollbar-x" tabindex="0"
											style="left: 0px; width: 0px;"></div>
									</div>
									<div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;">
										<div class="ps-scrollbar-y" tabindex="0"
											style="top: 0px; height: 0px;"></div>
									</div>


									<div class="border-top">
										<div class="card-body">
											<button class="btn-secondary ">submit</button>
											<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
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
<script src="/resources/js/admin/common/paging.js"></script>
	<script src="/resources/js/admin/common/select-tab.js"></script>
	<script type="text/javascript">
	(() =>{
		
		Array.prototype.forEach.call(document.querySelector("#categorySelect").options, e =>{
			if(e.value == "${dataMap.category}") e.selected = true;
		})
		
		document.querySelectorAll("#search_option").forEach(e =>{
			if(e.value == "${dataMap.option}") e.checked = true;
			
		})
		
		
	})();

 
    
  
    let changeCategory = () =>{
    	var categorySelect = document.getElementById("categorySelect");  
    	var categoryValue = categorySelect.options[categorySelect.selectedIndex].value; 
 		 URLSearch.set('category', String(categoryValue));
 		 URLSearch.set('page', String("1"));
    	 const newParam = URLSearch.toString();
    	 location.href = location.pathname + '?' + newParam
 	 
		}
    
    let searchKeyword = () =>{
    	var option = document.querySelector("#search_option").value
    	var keyword = document.querySelector("#inp").value
    	var category = document.querySelector("#category").value
    	keyword = keyword.trim()
    	
    	 URLSearch.set("option", String(option));
  		 URLSearch.set("keyword", String(keyword));
  		 URLSearch.set("category", String(category));
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