<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/board/board-detail.css">
</head>
<body>
	<div class="board_wrap">

		<br> <br>
		<div class="board_title">
			<strong>정보게시판</strong>

		</div>
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>

						<dd style="font-size: 17pt" class="text-bold">
							${board.bdTitle}</dd>
					</dl>
				</div>
				<div class="title" style="border-top: 2px solid #F0EAD5">
					<dl>
						<dt>작성자</dt>
						<dd>
							<span>|</span><span style="margin-left: 10px"><i
								class="fas fa-comment" style="margin-right: 5px"></i>댓글수</span><span
								style="margin-left: 10px"><i class="fas fa-eye"
								style="margin-right: 5px"></i>${board.viewCount } </span> <span
								style="float: right;"> <i class="fas fa-clock"
								style="margin-right: 5px"></i>${board.regDate}
							</span>
						</dd>

					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>파일</dt>
						<dd>
							<div style="display: flex">
								<c:forEach items="${files}" var="file">
									<img src="${file.downloadURL }"
										style="max-width: 360px; max-height: 273px">
								</c:forEach>

							</div>
					</dl>
				</div>
				<div class="cont">
					<textarea disabled>${board.content}
                         </textarea>
				</div>
			</div>
			<div class="bt_wrap">
				<input type="text" placeholder="댓글을 남겨주세요"
					style="width: 850px; height: 50px; font-size: 16px;"> <a
					href="view.html" class="on">등록</a>
			</div>

			<div class="container bootdey" style="font-size: 1.4rem">
				<div class="col-md-12 bootstrap snippets">

					<div class="panel">
						<div class="panel-body">
							<!-- Newsfeed Content -->
							<!--===================================================-->
							<div class="media-block">

								<div class="media-body">

									<hr>

									<!-- Comments -->
									<div>
										<div class="media-block">

											<div class="media-body">
												<div class="mar-btm">
													<a href="#"
														class="btn-link text-semibold media-heading box-inline">Bobby
														Marz</a>

												</div>
												<p>Sed diam nonummy nibh euismod tincidunt ut laoreet
													dolore magna aliquam erat volutpat. Ut wisi enim ad minim
													veniam, quis nostrud exerci tation ullamcorper suscipit
													lobortis nisl ut aliquip ex ea commodo consequat.</p>
												<div class="pad-ver">
													<span class="text-muted text-sm">7 min ago</span>

													<button class="btn btn-default btn-hover-success active"
														style="float: right">
														<i class="fa fa-thumbs-up"></i>
													</button>



												</div>

											</div>
										</div>
										<hr>

									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>