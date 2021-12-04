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
			<strong>${title}게시판</strong>

		</div>
		<div class="row">
			<div class="col-md-12">
				<a class="btn btn-danger btn-lg float-end">삭제</a> <a
					href="/board/${category}/modify?bdIdx=${board.bdIdx}"
					class="btn btn-warning btn-lg float-end" style="margin-right: 4px;">수정</a>
			</div>
		</div>
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>

						<dd style="font-size: 17pt">
							<strong>${board.bdTitle}</strong>
						</dd>
						<a class="btn btn-default btn-lg btn-hover-success active"
							style="float: right" onclick=""> <i
							class="fa fa-thumbs-up mr-1"></i>추천
						</a>
					</dl>
				</div>
				<div class="title"
					style="border-top: 2px solid #F0EAD5; height: 48px;">
					<dl>
						<dt>${board.nickname}</dt>
						<dd>
							<span>|</span><span style="margin-left: 10px"><i
								class="fas fa-comment" style="margin-right: 5px"></i>${commentCnt}</span><span
								style="margin-left: 10px"><i class="fas fa-eye"
								style="margin-right: 5px"></i>${board.viewCount } </span> <span
								style="float: right;"> <i class="fas fa-clock"
								style="margin-right: 5px"></i> <fmt:formatDate
									pattern="yyyy-MM-dd hh:mm:ss" value="${board.regDate}" />
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

			<br>
			<div class="row">
				<div class="col-md-12 justify-content-center" style="display: flex;">
					<button class="btn btn-success btn-lg"
						onclick="javascript:location.href='/board/${category}'">목록으로</button>
				</div>
			</div>

			<div class="bt_wrap">
				<input type="text" placeholder="댓글을 남겨주세요" name="cmContent"
					id="cmContent" style="width: 85%; height: 50px; font-size: 16px;">
				<a class="on" onclick="insertComment(this,${board.bdIdx})">등록</a>
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
										<c:forEach items="${pcomment}" var="comment">
											<div class="media-block">

												<div class="media-body">

													<div class="mar-btm">
														<span
															class="text-semibold text-success media-heading box-inline">${comment.nickname}</span>

													</div>
													<p>${comment.cmContent}</p>
													<div class="pad-ver">
														<span class="text-muted text-sm"><fmt:formatDate
																pattern="yyyy-MM-dd hh:mm:ss" value="${comment.regDate}" /></span>
														<button type="button" class="newBtn"
															onclick="addCommentBtn(${comment.cmIdx})">댓글달기</button>

														<button class="btn btn-default btn-hover-success active"
															style="float: right">
															<i class="fa fa-thumbs-up"></i>
														</button>



													</div>


												</div>
											</div>
											<hr>

											<div id="input${comment.cmIdx}" style="display: none">
												<div class="media-block" style="position: relative;">
													<span style="position: absolute; top: 32px">ㄴ</span>
													<div class="media-body" style="padding: 30px;">

														<div class="mar-btm">
															<span class="text-semibold">닉넴</span>

														</div>

														<div class="bt_wrap mt-1">
															<input type="text" placeholder="댓글을 남겨주세요"
																name="cmContent" id="cmContent"
																style="width: 85%; height: 50px; font-size: 16px;">
															<a class="on"
																onclick="insertReComment(this,${board.bdIdx},${comment.cmIdx})">등록</a>
														</div>



													</div>
												</div>
												<hr>
											</div>
											<c:forEach items="${chcomment}" var="chcomment">
												<c:if test="${chcomment.prIdx == comment.cmIdx}">
													<div class="media-block" style="position: relative;">
														<span style="position: absolute;">ㄴ</span>
														<div class="media-body" style="padding:0 30px;">

															<div class="mar-btm">
																<span
																	class="text-semibold text-success media-heading box-inline">${chcomment.nickname}</span>

															</div>
															<p>${chcomment.cmContent}</p>
															<div class="pad-ver">
																<span class="text-muted text-sm"><fmt:formatDate
																		pattern="yyyy-MM-dd hh:mm:ss"
																		value="${chcomment.regDate}" /></span>


																<button class="btn btn-default btn-hover-success active"
																	style="float: right">
																	<i class="fa fa-thumbs-up"></i>
																</button>



															</div>



														</div>
													</div>
													<hr>

												</c:if>
											</c:forEach>

										</c:forEach>


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
	<script type="text/javascript">
		 let insertComment = (obj, bdIdx) =>{
		 		
		    	return fetch('/board/comment-form',{
		 			method:"post",
		 			body: JSON.stringify({cmContent : obj.previousElementSibling.value, bdIdx : bdIdx}),
		 			 headers:{
		 			    'Content-Type': 'application/json'
		 			  }
		    	}).then(res => {
		    		alert('댓글 등록이 완료되었습니다.');
		    		location.reload();
		    	})
		    		
		 	
		 	}
		 
		 let addCommentBtn = (idx) =>{
			 var temp = document.querySelector('#input'+idx);
			 if(temp.style.display == "none"){
				 temp.style.display = ""
			 }else{
				 temp.style.display = "none"
			 }
		 }
		 
		 let insertReComment = (obj, bdIdx, cmIdx) =>{
		 		
		    	return fetch('/board/comment-form',{
		 			method:"post",
		 			body: JSON.stringify({cmContent : obj.previousElementSibling.value, bdIdx : bdIdx, cmIdx : cmIdx, cmType: 1}),
		 			 headers:{
		 			    'Content-Type': 'application/json'
		 			  }
		    	}).then(res => {
		    		alert('댓글 등록이 완료되었습니다.');
		    		location.reload();
		    	})
		    		
		 	
		 	}
		 
		 
		 
		</script>
</body>
</html>