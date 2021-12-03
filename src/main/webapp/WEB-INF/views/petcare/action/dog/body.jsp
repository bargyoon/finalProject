<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/petcare/action.css">
</head>
<body>

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
					        긴장 없이 축 늘어진 상태
					      </button>
					    </h2>
					    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>편안한 일상</strong>을 의미합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					       경직되어있거나 뒷덜미 털이 곤두서있음
					      </button>
					    </h2>
					    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>경계</strong> 또는 <strong>공격 준비중</strong>이므로 가까이 다가가면 안됩니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					        바닥에 몸을 뒹군다
					      </button>
					    </h2>
					    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>순종</strong> 의 의미입니다.
					      </div>
					    </div>
					  </div>
					   <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFour">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					        다운독 자세
					      </button>
					    </h2>
					    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        놀아달라는 강렬한 표현입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFive">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
					        배를 보이고 눕는다
					      </button>
					    </h2>
					    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>복종</strong>의 의미입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSix">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
					       자신의 배설물 섭취
					      </button>
					    </h2>
					    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        자연스러운 행위입니다. 영양소를 보충하기 위해 먹기도 합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSeven">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
					        구덩이 파기
					      </button>
					    </h2>
					    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        아끼는 물건을 숨기거나, 더울 때 몸을 식히기 위해 행동합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingEight">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
					        몸 털기
					      </button>
					    </h2>
					    <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        같이 놀자는 의미이거나 스트레스로 인한 흥분을 가라앉히기 위해 털기도 합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingNine">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
					        몸 긁기
					      </button>
					    </h2>
					    <div id="collapseNine" class="accordion-collapse collapse" aria-labelledby="headingNine" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>불안, 긴장한 마음</strong>을 진정시키려는 의미입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTen">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
					        갸우뚱
					      </button>
					    </h2>
					    <div id="collapseTen" class="accordion-collapse collapse" aria-labelledby="headingTen" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>집중, 호기심</strong>의 의미입니다.
					      </div>
					    </div>
					  </div>
					</div>
				
						
				</div>
					
		</div>
	</section>
<!-- Bootstrap core JS-->
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