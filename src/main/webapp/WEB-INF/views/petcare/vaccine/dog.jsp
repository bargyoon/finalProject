<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/petcare/vaccine.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
<section style="background-color: rgb(240, 234, 213);">
	
		<div class="petcare-back">						
					<h2>  반려동물 예방접종 </h2>
				
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
						          <td rowspan="5" class="l-yellow"><strong>기초접종(필수)</strong><td>1차(6주)</td><td>종합 백신(DHPP)1차 + 코로나 1차</td>
						        </tr>
						        <tr>
						          <td>2차(8주)</td><td>종합 백신(DHPP) 2차 + 코로나 2차</td>
						        </tr>
						        <tr>
								  <td>3차(10주)</td><td>종합 백신(DHPP) 3차 + 켄넬코프 1차</td>
								 </tr>
						        <tr>
								   <td>4차(12주)</td><td>종합 백신(DHPP) 4차 + 켄넬코프 2차</td>
								</tr>
						        <tr>
								   <td>5차(14주)</td><td>종합 백신(DHPP) 5차 + 광견병(처방)</td>
								</tr>
						        <tr>
						          <td class="l-yellow">선택접종</td><td></td><td>개 인플루엔자</td>
						        </tr>
						        <tr>
						          <td class="l-yellow">추가접종</td><td>매년 1회</td><td>종합백신 + 코로나 + 켄넬코프 + 광견병</td>
						        </tr>
						      </tbody>
			    	</table>
			    	
			    	<pre><i class="fas fa-check"></i> <strong> 종합백신 DHPP</strong> : 홍역(디스템퍼), 전염성 간염, 파보바이러스 장염, 파라 인플루엔자</pre>
					<pre><i class="fas fa-check"></i> <strong> 코로나 장염 </strong> : 구토, 설사를 일으키는 위장염</pre>
					<pre><i class="fas fa-check"></i> <strong> 켄넬코프(브론카이신) </strong> : 복합 호흡기 질환</pre>
					<pre><i class="fas fa-check"></i> <strong> 인플루엔자 </strong> : 독감</pre>
			    			
				<p>복용 약 / 스케일링</p>
					<table border="1" >
							<thead class="yel">
								<tr>
									<th>약 이름</th><th>주기</th><th>효과</th>
								</tr>
							</thead>
						      <tbody>
								<tr>
						          <td><strong>심장 사상충</strong></td><td>한 달에 한 번</td><td>모기에 의해 감염되는 기생충 예방</td>
						        </tr>
						        <tr>
						          <td><strong>구충제</strong> </td><td>6개월에 한 번</td><td>촌충 예방</td>
						        </tr>
						        <tr>
								  <td><strong>진드기약</strong> </td><td>1년에 3~4번 (특히 여름)</td><td>진드기, 벼룩, 곰팡이균 예방</td>
								 </tr>
								 <tr>
								  <td><strong>스케일링</strong> </td><td>3~5년에 한 번</td><td>치주염 예방</td>
								 </tr>
						      </tbody>
			    		</table>		
			    		<pre><i class="fas fa-check"></i> 체중, 연령, 견종 또는 임신여부에 따라 기준이 달라질 수 있으므로 수의사와 상담 후 결정해주세요.</pre>
				
				
				</div> 	
				
								
				</div>
					
		</div>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>	
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