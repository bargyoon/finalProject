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
<style type="text/css">
#clickedTab {
	border-bottom: 2px solid blue;
	color: mediumblue;
	cursor: default;
}

.tab{
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
						<h4 class="page-title">사용자등록 사진 관리</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">사용자등록사진</li>
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
										<h6>
											<a class="tab_all tab" data-tab="all"
												onclick="selectTab('state','all')">전체<span> <c:out
														value="${datas.totalCnt }"></c:out></span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab_n tab" data-tab="N" onclick="selectTab('state','N')">등록대기중 <span><c:out
														value="${datas.noCnt }"></c:out></span></a>
										</h6>
									</div>
								</div>
								<div class="ml-3">
									<div class=" text-center m-10">
										<h6>
											<a class="tab_y tab" data-tab="Y" onclick="selectTab('state','Y')">등록완료 <span><c:out
														value="${datas.yesCnt }"></c:out></span></a>
										</h6>
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
								<h5 class="card-title m-b-0 d-inline-block">사진목록</h5>

							</div>

							<div class="table-responsive">
								<form>
									<table class="table mb-0">
										<thead class="thead-dark">
											<tr>
												<th><input type="checkbox" id="chk_all"  /></th>
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
											<c:forEach items="${datas.piList}" var="data"
												varStatus="status">
												<tr>
													<td><label class="mt-3"> <input
															type="checkbox" class="listCheckbox" value="${data.PI_IDX}" /> <span
															class="checkmark"></span>
													</label></td>
													<td>${status.index+1}</td>
													<td><img id="img-r" src="${data.downloadURL}"
														onclick="fnImgPop('${data.downloadURL}')"
														style="width: 60px; height: 60px"></td>
													<td>
													<c:choose>
															<c:when test="${data.STATE eq 'N'}">
																<input type="text" 
														value="${data.PRICE}" class="input_price" > <span
														class="btn btn-secondary btn-sm ml-4" id="btn_update" onclick="insertPrice(this,${data.PI_IDX},${data.DS_IDX})">수정</span>
															</c:when>
															<c:when test="${data.STATE eq 'Y'}"><input type="text" style="border: none;" 
														value="${data.PRICE}" readonly class="input_price"></c:when>
														</c:choose>
													</td>

													<td>${data.NAME}(${data.CATEGORY})</td>
													<td><c:choose>
															<c:when test="${data.STATE eq 'N'}">등록대기중</c:when>
															<c:when test="${data.STATE eq 'Y'}">등록완료</c:when>
														</c:choose></td>
													<td>${data.USER_IDX}</td>
													<td>${data.REG_DATE}</td>

												</tr>
											</c:forEach>
											
										</tbody>
									</table>
									<div class="border-top">
										<div class="card-body">
											<button class="btn-secondary " onclick="deleteCheckList()">submit</button>
											<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
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
	
   

     let fnImgPop = (url) =>{
                var img=new Image();
                img.src=url;
                
                var OpenWindow=window.open('','_blank', 'width='+630+', height='+930+', menubars=no, scrollbars=auto');
                OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+600+"'  height='"+900+"' onclick='self.close()'>");
        }
            
   
    
     let selectTab = (state,res) =>{
    	 if(location.search.includes(state)){
    		
    		 URLSearch.set(state, String(res));
       	 	 const newParam = URLSearch.toString();
       	 	 location.href = location.pathname + '?' + newParam
    	 }else{
    		location.href = location.pathname+'?'+state+'='+res
    	}
    	  
     }
     
     let insertPrice = (obj, piIdx, dsIdx) =>{
 		
    	return fetch('/admin/disease/insertPrice',{
 			method:"post",
 			body: JSON.stringify({price : Number(obj.previousElementSibling.value), piIdx : piIdx, dsIdx: dsIdx}),
 			 headers:{
 			    'Content-Type': 'application/json'
 			  }
    	}).then(res => {
    		alert('됐다!');
    		location.reload();
    	})
    		
 	
 	}
    
   
    
     (() =>{
	     let loadState = URLSearch.get('state')
	     	document.querySelectorAll('.tab').forEach(e =>{
	     		if(loadState == null) {
	     			document.querySelector(".tab_all").id = "clickedTab"
	     		}else if(loadState == e.dataset.tab) e.id = "clickedTab"
	     	})
	     	
	   
     })();
     
 	
     let deleteCheckList = () =>{
     	let checkArr = []
     	document.querySelectorAll(".listCheckbox").forEach(e =>{
     		if(e.checked) checkArr.push(e.value);
     		
     	})
      		if(checkArr.length == 0){
      			alert("선택된 상품이 없습니다.")
      			return;
      		}
         	return fetch('/admin/shopping/delete-priceImg',{
      			method:"post",
      			body: JSON.stringify(checkArr),
      			 headers:{
      			    'Content-Type': 'application/json'
      			  }
         	}).then(res => {
         		alert('삭제가 완료되었습니다.');
         		location.replace(location.href);
         	})
         		
      	
      	}
	
	 
	</script>


</body>

</html>