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
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body no-padding">

								<div class="form-group row">

									<div class="col-sm-9">
										<div>
											<div style="display: table; width: 100%; margin-bottom: 5px;">
												<div style="display: table-row-group;">
													<div class='d-table-cell' style="width: 15%;">카테고리</div>
													<div class='d-table-cell '>
														<select style="width: 50%;" class="form-control"
															aria-hidden="true" name="category" id="category">
															<option data-select2-id="3">전체</option>


															<option value="info" data-select2-id="17">정보게시판</option>
															<option value="dog" data-select2-id="18">강아지게시판</option>

															<option value="cat" data-select2-id="20">고양이게시판</option>
															<option value="review" data-select2-id="21">후기게시판</option>
															<option value="meet" data-select2-id="22">모임게시판</option>
															<option value="consulting" data-select2-id="23">상담게시판</option>


														</select>
													</div>
												</div>
											</div>

											<div style="display: table; width: 100%; margin-bottom: 5px;">
												<div style="display: table-row-group;">
													<div class='d-table-cell' style="width: 15%;">검색 종류</div>
													<div class='d-table-cell '>
														<input type="radio" name="sort" id="search_option" value="nickname" checked><label
															class="ml-2 mr-2">작성자</label> <input type="radio" value="content"
															 name="sort" id="search_option"><label class="ml-2 mr-2">게시글</label>
														<input type="radio" name="sort" id="search_option" value="bd_title"><label
															class="ml-2 mr-2">제목</label>
													</div>
												</div>
											</div>
											<div style="display: table; width: 100%; margin-bottom: 5px;">
												<div style="display: table-row-group;">
													<div class='d-table-cell' style="width: 15%;">키워드 검색</div>
													<div class='d-table-cell '>
														<input type="text" class="form-control" style="width: 50%"
															placeholder="작성자 내용 검색" name="keyword" id="inp">
													</div>
												</div>
											</div>

										</div>
										<div class="border-top">
											<div class="card-body">
												<button class="btn-secondary float-right ml-2" onclick="searchKeyword()">검색</button>
												<button class="btn-primary float-right" type="button"
													onclick="javascript:location.href=location.pathname">초기화</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>

				</div>
				<div class="row">

					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h5 class="card-title m-b-0">게시글 관리</h5>
								<span class="float-right"><select name="category"
									id="sortSelect" onchange="sortList()" class="form-control">
										<option value="reg_date">등록일순</option>
										<option value="view_count">조회순</option>
										<option value="rec_count">추천순</option>

								</select></span>
							</div>

							<br>
							<div class="table-responsive">
								<form method="post">
									<table class="table mb-0">
										<thead class="thead-dark">
											<tr>
												<th style="width: 10%"><input type="checkbox"
													id="mainCheckbox" /></th>
												<th scope="col" style="width: 20%">제목</th>
												<th scope="col" style="width: 10%">작성자</th>
												<th scope="col" style="width: 10%">위치</th>
												<th scope="col" style="width: 20%">작성일</th>
												<th scope="col" style="width: 10%">좋아요 수</th>
												<th scope="col" style="width: 10%">조회 수</th>
												<th scope="col" style="width: 10%"></th>
											</tr>
										</thead>
										<tbody class="customtable">
											<c:forEach items="${bList}" var="bList" varStatus="status">
												<tr>
													<th><label class="customcheckbox"> <input
															type="checkbox" class="listCheckbox" /> <span
															class="checkmark"></span>
													</label></th>
													<td><a
														href="/board/${bList.CATEGORY}/detail?bdIdx=${bList.BD_IDX}">${bList.BD_TITLE}</a><small
														class="ml-2"><i class="fas fa-comment mr-1"></i>댓글수</small></td>
													<td><a href="">${bList.NICKNAME}</a></td>
													<td>${bList.CATEGORY}</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
															value="${bList.REG_DATE}" /></td>
													<td>${bList.REC_COUNT}</td>
													<td>${bList.VIEW_COUNT}</td>
													<td class="nav-item dropdown" href=""
														data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false"><i class="m-r-10 mdi mdi-menu ">
													</i>
														<div class="dropdown-menu"
															aria-labelledby="navbarDropdown">
															<a class="dropdown-item" href="#">Action</a> <a
																class="dropdown-item" href="#">Another action</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item" href="#">Something else here</a>
														</div></td>
												</tr>
											</c:forEach>

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
	<script type="text/javascript">
(() =>{
	
	Array.prototype.forEach.call(document.querySelector("#sortSelect").options, e =>{
		if(e.value == "${dataMap.sort}") e.selected = true;
	})
})();


    const URLSearch = new URLSearchParams(location.search);
    
    let sortList = () =>{
    	var sortSelect = document.getElementById("sortSelect");  
    	var selectValue = sortSelect.options[sortSelect.selectedIndex].value; 
 		 URLSearch.set('sort', String(selectValue));
 		 URLSearch.set('page', String("1"));
    	 const newParam = URLSearch.toString();
    	 location.href = location.pathname + '?' + newParam
 	 
		}
    
    let searchKeyword = () =>{
    	var option = document.querySelector("#search_option").value
    	var keyword = document.querySelector("#inp").value
    	var category = document.querySelector("#category").value
    	keyword = keyword.trim()
    	if(keyword == ''){
    		alert("검색어를 입력해주세요.")
    		return
    	}
    	 URLSearch.set("option", String(option));
  		 URLSearch.set("keyword", String(keyword));
  		 URLSearch.set("category", String(category));
  		 
     	 const newParam = URLSearch.toString();
     	 location.href = location.pathname + '?' + newParam
  	
        		
       		
    	
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