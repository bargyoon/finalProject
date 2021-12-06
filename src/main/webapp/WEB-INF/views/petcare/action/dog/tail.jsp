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
				<a href="/petcare/action/cat/eyes"><i class="fas fa-angle-double-right"></i>  고양이 행동 의미 보러가기</a>
				<h1> 강아지 행동 의미 </h1>
				<h3>카밍시그널 (Calming Signals)</h3>
				<h4> : 개들만의 소통방법. 상대 또는 자신의 공격성이나 다른 위협을 예방하고 진정시키기 위해 사용되는 바디랭귀지.</h4>
				
				<div class="petcare-wrap">
					<ul class="petcare-tab-wrap">
						<li><a class="selected" href="/petcare/action/dog/eyes">눈</a></li>
						<li><a href="/petcare/action/dog/mouse">입</a></li>
						<li><a href="/petcare/action/dog/ears">귀</a></li>
						<li><a href="/petcare/action/dog/tail">꼬리</a></li>
						<li><a href="/petcare/action/dog/body">몸 전체</a></li>
					</ul>
					
					<div class="accordion" id="accordionExample">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingOne">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					        바짝 세움
					      </button>
					    </h2>
					    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>경계, 주시, 집중</strong> 또는 <strong>자신감</strong>을 의미합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					       뻣뻣하게 흔듦
					      </button>
					    </h2>
					    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>불안, 흥분, 약간의 적의</strong>가 있는 상태입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					        좌우로 빠르게 흔듦
					      </button>
					    </h2>
					    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>흥분, 반가움</strong>을 나타냅니다.
					      </div>
					    </div>
					  </div>
					   <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFour">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					        제자리에 가만히 있음
					      </button>
					    </h2>
					    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>편안함, 침착, 일상</strong>의 상태입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFive">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
					        다리사이에 말아 넣음
					      </button>
					    </h2>
					    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>두려움, 불안, 순종</strong>의 의미입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSix">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
					        꼬리를 물려고 빙글빙글 돌기
					      </button>
					    </h2>
					    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>흥분, 스트레스</strong>를 의미합니다.
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