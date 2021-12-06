<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/petcare/action.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
<section style="background-color: rgb(240, 234, 213);">
	
		<div class="petcare-back">						
				<a href="/petcare/action/dog/eyes"><i class="fas fa-angle-double-right"></i>  강아지 행동 의미 보러가기</a>
				<h1> 고양이 행동 의미 </h1>
				
				<div class="petcare-wrap">
					<ul class="petcare-tab-wrap">
						<li><a class="selected" href="/petcare/action/cat/eyes">눈</a></li>
						<li><a href="/petcare/action/cat/mouse">입</a></li>
						<li><a href="/petcare/action/cat/ears">귀</a></li>
						<li><a href="/petcare/action/cat/tail">꼬리</a></li>
						<li><a href="/petcare/action/cat/body">몸 전체</a></li>
					</ul>
					
					<div class="accordion" id="accordionExample">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingOne">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					        발톱을 깨문다
					      </button>
					    </h2>
					    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>불안, 긴장 </strong>한 상태를 의미합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					       사람 햝기
					      </button>
					    </h2>
					    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        상대방에 대한 <strong>호의, 고마움</strong>을 의미합니다.
					      </div>
					    </div>
					  </div>					
					</div>
				
						
				</div>
					
		</div>
	</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	let tabBtns = document.querySelector('.petcare-tab-wrap').children;
	for (var i = 0; i < tabBtns.length; i++) {
		let tabBtn = tabBtns[i].children[0];
		console.dir("tabBtn : " + tabBtn);
		console.dir("tabBtn.classList : " + tabBtn.classList);
		tabBtn.classList.remove('selected');
		if(tabBtn.href==document.location.href.split('?')[0]){
			tabBtn.classList.add('selected');
		}
	}
</script>
</body>
</html>