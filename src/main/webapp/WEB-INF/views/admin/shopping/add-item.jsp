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
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">상품 등록</h4>
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
							<form id="prod_add" method="post" enctype="multipart/form-data" class="form form-validate"
								role="form" autocomplete="off" action="/admin/shopping/add-product">
								<input type="hidden" name="idx" value="0">
								<!-- default_type - js 처리용 -->
								
								<div class="row">
									<div class="col-md-6">
										<div class="row ">
											<div class="col-md-12">
												<div class="card">
													<div class="card-header">
														<h6 class="card-title m-b-0 d-inline-block">상품이미지</h6>


														<span class="btn btn-flat btn-primary float-right"
															id="reset-img">reset</span>
													</div>
													<div id="prod_image_dropzone2"
														style="height: calc(100% - 50px);">
														<div class="card-body">
															<div class="drop-zone drop-img">
																<span class="drop-zone__prompt">이미지를 드래그 하거나 클릭해서
																	추가하세요</span> <input type="file" name="main_img"
																	class="drop-zone__input img-1" multiple>
															</div>
															<div id="prod_image_list" class="ui-sortable"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-12">
												<div class="card">
													<div class="card-header">
														<h6 class="card-title m-b-0 d-inline-block">제품상세이미지</h6>
														<span class="btn btn-flat btn-primary float-right"
															id="reset-spec-img">reset</span>
													</div>
													<div id="prod_image_dropzone2">
														<div class="card-body">
															<div class="drop-zone drop-spec-img">
																<span class="drop-zone__prompt">이미지를 드래그 하거나 클릭해서
																	추가하세요</span> <input type="file" name="spec_img"
																	class="drop-zone__input img-2" multiple>
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
												<div class="card" style="min-height: 580px;">
													<div class="card-header">
														<h6 class="card-title m-b-0">상품 정보</h6>
													</div>
													<div class="card-body">

														<div class="form-group">
															<div class="row">
																<div class="col-md-6 m-margin-bottom-xl">
																	<label class="control-label">상품명</label> <input
																		type="text" class="form-control" name="name"
																		value="">
																</div>
																<div class="col-md-6 m-margin-bottom-xl">
																	<label for="shop_prod_price" class="control-label">브랜드</label>
																	<div class="no-margin">
																		<input type="text" class="form-control _prod_price"
																			id="shop_prod_price" name="brand" value="">
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group">
															<div class="row">
																<div class="col-md-6 m-margin-bottom-xl">
																	<label class="control-label">카테고리</label> <select name="category"
																		class="form-control">
																		<option value="" selected disabled>카테고리 선택</option>
																		<option value="snack">간식</option>
																		<option value="feed">사료</option>
																		<option value="health">건강관리</option>
																		<option value="potty">위생/배변</option>
																		<option value="beauty">미용/목욕</option>
																		<option value="feeder">급수기/급식기</option>
																		<option value="kennel">하우스/울타리</option>
																		<option value="vari-kennel">이동장</option>
																		<option value="clothes">의류/악세사리</option>
																		<option value="toy">장난감</option>
																	</select>
																</div>
																<div class="col-md-6 m-margin-bottom-xl">
																	<label class="control-label">애완동물 종류</label> <select name="type"
																		class="form-control">
																		<option value="" selected disabled>종류 선택</option>
																		<option value="C">고양이</option>
																		<option value="D">강아지</option>
																	</select>
																</div>

															</div>
														</div>
														<div class="form-group" id="prd_spec">
															<div class="row">
																<div class="col-md-3 m-margin-bottom-xl">
																	<label class="control-label">옵션</label> <input
																		type="text" class="form-control" placeholder="없을 시 빈칸" name="option"
																		value="">
																</div>
																<div class="col-md-3 m-margin-bottom-xl">
																	<label class="control-label">재고</label> <input
																		type="text" class="form-control" name="stock"
																		value="">
																</div>
																<div class="col-md-6 m-margin-bottom-xl">
																	<label for="shop_prod_price" class="control-label">판매가
																		(KRW)</label> <span class="btn btn-danger btn-sm float-right"
																		id="add_btn">+</span> <span
																		class="btn btn-danger btn-sm float-right mr-2"
																		id="minus_btn">-</span>
																	<div class="no-margin">
																		<input type="text" class="form-control"
																			id="shop_prod_price" name="price" value="">
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group">
															<div class="row">
																<div class="col-md-12">
																	<label class="control-label"> 적용 가능 할인 </label>
																	<div class="row">
																		<div class="col-md-4">
																			<label
																				class="checkbox checkbox-inline checkbox-styled">
																				<input type="checkbox" name="couponAvail" value="y"> <span>쿠폰</span>
																			</label> <label
																				class="checkbox checkbox-inline checkbox-styled">
																				<input type="checkbox" name="smAvail" value="y" > <span>적립금</span>
																			</label> <label
																				class="checkbox checkbox-inline checkbox-styled">
																				<input type="checkbox" name=""
																				id="sale_btn"> <span>할인률</span>
																			</label>
																		</div>
																		<div class="col-md-8 sale_div" style="display: none">
																			<div class="d-inline-flex">

																				<input type="text" class="form-control" name="salePer" value=0> <span
																					class="ml-3">할인 적용(%) </span>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div>
									<button class="btn btn-primary">저장</button>
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
	<script src="/resources/js/admin/multi-drop.js"></script>
	<!--This page JavaScript -->

	<script src="/resources/js/admin/datatables.min.js"></script>
	<script type="text/javascript">
	
    let cnt = 0;
    document.querySelector("#add_btn").addEventListener("click",e =>{
        let bigCol = document.createElement("div")
        bigCol.classList.add("row")
        bigCol.classList.add("mt-2")
        bigCol.classList.add("add-spec-price")
        let firstCol = document.createElement("div")
        firstCol.classList.add("col-md-3")
        firstCol.classList.add("m-margin-bottom-xl")
        let firstTextInput = document.createElement("input")
        firstTextInput.type = "text"
        firstTextInput.classList.add("form-control")
        firstTextInput.name = "option"
        firstCol.append(firstTextInput)
        bigCol.append(firstCol)
        let secondCol = document.createElement("div")
        secondCol.classList.add("col-md-3")
        secondCol.classList.add("m-margin-bottom-xl")
        let secondTextInput = document.createElement("input")
        secondTextInput.type = "text"
        secondTextInput.name = "stock"
        secondTextInput.classList.add("form-control")
        secondCol.append(secondTextInput)
        bigCol.append(secondCol)
        let mdCol = document.createElement("div")
        mdCol.classList.add("col-md-6")
        mdCol.classList.add("m-margin-bottom-xl")
        let mdTextInput = document.createElement("input")
        mdTextInput.type = "text"
        mdTextInput.name = "price"
        mdTextInput.classList.add("form-control")
        mdCol.append(mdTextInput)
        bigCol.append(mdCol)
        document.querySelector("#prd_spec").append(bigCol)
        cnt++;
    })

    document.querySelector("#minus_btn").addEventListener("click", e=>{
           if(cnt == 0){
               alert('더이상 삭제할 수 없습니다.')
               return
           }
        document.querySelectorAll(".add-spec-price").forEach((v,i,o) =>{
           
           if(i == cnt-1){
            v.remove();
            cnt--
           }
            
         })
    })
     document.querySelector("#sale_btn").addEventListener("click", e =>{
            console.dir(e)
            console.dir(document.querySelector(".sale_div"))
            if(e.target.checked){
            document.querySelector(".sale_div").style.display = "";
            }else{
                document.querySelector(".sale_div").style.display = "none";
            }
        })

   

	</script>

</body>

</html>