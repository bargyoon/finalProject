<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>Sevi | Landing, Corporate &amp; Business Templatee</title>


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
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
<link href="/resources/css/disease/theme.css" rel="stylesheet" />

</head>


<body style="min-height: 100vh;">

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top">
		<nav
			class="navbar navbar-expand-lg navbar-light fixed-top py-3 backdrop"
			data-navbar-on-scroll="data-navbar-on-scroll">
			<div class="container">
				<a class="navbar-brand d-flex align-items-center fw-semi-bold fs-3"
					href="#"> <img class="me-3"
					src="/resources/img/gallery/logo.png" alt="" />
					<div class="text-primary font-base">똑DOG한 집사들</div>
				</a>
				<button class="navbar-toggler collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div
					class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0"
					id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base">
						<li class="nav-item"><a class="nav-link fw-medium active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#books">Books</a></li>
						<li class="nav-item"><a class="nav-link" href="#libraries">Libraries</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">More</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action </a></li>
							</ul></li>
					</ul>
					<form class="ps-lg-5">
						<button
							class="btn btn-lg btn-primary rounded-pill bg-gradient font-base order-0"
							type="submit">Login</button>
					</form>
				</div>
			</div>
		</nav>

		<div class="container-fluid mt-7">
			<div>
				<img src="/resources/img/disease/bg.jpg"
					style="max-height: 450px; width: 100%;">
			</div>
		</div>



		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section>
			<div class="section pb-5 pt-5 pt-sm-2 text-center">
				<div class="mb-0 pb-3 title" style="min-height: 60px">
					<span class="btn_dog">강아지 </span><span class="btn_cat">고양이</span>
				</div>
				<input class="checkbox" type="checkbox" id="reg-log" name="reg-log">
				<label for="reg-log" style="padding-bottom: 10px"></label>
				<div class="card-3d-wrap mx-auto" style="margin-top: 137px">
					<div class="card-3d-wrapper">
						<div class="card-front">
							<div class="center-wrap">
								<div class="section text-center">
									<div class="container">
										<div class="row justify-content-center"
											style="min-height: 136px">
											<div class="col-auto mb-5 mb-md-7">
												<h1 class="fw-semi-bold text-1100">
													강아지</span>
												</h1>
											</div>
										</div>
										<div class="row">
											<c:forEach items="${datas}" var="data" varStatus="status">
											<c:if test="${data.disease.category eq 'dog'}">
												<a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center" href="/disease/disease-spec?${data.disease.dsIdx}">
													<div class="px-0 px-lg-3">
														<img class="img-fluid mb-4"
															src="${data.files.downloadURL }" width="100"
															alt="..." />
														<h3 class="h5 mb-4 font-base">${data.disease.name}</h3>
													</div>
												</a>
												</c:if>
											</c:forEach>
											<a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/경계성종양.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">경계성종양</h3>
												</div>
											</a> <a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/골절.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">골절</h3>
												</div>
											</a> <a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/디스크.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">디스크</h3>
												</div>
											</a>

											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/슬개골탈구.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">슬개골탈구</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/요도방광결석.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">요도방광결석</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/유선종양.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">유선종양</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/자궁축농증.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">자궁축농증</h3>
												</div>
											</div>

											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/종양.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">종양</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/중성화.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">중성화</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/체리아이.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">체리아이</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/탈장.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">탈장</h3>
												</div>
											</div>

											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/항문낭제거.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">항문낭제거</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/CT.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">CT</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/MRI.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">MRI</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/XRAY.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">XRAY</h3>
												</div>
											</div>
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
											<c:if test="${data.disease.category eq 'cat'}">
												<a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center" href="/disease/disease-spec?${data.disease.dsIdx}">
													<div class="px-0 px-lg-3">
														<img class="img-fluid mb-4"
															src="${data.files.downloadURL }" width="100"
															alt="..." />
														<h3 class="h5 mb-4 font-base">${data.disease.name}</h3>
													</div>
												</a>
												</c:if>
											</c:forEach>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/경계성종양2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">경계성종양</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/발치.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">고양이전발치</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/골절2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">골절</h3>
												</div>
											</div>

										
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/스케일링.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">스케일링</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/심장질환.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">심장질환</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/안구적출술.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">안구적출술</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/외이도염.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">외이도염</h3>
												</div>
											</div>

										
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/요도방광결석2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">요도방광결석</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/유선종양2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">유선종양</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/자궁축농증2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">자궁축농증</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/중성화2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">중성화</h3>
												</div>
											</div>

										
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/항문낭제거2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">항문낭제거</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/CT2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">CT</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/MRI2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">MRI</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/고양이비용/X-RAY2.png" width="100"
														alt="..." />
													<h3 class="h5 mb-4 font-base">X-RAY2</h3>
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


			<!-- end of .container-->

		</section>



		<!-- ===============================================-->
		<!--    JavaScripts-->
		<!-- ===============================================-->

		<script
			src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
		<script src="/resources/js/disease/theme.js"></script>

		<link
			href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800&amp;display=swap"
			rel="stylesheet">
</body>

</html>
