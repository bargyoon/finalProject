<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/petcare/action.css">
</head>
<body>

<section>
	
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
					        배를 보이고 눕는다
					      </button>
					    </h2>
					    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>신뢰, 믿음, 편안함</strong>을 의미합니다. 단, 고양이는 배를 만지는 걸 좋아하지 않으니 목덜미를 쓰다듬어줍시다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					       배설물을 흙으로 덮지 않음
					      </button>
					    </h2>
					    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					         주인보다 우위에 있다고 생각하는 경우 영역, 서열을 과시하기 위해 행동을 합니다. 집이 안전하다고 여기는 경우에도 같은 행동을 하곤 합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					        발로 꾹꾹 누르기
					      </button>
					    </h2>
					    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>만족, 안정감, 기분좋음, 편안함, 애정표현</strong> 의 의미입니다.
					      </div>
					    </div>
					  </div>
					   <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFour">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					        그루밍
					      </button>
					    </h2>
					    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        그루밍은 고양이가 혀로 털에 묻은 이물질을 제거하고 깨끗하게 정돈하는 행위를 의미합니다. 사람 앞에서 그루밍한다는 건 그 사람을 신뢰한다는 뜻이며 일종의 애정표현입니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFive">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
					        벌레, 장난감을 가져다줌
					      </button>
					    </h2>
					    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>고마움, 애정표현</strong>을 의미합니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSix">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
					       얼굴, 엉덩이를 비빈다
					      </button>
					    </h2>
					    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					       고양이의 턱과 관자놀이에서는 특유의 분비물이 나오는데 고양이는 이 분비물을 여기저기에 문질러 영역표시를 합니다. 사람에게 한다면 일종의 애정표현이다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSeven">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
					        등을 높이 치켜올림
					      </button>
					    </h2>
					    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        겁먹었을 때 이런 행동을 합니다. 가끔 털이 함께 곤두서기도 하는데 이는 자신을 더 크고 위협적으로 만드려는 의도를 갖고 있습니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingEight">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
					        작게 웅크리기
					      </button>
					    </h2>
					    <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>경계, 겁먹음</strong>의 상태입니다.
					      </div>
					    </div>
					  </div>
					</div>
				
						
				</div>
					
		</div>
	</section>

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