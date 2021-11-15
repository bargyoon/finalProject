<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/petcare/food_index.css">
</head>
<body>

<section>
		<div class="petcare-back">					
				
				
			<h1> 금지음식 </h1>
			<h5 class="second-title">반려동물이 꼭 피해야하는 음식은?</h5>
			<h3 class="third-title">대표 금지 음식</h3>
			<div class="top-food">	
				<div class="coffee">
					<img src="/resources/assets/img/food/카페인.png" style="width: 200px; margin: 10px 10px 30px 70px;">
					<p>카페인</p>
					카페인은 구토와 발작을 유발하고 심한 경우 수시간 내 사망에 이르기도 합니다.
				</div>
				<div class="coffee">
					<img src="/resources/assets/img/food/우유.png" style="width: 200px; margin: 10px 10px 30px 50px;">
					<p>우유</p>
					강아지와 고양이는 체내에 유당을 분해할 수 있는 효소가 부족해 우유 또는 유제품을 먹으면 설사를 하거나 알레르기를 일으킬 수 있습니다.
					
				</div>
				<div class="coffee">
					<img src="/resources/assets/img/food/생선.png" style="width: 200px; margin: 10px 5px 5px 70px;">
					<p>생선</p>
					해산물은 반려동물이 소화시키기가 힘들며 비타민B1이 체내에서 빠져나가게 만들어 구토·경련·식욕 부진·다리 마비 등을 일으키기도 합니다.
					
				</div>

			</div>	
				
		<div class="petcare-wrap">
			<div class="petcare-con">
				<a href="/petcare/food/fruit"><img src="/resources/assets/img/food/dog1.png"></a>	
			</div>
			
			<div class="petcare-con">		
				<a href="/petcare/food/fruit"><img src="/resources/assets/img/food/cat1.png"></a>			
			</div>
		</div>
					
		
		</div>
	</section>

</body>
</html>