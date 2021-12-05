<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/hospital_adress.js"></script>

<style type="text/css">

	.name_section{
    height: 250px;
    border:1px solid white;
	}
  .main1{
    height: 100px;
    margin: 160px 0px 0px 0px; 
  }
  .main_name{
    font-size: 25px;
    height:65%;
    text-align: center;
  }

	.body_section{
    height: 1600px;
    position:relative;
	}
  .main2{
    height: 1500px;   /* seach높이조절 */
    width: 1000px;
    position: absolute;
    left:50%;
    transform: translate(-50%,0%);
    
  }





</style>



</head>
<body>
  <section >
    <div class="name_section">
      <div class="main1">
      </div>
    </div>
    <div class="body_section">
        <div class="main2">
          <h1>동물병원 종류</h1>
          <pre style="font-size:20px;">
          사람과 마찬가지도 동물병원에도 1차, 2차, 3차 병원이 있습니다. 
          동물병원은 사람병원과 다르게 법으로 나누어져있진 않습니다.
          보통 1차 동물병원은 일반적인 개인병원을 이야기하는 것이고 2차는 종합병원,
          3차는 수의학과를 가지고 있는 대학교에서 운영하는 병원을 이야기합니다.
          개인병원으로 이루어진 곳에서는 대부분 X-ray까지는 가능하나 
          MRI, CT, 초음파시설이 구비 되어있지 않습니다.
          대부분의 종합병원은 주사마취가 아닌 호흡마취를 하고, 
          세세한 부분까지 알아봐야 하는 큰 수술을 하는 경우가 많기 때문에
          장비 또한 개인병원과는 차이가 많이 납니다.
          일반적인 감기나 중성화, 예방접종의 경우에는 개인병원에서도 접수가 가능하고
          파보장염 같은 치명상을 줄 수 있는 범위내에서는 종합병원을 권장합니다.
          
          </pre>
        <img src="${contextPath}/resources/img/hospital.png" style="width:600px; height:300px;">
        <h1>동물병원 가격이 천차만별인 이유</h1>
          <pre style="font-size:20px;">
          보호자들이 어려움을 겪는 또 다른 부분은 병원마다의 가격편차입니다. 
          예전에는 동물진료비도 정해진 가격이 있었지만, 
          부당한 공동행위 등의 정비에 관한 법률(일명 카르텔일괄정리법)개정에 의해 법률이 폐지되었습니다.
          그로인해 현재 서비스 질을 높이고 소비자의 선택을 넓히기 위해서 수의사법이 시행중입니다. 
          또한 반려동물 평균수명은 배로 연장되었고 
          질병이 다양화 되면서 사용하는 약물의 종류도 많아졌기 때문에 
          동물병원 입장에서는 진료비를 맞추려고 해도 어려운 상황입니다.
          </pre>

          </div>
        </div>

        

  </section>


</body>
</html>