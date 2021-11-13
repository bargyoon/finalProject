<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/petcare/food.css">
</head>
<body>

<section>
	
		<div class="petcare-back">						
				<form action="/petcare/food" >
				<a href="/petcare/food/fruit"><i class="fas fa-angle-double-right"></i> 강아지 금지음식 보러가기</a>
					<h2> 고양이 금지음식 </h2>
					<div class="search">
							<div class="search-inner">
								<div class="search-input"><input type="text" name ="searchFood" value="${searchContent }" ></div>
								<div class="search-button"><button><i class="fas fa-search"></i></button></div>
							</div>
					</div>
				
				<div class="petcare-wrap">
					<ul class="petcare-tab-wrap">
						<li><a class="selected" href="/petcare/food/fruit">과일/야채</a></li>
						<li><a href="/petcare/food/beef">육류/해산물</a></li>
						<li><a href="/petcare/food">유제품</a></li>
						<li><a href="/petcare/food">기타</a></li>
					</ul>
						
					<div class="petcare-con">
						<div>
							<img src="/resources/assets/img/food/양파.png" style="width: 150px;">	
							<p>양파</p>
							양파는 독성 성분 (N-프로필 디설파이드)이 함유되어 있는데 이 성분은 고양이의 적혈구를 파괴합니다.	
							증상 : 고열, 무기력, 식욕감퇴 창백해짐, 피부 변색 검붉은 색의 소변
						</div>
						<div>
							<img src="/resources/assets/img/food/포도.png" style="width: 200px;">	
							<p>포도</p>
							포도와 건포도에는 신장을 손상시키는 독소가 있어, 심한경우는 급성 신부전증에 걸릴 수 있어 주의해야 합니다.
							증상 : 설사와 구토
						</div>					
	
					</div> 	
					
								
				</div>
					
			</form>
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