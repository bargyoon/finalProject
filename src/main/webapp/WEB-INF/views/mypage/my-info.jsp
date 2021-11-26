<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/mypage/font.css" rel="stylesheet">
</head>
<body>

<section>
	<div class="container">
		<header class="d-flex justify-content-center py-3"style="min-width: 500px;">
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="/mypage/my-info" class="nav-link active">회원정보</a></li>
				<li class="nav-item"><a href="/mypage/pet-info" class="nav-link">마이펫</a></li>
				<li class="nav-item"><a href="/mypage/vaccination" class="nav-link">예방접종</a></li>
				<li class="nav-item"><a href="/mypage/managing-board" class="nav-link">작성글</a></li>
			</ul>
		</header>
		<h4 class="mb-3">마이페이지</h4>
	</div>
	
	<div class="container" style="display: flex;">
		<nav class="d-flex flex-column flex-shrink-0 p-3" style="width: 280px;">
			<span class="fs-4">회원정보</span>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><a href="/mypage/my-info" class="nav-link active">내 정보</a></li>
				<li><a href="/mypage/update-member-info" class="nav-link">회원정보 수정</a></li>
			</ul>
		</nav>
		
		<div style="margin: 0 auto; width: 400px">
			<div class="form-floating mb-3">
			  <text class="form-control" id="floatingName" value="${member.userName}">홍길동</text>
			  <label for="floatingName">이름</label>
			</div>
			
			<div class="form-floating mb-3">
			  <text class="form-control" id="floatingNickname" value="${member.nickName}">gildong123</text>
			  <label for="floatingNickname">닉네임</label>
			</div>
			
			<div class="form-floating mb-3">
			  <text class="form-control" id="floatingEmail" value="${member.email}">gildong@test.com</text>
			  <label for="floatingEmail">이메일</label>
			</div>
			
			<div class="form-floating">
			  <text class="form-control" id="floatingAddress" value="${member.address}">집주소1</text>
			  <label for="floatingAddress">주소</label>
			</div>
			
			<div class="form-floating mb-3">
				<text class="form-control" id="floatingAddress2" value="${member.address}">집주소2</text>
				<label for="floatingAddress2">상세주소</label>
			</div>
			
			<div class="mb-3">
				<label class="label-form" for="profileImg">프로필사진</label>
				<img alt="" src="" id="profileImg">
			</div>
			
		</div>
		
	</div>
</section>
	
<aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="window.scrollTo(0,0)" style="float: right;">
	<i class="fas fa-arrow-alt-circle-up"></i>
</aside>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>