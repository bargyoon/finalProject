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
				<h2>수술비용 페이지 부제목입니다.</h2>
			</div>
			<div class="img-div">
				<img src="/resources/img/disease/test/test-img (1).jpg">
				<img src="/resources/img/disease/test/test-img (2).jpg">
				<img src="/resources/img/disease/test/test-img (3).jpg">
				<img src="/resources/img/disease/test/test-img (4).jpg">
			</div>
			<div class="p-div">
				<p style="font-size: 21px; display: inline-block;">
동물병원에서 수술은 정형외과,신경외과,일반외과,흉부외과,안과,치과 등으로 나누어져 있으며 똑DOG한 집사들에서는 가장 많이 수술하는 항목들을 가지고 목록을 만들었습니다. 
동물병원마다 가격이 천차만별인 이유
보호자들이 병원 선택에 있어 어려움을 겪는 부분 중 하나는 병원마다의 가격편차입니다. 
예전에는 동물진료비도 정해진 가격이 있었지만, 부당한 공동행위 등의 정비에 관한 법률(카르텔일괄정리법)개정에 의해 법률이 폐지되었습니다. 
그로인해 현재 서비스 질을 높이고 소비자의 선택을 넓히기 위해서 수의사법이 시행중입니다. 
또한 반려동물 평균수명은 배로 연장되었고 질병이 다양화 되면서 사용하는 약물의 종류도 많아졌기 때문에 동물병원 입장에서는 진료비를 맞추려 해도 어려운 상황입니다.
				</p>
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
											<a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/경계성종양.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">경계성종양</h3>
												</div>
											</a> <a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/골절.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">골절</h3>
												</div>
											</a> <a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/디스크.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">디스크</h3>
												</div>
											</a>

											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/슬개골탈구.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">슬개골탈구</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/요도방광결석.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">요도방광결석</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/유선종양.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">유선종양</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/자궁축농증.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">자궁축농증</h3>
												</div>
											</div>

											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/종양.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">종양</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/중성화.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">중성화</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/체리아이.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">체리아이</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/탈장.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">탈장</h3>
												</div>
											</div>

											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/항문낭제거.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">항문낭제거</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/CT.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">CT</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/MRI.png" style="width:150px; height:150px"
														alt="..." />
													<h3 class="h5 mb-4 font-base">MRI</h3>
												</div>
											</div>
											<div class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center">
												<div class="px-0 px-lg-3">
													<img class="img-fluid mb-4"
														src="/resources/img/disease/강아지비용/XRAY.png" style="width:150px; height:150px"
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
													<a class="col-sm-3 col-lg-3 mb-4 mb-lg-0 text-center"
														href="/disease/disease-spec?${data.disease.dsIdx}">
														<div class="px-0 px-lg-3">
															<img class="img-fluid mb-4"
																src="${data.files.downloadURL }" width="100" alt="..." />
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
