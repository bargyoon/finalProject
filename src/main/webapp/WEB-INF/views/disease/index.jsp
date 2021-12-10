<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">





<!-- ===============================================-->
<!--    Favicons-->
<!-- ===============================================-->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/img/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/img/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/img/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/img/favicons/favicon.ico">
<link rel="manifest" href="/resources/img/favicons/manifest.json">
<meta name="msapplication-TileImage"
	content="/resources/img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">


<!-- ===============================================-->
<!--    Stylesheets-->
<!-- ===============================================-->
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
<link href="/resources/css/disease/theme.css" rel="stylesheet" />
<style type="text/css">
	.subtitle_div{
		display: flex;
		justify-content: center;
		margin-top: 200px;
		margin-bottom: 20px;
	}
	.subtitle_div > h2{
		width: 1120px;
		font-family: SBAggroL;
	}
	.img-div{
		display: flex;
		justify-content: center;
	}
	.img-div > img{
		width: 280px;
		heigth: 280px;
	}
	.p-div{
		display: flex;
		justify-content: center;
	}
	.p-div > p{
		width: 1120px;
	} 
</style>
</head>


<body style="min-height: 100vh;">

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top">
		<%@ include file="/WEB-INF/views/include/navBar.jsp"%>

		<div class="container-fluid mt-7">
			<div class="subtitle_div">
				<h2>반려동몰 수술비용에 관하여</h2>
			</div>
			<div class="img-div">
				<img src="/resources/img/disease/test/test-img (1).jpg">
				<img src="/resources/img/disease/test/test-img (2).jpg">
				<img src="/resources/img/disease/test/test-img (3).jpg">
				<img src="/resources/img/disease/test/test-img (4).jpg">
			</div>
			<div class="p-div">
				<p style="font-size: 21px; display: inline-block;">
동물병원에서 수술은 정형외과,신경외과,일반외과,흉부외과,안과,치과 등으로 다양한 수술 및 치료방법이 존재합니다.
 똑DOG한 집사들에서는 보호자들과 반려동물이 가장 많이 수술을 가지고 다양한 항목들을 가지고 있습니다. 
 다양한 수술의 따라서 가격이 천차만별이며, 동물병원마다도 가격이 천차만별입니다. 과거부터 지금까지 국회에서는 여러개의 법을 발의하였지만,
 부당한 공동행위 등의 정비에 관한 법률로 인하여 법이 제정되지 않고 있습니다. 이에 동물병원들은 각각 진료에대한 금액을 책정할 수 있게 되었습니다.
 이에 대한 피해는 반려동물 키우는 보호자들에게 고스란히 돌아오고 있습니다. 동물병원 방문의 불만사유 중 59,7%가 과잉진료와 진료비인 만큼 대부분의 보호자들이
 이 문제에대해서 고민을 하고 있습니다. 똑DOG집사들은 보호자에게 제공받은 영수증을 받아 검증 통하여 진료비의 평균값을 보여줍니다. 진료비 영수증은 수술을 포함한
 모든 진료와 처치 입원이 들어가며 이로인하여 보호자는 해당 병명에 대하여 적절한 가격을 알 수가 있습니다.

			</div>
		</div>



		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section style="padding-top: 0;">
			<div class="section pb-5 pt-5 pt-sm-2 text-center">
				<div class="mb-0 pb-3 title" style="min-height: 60px">
					<span class="btn_dog">강아지 </span><span class="btn_cat">고양이</span>
				</div>
				<input class="checkbox" type="checkbox" id="reg-log" name="reg-log">
				<label for="reg-log" style="padding-bottom: 10px"></label>
				<div class="card-3d-wrap mx-auto" style="margin-top: 20px">
					<div class="card-3d-wrapper">
						<div class="card-front">
							<div class="center-wrap">
								<div class="section text-center">
									<div class="container">
										<div class="row justify-content-center"
											style="min-height: 136px">
											<div class="col-auto mb-5 mb-md-7">
												<h1 class="fw-semi-bold text-1100">
													<span>강아지</span>
												</h1>
											</div>
										</div>
										<div class="row">
											<c:forEach items="${datas}" var="data" varStatus="status">
												<c:if test="${data.CATEGORY eq 'dog'}">
													<a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center"
														href="/disease/disease-spec?dsIdx=${data.DS_IDX}">
														<div class="px-0 px-lg-3">
															<img class="img-fluid mb-4" src="${data.downloadURL}"
																style="width:150px; height:150px" alt="..." />
															<h3 class="h5 mb-4 font-base">${data.NAME}</h3>
														</div>
													</a>
												</c:if>
											</c:forEach>
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-back" style="display: none">
							<div class="center-wrap">
								<div class="section text-center">
									<div class="container">
										<div class="row justify-content-center"
											style="min-height: 136px">
											<div class="col-auto mb-5 mb-md-7">
												<h1 class="fw-semi-bold text-1100">
													고양이</span>
												</h1>
											</div>
										</div>
										<div class="row">
											<c:forEach items="${datas}" var="data" varStatus="status">
												<c:if test="${data.CATEGORY eq 'cat'}">
													
													<a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center"
														href="/disease/disease-spec?dsIdx=${data.DS_IDX}">
														<div class="px-0 px-lg-3">
															<img class="img-fluid mb-4" src="${data.downloadURL}"
																style="width:150px; height:150px" alt="..." />
															<h3 class="h5 mb-4 font-base">${data.NAME}</h3>
														</div>
													</a>
												</c:if>
											</c:forEach>
											

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- end of .container-->

		</section>
	</main>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/mainJs.jsp"%>

	<!-- ===============================================-->
	<!--    JavaScripts-->
	<!-- ===============================================-->

	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="/resources/js/disease/theme.js"></script>



</body>

</html>
