<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/shop-head.jsp"%>

</head>
<body onscroll="checkHeight()">
	<%@ include file="/WEB-INF/views/include/market/market-nav.jsp"%>

	<section class="pt-5 pb-3" style="margin-top: 8rem;">
		<div class="container text-center mt-5 prd-category">
			<p class="display-7 fw-bolder">이벤트 / 후기</p>
		</div>
	</section>

	<section class="px-lg-4 mt-5 container" style="min-height: 40rem;">
		<div class="event-title px-lg-5">
			<span class="event-tab-wrap"> <a href="#">진행 중인 이벤트</a>
			</span> <span class="event-tab-wrap"> <a href="#">당첨자 발표</a>
			</span>
		</div>
		<div class="my-5 prd-list-area">
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd"> <img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<span class="event-title">이벤트 제목입니다.</span>
					</div>
					<div class="event-content">이벤트 설명입니다.</div>
					<div class="event-date">
						<span class="badge rounded-pill bg-secondary">종료</span> 2021.10.29 - 2021.11.26
					</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd"> <img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<span class="event-title">이벤트 제목입니다.</span>
					</div>
					<div class="event-content">이벤트 설명입니다.</div>
					<div class="event-date">
						<span class="badge rounded-pill bg-secondary">종료</span> 2021.10.29 - 2021.11.26
					</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd"> <img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<span class="event-title">이벤트 제목입니다.</span>
					</div>
					<div class="event-content">이벤트 설명입니다.</div>
					<div class="event-date">
						<span class="badge rounded-pill bg-secondary">종료</span> 2021.10.29 - 2021.11.26
					</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd"> <img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<span class="event-title">이벤트 제목입니다.</span>
					</div>
					<div class="event-content">이벤트 설명입니다.</div>
					<div class="event-date">
						<span class="badge rounded-pill bg-secondary">종료</span> 2021.10.29 - 2021.11.26
					</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd"> <img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<span class="event-title">이벤트 제목입니다.</span>
					</div>
					<div class="event-content">이벤트 설명입니다.</div>
					<div class="event-date">
						<span class="badge rounded-pill bg-secondary">종료</span> 2021.10.29 - 2021.11.26
					</div>
				</a>
			</div>
			<div class="mb-4 prd-area mx-lg-4">
				<a class="btn" href="#prd"> <img class="prd-img" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
					<div class="pt-3" style="padding-bottom: 0rem;">
						<span class="event-title">이벤트 제목입니다.</span>
					</div>
					<div class="event-content">이벤트 설명입니다.</div>
					<div class="event-date">
						<span class="badge rounded-pill bg-secondary">종료</span> 2021.10.29 - 2021.11.26
					</div>
				</a>
			</div>
		</div>
	</section>

	<!-- pagination -->
     <div class="page_wrap">
	   <div class="page_nation">
	      <a class="arrow pprev"><i class="fas fa-angle-double-left"></i></a>
	      <a class="arrow prev" ><i class="fas fa-angle-left"></i></a>
	      <a href="#" class="active">1</a>
	      <a href="#">2</a>
	      <a href="#">3</a>
	      <a href="#">4</a>
	      <a href="#">5</a>
	      <a href="#">6</a>
	      <a href="#">7</a>
	      <a href="#">8</a>
	      <a href="#">9</a>
	      <a href="#">10</a>
	      <a class="arrow next"><i class="fas fa-angle-right"></i></a>
	      <a class="arrow nnext"><i class="fas fa-angle-double-right"></i></a>
	   </div>
	</div>

	<div class="input-group" id="search_wrap">
		<form class="event_search">
			<select class="form-select" aria-label="Default select example">
				<option selected value="1">제목</option>
				<option value="2">내용</option>
			</select>
			<input type="text" class="form-control event_search_input" placeholder="" aria-label="Recipient's username with two button addons">
			<button class="btn btn-outline-secondary event_search_button" type="button">Button</button>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>


</body>
</html>