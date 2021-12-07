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
						<h4 class="page-title">구매평관리</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">구매평관리</li>
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
														<div class='d-table-cell' style="width: 15%;">별점</div>
														<div class='d-table-cell '>
															<input type="radio" name="rating" id="search_rating"
																value="all" checked><label class="ml-2 mr-2">전체</label>
															<input type="radio" name="rating" id="search_rating"
																value="1"><label class="ml-2 mr-2">1점</label> <input
																type="radio" name="rating" id="search_rating" value="2"><label
																class="ml-2 mr-2">2점</label> <input type="radio"
																name="rating" id="search_rating" value="3"><label
																class="ml-2 mr-2">3점</label> <input type="radio"
																name="rating" id="search_rating" value="4"><label
																class="ml-2 mr-2">4점</label> <input type="radio"
																name="rating" id="search_rating" value="5"><label
																class="ml-2">5점</label>
														</div>
													</div>
												</div>
												<div
													style="display: table; width: 100%; margin-bottom: 5px;">
													<div style="display: table-row-group;">
														<div class='d-table-cell' style="width: 15%;">구매평 유형</div>
														<div class='d-table-cell '>
															<input type="radio" name="type" id="search_type"
																value="all" checked><label class="ml-2 mr-2">전체</label>
															<input type="radio" name="type" id="search_type"
																value="0"><label class="ml-2 mr-2">일반구매평</label>
															<input type="radio" name="type" id="search_type"
																value="1"><label class="ml-2 mr-2">포토구매평</label>
														</div>
													</div>
												</div>
												<div
													style="display: table; width: 100%; margin-bottom: 5px;">
													<div style="display: table-row-group;">
														<div class='d-table-cell' style="width: 15%;">승인 종류</div>
														<div class='d-table-cell '>
															<input type="radio" name="state" id="search_state"
																value="all" checked><label class="ml-2 mr-2">전체</label>
															<input type="radio" name="state" id="search_state"
																value="0"><label class="ml-2 mr-2">승인대기중</label>
															<input type="radio" name="state" id="search_state"
																value="1"><label class="ml-2 mr-2">승인</label> <input
																type="radio" name="type" id="search_type" value="2"><label
																class="ml-2 mr-2">승인거절</label>
														</div>
													</div>
												</div>
												<div
													style="display: table; width: 100%; margin-bottom: 5px;">
													<div style="display: table-row-group;">
														<div class='d-table-cell' style="width: 15%;">키워드 검색</div>
														<div class='d-table-cell '>
															<input type="search" class="form-control"
																style="width: 50%" placeholder="작성자 내용 검색"
																name="keyword" aria-label="Search" required id="inp"
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
										class="all-check" id="chk_all" style="vertical-align: middle;"> <span
										class="ml-2">구매평 <span class="text-primary"
											id="review_total_count">${totalCnt}</span></span>
									</label>
								</div>
							</header>


						</div>
						<div class="card" id="review_list">
							<div class="card-body no-padding ">
								<div style="">
									<div class="card"
										style="display: table; border-collapse: collapse; width: 100%;">
										<c:forEach items="${commentList}" var="commentList">
											<div class="border-bottom"
												style="display: table-row-group; padding: 20px 30px 20px 0;">
												<div class="d-table-cell pt-3"
													style="width: 2%; vertical-align: top;">
													<label><input type="checkbox" class="listCheckbox" value="${commentList.RV_IDX}"></label>
												</div>
												<div class="d-table-cell pt-3"
													style="vertical-align: top; width: 25%;">
													<div>
														<a href="#">${commentList.NAME }</a>
													</div>
													<div class="d-inline-block">
														<div
															class="d-flex small text-warning justify-content-center">
															<c:forEach var="i" begin="0" step="1"
																end="${commentList.RATING-1}">
																<i class="fas fa-star"></i>
															</c:forEach>


														</div>
													</div>
													<span class="d-inline-block">${commentList.USER_NAME}</span>
													<div class="d-inline-block"></div>
													<span class="d-inline-block ml-2" style="color: gray;"><fmt:formatDate
															pattern="yyyy-MM-dd hh:mm:ss"
															value="${commentList.REG_DATE}" /></span>
													<div class="pt-2" style="cursor: pointer;" onclick="">${commentList.RV_CONTENT}</div>
													<div class="pt-2 pb-3" style="cursor: pointer;" onclick="">추천수
														${commentList.RECOMMAND}</div>
												</div>
												<div class="d-table-cell board_thumb_wrap"
													style="padding: 10px; cursor: pointer; width: 65%"
													onclick="">
													<c:if test="${commentList.TYPE== 1 }">
														<div>
															<c:forEach items="${orderList.files}" var="files">
																<img src="${files.downloadURL }" class="board_thumb">

															</c:forEach>
														</div>
													</c:if>
												</div>

												<div class="d-table-cell text-right"
													style="vertical-align: middle; width: 10%">
													<span> <c:if test="${commentList.STATE == '1'}">
															승인됨
														</c:if> <c:if test="${commentList.STATE == '2'}">
															승인거부
														</c:if>
													</span>
													<c:if test="${commentList.STATE == '0'}">
														<select name="state" id="state"
															onchange="changeState(${commentList.RV_IDX}, this.value, ${commentList.TYPE}, ${commentList.USER_IDX},${commentList.ORDER_NUM})">
															<option value="0" selected>승인대기중</option>
															<option value="1">승인</option>
															<option value="2">승인거부</option>
														</select>
													</c:if>
												</div>
											</div>
										</c:forEach>

										

									</div>


									<div class="border-top">
										<div class="card-body">
											<button class="btn btn-secondary " onclick="deleteCheckList('shopping/delete-comment')">삭제</button>
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
	<!--This page JavaScript -->
	<script src="/resources/js/admin/common/paging.js"></script>
	<script src="/resources/js/admin/common/select-tab.js"></script>
	<script type="text/javascript">
	(() =>{
		
	
		document.querySelectorAll("#search_rating").forEach(e =>{
			if(e.value == "${dataMap.rating}") e.checked = true;
			
		})
		document.querySelectorAll("#search_state").forEach(e =>{
			if(e.value == "${dataMap.state}") e.checked = true;
			
		})
		document.querySelectorAll("#search_type").forEach(e =>{
			if(e.value == "${dataMap.type}") e.checked = true;
			
		})
		
		
	})();
	 let searchKeyword = () =>{
	    	var rating = document.querySelector("#search_rating").value
	    	var keyword = document.querySelector("#inp").value
	    	var state = document.querySelector("#search_state").value
	    	var type = document.querySelector("#search_type").value
	    	keyword = keyword.trim()
	    	
	    	 URLSearch.set("rating", String(rating));
	    	 URLSearch.set("state", String(state));
	  		 URLSearch.set("keyword", String(keyword));
	  		 URLSearch.set("type", String(type));
	  		if(keyword == ''){
	    		alert("검색어를 입력해주세요.")
	    		return
	    	}
	     	 const newParam = URLSearch.toString();
	     	 location.href = location.pathname + '?' + newParam
	  	
	        		
	       		
	    	
	    }
	    
let changeState = (rvIdx, state, type, userIdx, orderNum) =>{
 		
    	return fetch('/admin/shopping/update-review-state',{
 			method:"post",
 			body: JSON.stringify({rvIdx : rvIdx, state : state, type : type, userIdx: userIdx, orderNum: orderNum}),
 			 headers:{
 			    'Content-Type': 'application/json'
 			  }
    	}).then(res => {
    		alert('상태가 변경되었습니다.');
    		location.reload();
    	})
    		
 	
 	}
	</script>

</body>

</html>