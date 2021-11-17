<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="file:///C:/CODE/F_SPRING/spring06_toyProject/src/main/webapp/resources/css/reset.css">
<link rel="stylesheet" href="file:///C:/CODE/F_SPRING/spring06_toyProject/src/main/webapp/resources/css/all.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-center py-3"style="min-width: 500px;">
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="/mypage/my-info" class="nav-link">회원정보</a></li>
				<li class="nav-item"><a href="/mypage/pet-info" class="nav-link">마이펫</a></li>
				<li class="nav-item"><a href="/mypage/vaccination" class="nav-link">예방접종</a></li>
				<li class="nav-item"><a href="/mypage/managing-board" class="nav-link">작성글</a></li>
			</ul>
		</header>
		<h4 class="mb-3">마이페이지</h4>
	</div>
	
	<div class="container" style="display: flex;">
		<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
		    <span class="fs-4">마이펫</span>
		    <hr>
		    <ul class="nav nav-pills flex-column mb-auto">
		      <li class="nav-item">
		        <a href="/mypage/pet-info" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
		          애완동물 목록
		        </a>
		      </li>
		      <li>
		        <a href="/mypage/registration-pet" class="nav-link active">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
		          애완동물 등록
		        </a>
		      </li>
		    </ul>
		</div>
		
		<form class="needs-validation" novalidate="" style="margin: 0 auto; width: 400px;">
			<div class="mb-3">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" id="name" required="required">
			</div>
			
			<div class="mb-3">
				<label for="species" class="form-label">종류</label>
				<div style="display: flex;">
					<select name="species" id="species" style="width: 200px; text-align: center;">
						<option value="" disabled="disabled" selected="selected">--선택--</option>
						<option value="dog">개</option>
						<option value="cat">고양이</option>
						<option value="ect">기타</option>
					</select>
					<input type="text" class="form-control" name="species_detail">
				</div>
			</div>
			
			<div class="mb-3">
				<label for="age" class="form-label">나이</label>
				<input type="number" class="form-control" id="age" required="required">
			</div>
			
			<div class="mb-3">
				<label for="gender" class="form-label">성별</label>
				<div class="form-check form-check-inline ms-5">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
				  <label class="form-check-label" for="flexRadioDefault1">
				  	남
				  </label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
				  <label class="form-check-label" for="flexRadioDefault2">
				  	여
				  </label>
				</div>
			</div>
			
			<div class="mb-3">
				<label for="detail" class="form-label">상세정보</label>
				<textarea class="form-control" id="detail"></textarea>
			</div>
			
			<div class="mb-3">
				<label for="contract_file" class="form-label">프로필 사진</label>
				<input class="form-control" type="file" name="file" id="contract_file"/>
			</div>
			
			<hr class="my-3">

			<button class="w-100 btn btn-primary btn-lg" type="submit">애완동물 등록</button>
		</form>
	</div>
	
	<aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="window.scrollTo(0,0)" style="float: right;">
        <i class="fas fa-arrow-alt-circle-up"></i>
    </aside>
	
	<script type="text/javascript" src="file:///C:/CODE/F_SPRING/spring06_toyProject/src/main/webapp/resources/js/webUtil.js"></script>
	<script type="text/javascript" src="file:///C:/CODE/F_SPRING/spring06_toyProject/src/main/webapp/resources/js/urlEncoder.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>