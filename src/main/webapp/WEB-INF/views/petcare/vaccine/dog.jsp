<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/petcare/vaccine.css">
</head>
<body>

<section>
	
		<div class="petcare-back">						
				<form action="/petcare/food" >
					<h2>  예방접종 </h2>
				
				<div class="petcare-wrap">
					<ul class="petcare-tab-wrap">
						<li><a class="selected" href="/petcare/vaccine/dog">강아지</a></li>
						<li><a href="/petcare/vaccine/cat">고양이</a></li>
					</ul>
						
				<div class="petcare-con">
				<p>기초 예방접종과 주기</p>
					<table border="1">
						      <tbody>
						        <tr class="yel" >
						          <td ></td><td><strong>접종시기</strong></td><td><strong>접종항목</strong></td>
						        </tr>
						        <tr>
						          <td rowspan="5"><strong>기초접종(필수)</strong><td>1차(6주)</td><td>종합 1차 + 코로나 1차</td>
						        </tr>
						        <tr>
						          <td>2차(8주)</td><td>종합 2차 + 코로나 2차</td>
						        </tr>
						        <tr>
								  <td>3차(10주)</td><td>종합 3차 + 켄넬코프 1차</td>
								 </tr>
						        <tr>
								   <td>4차(12주)</td><td>종합 4차 + 켄넬코프 2차</td>
								</tr>
						        <tr>
								   <td>5차(14주)</td><td>종합 5차 + 광견병(처방)</td>
								</tr>
						        <tr>
						          <td>선택접종</td><td></td><td>개 인플루엔자</td>
						        </tr>
						        <tr>
						          <td>추가접종</td><td>매년 1회</td><td>종합 + 코로나 + 켄넬코프 + 광견병</td>
						        </tr>
						      </tbody>
			    	</table>
			    			
				<p>복용 약</p>
					<table border="1" >
							<thead class="yel">
								<tr>
									<th>약 이름</th><th>주기</th><th>효과</th>
								</tr>
							</thead>
						      <tbody>
								<tr>
						          <td>심장 사상충</td><td>한 달에 한 번</td><td>모기에 의해 감염되는 기생충 예방</td>
						        </tr>
						        <tr>
						          <td>구충제</td><td>6개월에 한 번</td><td>촌충 예방</td>
						        </tr>
						        <tr>
								  <td>진드기약</td><td>1년에 3~4번 (특히 여름)</td><td>진드기, 벼룩, 곰팡이균 예방</td>
								 </tr>
						      </tbody>
			    		</table>		
			    		<pre><i class="fas fa-check"></i> 체중, 연령, 견종 또는 임신여부에 따라 기준이 달라질 수 있으므로 수의사와 상담 후 결정해주세요.</pre>
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