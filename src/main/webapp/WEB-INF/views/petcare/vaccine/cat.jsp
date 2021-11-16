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
						          <td rowspan="5"><strong>기초접종(필수)</strong><td>1차(8주)</td><td>종합 백신(FVRCP) 1차</td>
						        </tr>
						        <tr>
						          <td>2차(11주)</td><td>종합 백신(FVRCP) 2차</td>
						        </tr>
						        <tr>
								  <td>3차(14주)</td><td>종합 백신(FVRCP) 3차</td>
								 </tr> 
						        <tr>
								   <td>4차(12주)</td><td>전염성 복막염</td>
								</tr>
						        <tr>
								   <td>5차(14주)</td><td>종합 5차 + 광견병(처방)</td>
								</tr>
						        <tr>
						          <td>선택접종</td><td></td><td>백혈병, 클라미디아</td>
						        </tr>
						        <tr>
						          <td>추가접종</td><td>매년 1회</td><td>종합, 광견병, 심장사상충</td>
						        </tr>
						      </tbody>
			    	</table>
			    	<pre><i class="fas fa-check"></i> <strong> 종합백신 3종</strong>
- 허피스바이러스 : 바이러스성 비기관염, 헤르페스 = 고양이감기
- 칼리시바이러스 : 고양이독감, 폐렴
- 파보바이러스 : 범백혈구 감소증</pre>
					<pre><i class="fas fa-check"></i> <strong> 클라미디아(4종) </strong>
 - 호흡기 감염증. '허피스, 칼리시'와 비슷 (단, 사람에게도 전염됨)</pre>
					<pre><i class="fas fa-check"></i> <strong> 백혈병(5종) </strong>: 악성림프종</pre>
			    	
			    			
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