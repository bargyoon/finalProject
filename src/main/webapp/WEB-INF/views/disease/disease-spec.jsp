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



<title>병원비 상세페이지</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>


<link rel="manifest" href="/resources/img/favicons/manifest.json">
<meta name="theme-color" content="#ffffff">


<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
<link href="/resources/css/disease/theme.css" rel="stylesheet" />

</head>

<body style="min-height: 100vh;">

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top"  style="min-height: 100vh;">
		<%@ include file="/WEB-INF/views/include/navBar.jsp"%>


		<section id="libraries" style="background-color: rgb(240, 234, 213);">

			<!--/.bg-holder-->

			<div class="container">
				<div class="row g-xl-0 align-items-center pt-5">
					<div class="col-md-5 col-lg-7 text-xl-center mt-3">
						<div>
							<h1 class="fw-semi-bold " style="font-family: 'SBAggroL';">평균
								진료비</h1>
						</div>
						<div class="py-3">
							<h3 style="font-family: 'SBAggroL';">${disease.price}원</h3>
						</div>

					</div>
					<div class="col-md-7 col-lg-4  offset-lg-1 offset-xxl-0">

						<div class="text-center">
							<div>여러분의 경험으로 병원비를 책정합니다</div>
							<br>
							<button class="btn btn-lg rounded-pill"
								onclick="popup(${disease.dsIdx})"
								style="background-color: black; color: white;">영수증 첨부</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		<br>

		<!--/.bg-holder-->
		<div class="container">
			<div
				class="col-md-12 col-lg-12 text-center text-md-start offset-lg-1 offset-xxl-0"
				style="border-width: 0 0 2px 0; border-style: solid;">

				<h1 class="fw-semi-bold ">${disease.name}</h1>
			</div>
		</div>
		<div class="container">
			<div class="row g-xl-0 align-items-center">
				<div
					class="col-md-7 col-lg-7 text-center text-md-start offset-lg-1 offset-xxl-0">

					<p class="pt-3 lh-lg">${disease.explain}</p>

				</div>


			</div>
		</div>




	</main>
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/mainJs.jsp"%>



	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="/resources/js/theme.js"></script>
	<script>
        let popup = (dsIdx) =>{
            var url = "http://localhost:9393/disease/price-popup?dsIdx="+dsIdx;
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
</body>

</html>