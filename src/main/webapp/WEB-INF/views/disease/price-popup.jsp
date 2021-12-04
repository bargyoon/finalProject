<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/style.min.css" rel="stylesheet">
</head>
<body>
	<div class="col-md-12">
		<div class="card">
			<form action="/disease/add-price?dsIdx=${dsIdx}" id="frm-popup"
				method="post" enctype="multipart/form-data">
				<div class="card-header">
					<h5 class="card-title m-b-0 d-inline-block">진료비 영수증 등록</h5>
					<small>사진을 등록하시면 평균 금액에 반영됩니다.</small>


					<button class="btn btn-flat btn-primary float-right" id="add_img">사진등록</button>


				</div>
				<div id="prod_image_dropzone2" style="height: calc(100% - 50px);">
					<div class="card-body">
						<div class="drop-zone drop-img">
							<span class="drop-zone__prompt">이미지를 드래그 하거나 클릭해서 추가하세요</span> <input
								type="file" name="files" class="drop-zone__input img-1" multiple>
						</div>
						<div id="prod_image_list" class="ui-sortable"></div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div></div>
	<script src="/resources/js/admin/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="/resources/js/admin/popper.min.js"></script>
	<script src="/resources/js/admin/bootstrap.min.js"></script>
	<script src="/resources/js/admin/drag-drop.js"></script>
	<script type="text/javascript">
	document.querySelector("#add_img").addEventListener("click", e =>{
		if(document.querySelector(".img-1").files.length == 0) {
			alert("사진이 등록되지 않았습니다.")
			e.preventDefault();
		}
	})
 	
</script>

</body>
</html>