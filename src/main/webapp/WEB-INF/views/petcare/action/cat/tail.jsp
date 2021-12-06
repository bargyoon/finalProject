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
					        바짝 세움
					      </button>
					    </h2>
					    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>반가움, 기분 좋음, 신뢰, 만족</strong> 또는 <strong>자신감</strong>을 의미합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					       앞뒤로 빠르게 흔듦
					      </button>
					    </h2>
					    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>싫음, 짜증</strong>등 신경 곤두서있는 상태를 의미합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					        다리사이에 말아 넣음
					      </button>
					    </h2>
					    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>두려움, 무서움</strong> 또는 <strong>우울함, 불안감</strong>을 나타냅니다.
					      </div>
					    </div>
					  </div>
					   <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFour">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					        꼬리 끝만 천천히 움직임
					      </button>
					    </h2>
					    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>호기심 </strong>이 가득한 상태입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFive">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
					        꼬리가 부풀었음
					      </button>
					    </h2>
					    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>화남, 경고</strong>를 의미입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSix">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
					        아래로 낮춘 채로 걸어다님
					      </button>
					    </h2>
					    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>쓸쓸함, 기운없음</strong> 또는 긴장이 풀린 상태를 의미합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSeven">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
					        꼬리로 바닥을 침
					      </button>
					    </h2>
					    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>공격 직전</strong>이거나 <strong>초조함, 긴장감</strong>등 기분이 나쁜 상태입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingEight">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
					        휘휘 흔듦
					      </button>
					    </h2>
					    <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        상대방에게 물러나라고 경고하는 것입니다.
					      </div>
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