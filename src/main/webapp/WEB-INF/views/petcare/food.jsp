<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/petcare/food_index.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
<section style="background-color: rgb(240, 234, 213);">
		<div class="petcare-back">					
				
				
			<h1> 금지음식 </h1>
			<h5 class="second-title">반려동물이 꼭 피해야하는 음식은?</h5>
			<div class="top-food">	
				<div class="food-one">
					<div class="caffeine">
						<img src="/resources/assets/img/food/카페인.png" style="width: 200px; margin: 10px 10px 30px 70px;">
						<p>카페인</p>
						카페인은 심장과 신경계를 자극시켜 불안, 빠른 호흡, 고열, 구토 그리고 근육 경련 등을 불러일으키며 별다른 해독제가 없습니다. 심한 경우 수시간 내 사망에 이르기도 합니다.
					</div>
					<div class="milk">
						<img src="/resources/assets/img/food/우유.png" style="width: 200px; margin: 10px 10px 30px 20px;">
						<p>우유</p>
						강아지와 고양이는 체내에 유당을 분해할 수 있는 효소가 부족해 우유 또는 유제품을 먹으면 설사를 하거나 알레르기를 일으킬 수 있습니다. 전용 우유를 주도록 합시다.		
					</div>
					<div class="fish">
						<img src="/resources/assets/img/food/생선.png" style="width: 200px; margin: 10px 5px 15px 70px;">
						<p>생선</p>
						해산물은 반려동물이 소화시키기가 힘들며 비타민B1이 체내에서 빠져나가게 만들어 구토·경련·식욕 부진·다리 마비 등을 일으키기도 합니다. 또한 익히지 않은 생선에는 살모넬라균이 있을 수 있을 수 있습니다.		
					</div>
				</div>
					
				<div class="food-two">
					<div class="avocado">
						<img src="/resources/assets/img/food/아보카도.png" style="width: 200px;">
						<p>아보카도</p>
						아보카도의 페르신이라는 성분은 강아지와 고양이의 위장을 자극하여 구토, 설사를 일으키며 심한 경우 목숨을 잃을 위험이 있습니다.
					</div>
					<div class="grape">
						<img src="/resources/assets/img/food/포도.png" style="width: 200px; margin-left: 50px;">
						<p>포도</p>
						포도와 건포도에는 신부전을 일으킬 수 있는 독소가 있고 설사, 식욕부진과 구토를 일으키므로 주의해야합니다.
					</div>
				</div>
			</div>	
				
		<div class="petcare-wrap">
			<div class="petcare-con">
				<a href="/petcare/food/dog"><img src="/resources/assets/img/food/dog1.png"></a>	
			</div>
			
			<div class="petcare-con">		
				<a href="/petcare/food/cat"><img src="/resources/assets/img/food/cat1.png"></a>			
			</div>
		</div>
					
		
		</div>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>	
</body>
</html>