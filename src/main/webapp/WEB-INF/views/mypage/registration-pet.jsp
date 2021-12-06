<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/mypage/font.css" rel="stylesheet">
<link href="/resources/css/mypage/mypage.css" rel="stylesheet">
</head>
<body>

<section>
	<div class="container" style="display: flex;">
		<nav class="d-flex flex-column flex-shrink-0 p-3" style="width: 280px;">
			<span class="fs-4"><a href="/mypage/my-info" class="nav-link">회원정보</a></li></span>
			<span class="fs-4"><a href="/mypage/pet-info" class="nav-link">마이펫</a></li></span>
			<span class="fs-4"><a href="/mypage/vaccination" class="nav-link">예방접종</a></li></span>
			<span class="fs-4"><a href="/mypage/managing-board" class="nav-link">작성글</a></li></span>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><a href="/mypage/pet-info" class="nav-link">내 펫</a></li>
				<li><a href="/mypage/registration-pet" class="nav-link">펫 등록</a></li>
			</ul>
		</nav>
		
		<div style="margin: 0 auto; width: 800px">
			<form action="/mypage/registration-pet" method="post" style="margin: 0 auto; width: 400px;" enctype="multipart/form-data">
			
				<div class="mb-3">
					<label for="name" class="form-label">이름</label>
					<input name="petName" type="text" class="form-control" id="name" required="required">
				</div>
				
				<div class="mb-3">
					<label for="species" class="form-label">종류</label>
					<div style="display: flex;">
						<select class="form-select" name="species" id="species" required="required" style="text-align: center;">
							<option disabled="disabled" selected="selected">--선택--</option>
							<option value="강아지">강아지</option>
							<option value="고양이">고양이</option>
						</select>
					</div>
				</div>
				
				<div class="mb-3">
					<label for="age" class="form-label">나이</label>
					<input name="petAge" type="number" class="form-control" id="age" required="required">
				</div>
				
				<div class="mb-3">
					<label for="gender" class="form-label">성별</label>
					<div class="form-check form-check-inline ms-5">
					  <input class="form-check-input" type="radio" name="gender" value="남" id="flexRadioDefault1" checked required="required">
					  <label class="form-check-label" for="flexRadioDefault1">남</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="gender" value="여" id="flexRadioDefault2">
					  <label class="form-check-label" for="flexRadioDefault2">여</label>
					</div>
				</div>
				
				<div class="mb-3">
					<label for="contract_file" class="form-label">프로필 사진</label>
					<input class="form-control" type="file" name="file" id="contract_file" required="required" multiple/>
				</div>
				
				<hr class="my-3">
	
				<button class="w-100 btn btn-primary btn-lg" type="submit">펫 등록</button>
			</form>
		</div>
	</div>
</section>
	
<aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="window.scrollTo(0,0)" style="float: right;">
	<i class="fas fa-arrow-alt-circle-up"></i>
</aside>

<script src="/resources/js/mypage/paging.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>