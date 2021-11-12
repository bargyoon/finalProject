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
						 <img src="/resources/assets/img/food/초콜렛.png" style="width: 200px; margin: 10px;">
						 <img src="/resources/assets/img/food/우유.png" style="width: 200px; margin: 10px;">
						 <img src="/resources/assets/img/food/생선.png" style="width: 200px; margin: 10px 10px 10px 30px;">				
					</div>	
				
				<div class="petcare-wrap">
					<div class="petcare-con">
					<%-- <%@ include file="/WEB-INF/views/petcare/petcare_tab.jsp" %> --%>
					
					

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