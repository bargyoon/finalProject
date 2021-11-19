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
				<li class="nav-item"><a href="/mypage/my-info" class="nav-link">회원정보</a></li>
				<li class="nav-item"><a href="/mypage/pet-info" class="nav-link">마이펫</a></li>
				<li class="nav-item"><a href="/mypage/vaccination" class="nav-link">예방접종</a></li>
				<li class="nav-item"><a href="/mypage/managing-board" class="nav-link active">작성글</a></li>
			</ul>
		</header>
		<h4 class="mb-3">마이페이지</h4>
	</div>

	<div class="container" style="display: flex;">
		<nav class="d-flex flex-column flex-shrink-0 p-3" style="width: 280px;">
			<span class="fs-4">작성글</span>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><a href="/mypage/managing-board" class="nav-link">게시글</a></li>
				<li><a href="/mypage/managing-reply" class="nav-link active">댓글</a></li>
				<li><a href="/mypage/managing-counseling" class="nav-link">상담내역</a></li>
			</ul>
		</nav>
		
		<div style="margin: 0 auto; width: 800px">
			<form action="">
				<table class="table table-hover" style="text-align: center;">
				  <thead>
				    <tr>
				      <th style="width: 5%"><input type="checkbox"></th>
				      <th scope="col" style="width: 15%">글번호</th>
				      <th scope="col" style="width: 70%">댓글 내용</th>
				      <th scope="col" style="width: 10%">작성일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td><input type="checkbox"></td>
				      <td>1</td>
				      <td>제목입니다</td>
				      <td>sysdate</td>
				    </tr>
				  </tbody>
				</table>
				
				<button type="button" class="btn btn-primary">삭제</button>
			</form>
			
			<div style="display:flex; justify-content:center;">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
			<form action="">
				<div style="display:flex; justify-content:center;">
					<select id="select" style="text-align: center;">
						<option value="title" selected="selected">제목</option>
						<option value="content">내용</option>
						<option value="">제목+내용</option>
					</select>
					<input style="width: 300px;" type="search" class="form-control" placeholder="Search..." aria-label="Search">
					<button type="button" class="btn btn-primary">검색</button>
				</div>
			</form>
		</div>
	</div>
</section>

<aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="window.scrollTo(0,0)" style="float: right;">
    <i class="fas fa-arrow-alt-circle-up"></i>
</aside>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>