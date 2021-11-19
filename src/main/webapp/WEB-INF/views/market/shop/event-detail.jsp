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
		<!-- 진행 중인 이벤트 / 당첨자 발표 -->
		<div class="event-title px-lg-5">
			<span class="event-tab-wrap"><a href="#">진행 중인 이벤트</a></span>
			<span class="event-tab-wrap"> <a href="#">당첨자 발표</a></span>
		</div>

		<!-- 이벤트 제목 -->
		<div class="my-5 prd-list-area" id="board-view">
			<div class="view_head">
				<p class="event_detail_title">이벤트 제목입니다.</p>
				<span class="event_period">2021.10.09~2022.01.21</span>
			</div>
			<div class="board_box">
				<div class="board_content">
					<a href=""><img src="/resources/img/shop/event_detail.jpg" class="card-img-top" alt="..."></a>
				</div>
				<div class="board_content">
					<img src="/resources/img/shop/event_detail01.jpg" class="card-img-top" alt="...">
				</div>
				<div class="board_content">
					<img src="/resources/img/shop/event_detail02.jpg" class="card-img-top" alt="...">
				</div>
			</div>
		</div>
	</section>

	<!-- pagination -->
	<div class="page_btn_wrap">
		<a href="#" class="prev_btn" tabindex="-1" role="button" aria-disabled="true"><i class="fas fa-angle-left"></i></a>
		<a href="#" class="list_btn" tabindex="-1" role="button" aria-disabled="true">목록</a> <a href="#" class="next_btn" tabindex="-1" role="button" aria-disabled="true">
		<i class="fas fa-angle-right"></i></a>
	</div>

	<%@ include file="/WEB-INF/views/include/market/footer.jsp"%>



</body>
</html>