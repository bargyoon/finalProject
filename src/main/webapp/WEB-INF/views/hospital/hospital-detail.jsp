<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑dog한 집사들</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${contextPath}/resources/js/hospital/jquery.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/1.1.0/proj4js-combined.min.js"></script>
  
<style type="text/css">
/* 폰트 어그로 */
@font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'SBAggroL';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroL.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'SBAggroM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/* google noto sans */

@font-face {
font-family: 'NotoKrL';
font-style: normal;
font-weight: 100;
src: local('Noto Sans Light'), local('NotoSans-Light'), url(/fonts/NotoSans-Light.eot);
src: url(/fonts/NotoSans-Light.eot?#iefix) format('embedded-opentype'),
url(/fonts/NotoSans-Light.woff2) format('woff2'),
url(/fonts/NotoSans-Light.woff) format('woff');;
}
@font-face {
font-family: 'NotoKrR';
font-style: normal;
font-weight: 300;
src: local('Noto Sans Regular'), local('NotoSans-Regular'), url(/fonts/NotoSans-Regular.eot);
src: url(/fonts/NotoSans-Regular.eot?#iefix) format('embedded-opentype'),
url(/fonts/NotoSans-Regular.woff2) format('woff2'),
url(/fonts/NotoSans-Regular.woff) format('woff');
}
@font-face {
font-family: 'NotoKrM';
font-style: normal;
font-weight: 500;
src: local('Noto Sans Medium'), local('NotoSans-Medium'), url(/fonts/NotoSans-Medium.eot);
src: url(/fonts/NotoSans-Medium.eot?#iefix) format('embedded-opentype'),
url(/fonts/NotoSans-Medium.woff2) format('woff2'),
url(/fonts/NotoSans-Medium.woff) format('woff');
}
@font-face {
font-family: 'NotoKrB';
font-style: normal;
font-weight: 700;
src: local('Noto Sans Bold'), local('NotoSans-Bold'), url(/fonts/NotoSans-Bold.eot);
src: url(/fonts/NotoSans-Bold.eot?#iefix) format('embedded-opentype'),
url(/fonts/NotoSans-Bold.woff2) format('woff2'),
url(/fonts/NotoSans-Bold.woff) format('woff');
}

body{
    background-color: rgb(240, 234, 213);
}

	.name_section{
	background-color: rgb(240, 234, 213);
    height: 1100px;
    font-family: 'SBAggroL';
	}
  .main1{
    height: 200px;
  }
  .main_name{
    font-size: 35px;
    height:35%;
        text-align: center;
  }
  .main_group{
    height:35%;
    font-size: 20px;
    margin-top:15px;
        text-align: center;
  }

  .main2{
    position: absolute;
    transform: translate(-25%,10%);
    left:41%; 
    
  }
  #main_map{
    width:700px;
    height:500px;
    border:2px solid white;
  }
  #main_content{
    margin:  0px 0px 0px 80px; 
    height:300px;
     width:500px;
  }
  #main_content>div{
    margin:  20px 0px 0px 0px; 
    font-size:18px;
    text-align:center;
  }




</style>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>

  <%@ include file="/WEB-INF/views/include/navBar.jsp" %>



    <section style="padding: 0px;">
    <div class="name_section" >
      
        <div class="main2">
        	<div class="main1">
		      <div class="main_name"><c:out value='${hospital.bplcNm}'/></div>
		      <div class="main_group"><c:out value='${hospital.lindJobGbnNm}'/>
		      <c:if test="${hospital.lindPrcbGbnNm =='없음'}"> </c:if>
		      <c:if test="${hospital.lindPrcbGbnNm !='없음'}">${hospital.lindPrcbGbnNm}</c:if>
		      </div>
		    </div>
        
            <div id="main_map"></div>
            <div id="main_content">
           	  <div ><i style="color:#A4A4A4"class="fas fa-map-marker-alt"></i></div>
              <div id="landStar"><c:out value='${hospital.siteWhlAddr}'/></div>
              <div id="roadStar">(도로명주소)<br><c:out value='${hospital.rdnWhlAddr}'/></div>
              <div> TELL )  <c:out value='${hospital.siteTel}'/></div>
             </div>
        </div>
    </div>
    
  </section>
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=90boxxyo8d&submodules=geocoder&callback=initMap"></script>
  <script type="text/javascript">
  
 //좌표변환
 Proj4js.defs["EPSG:2097"] ="+proj=tmerc +lat_0=38 +lon_0=127.0028902777778 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43";
 Proj4js.defs["EPSG:5174"] ="+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs";
 var tm = new Proj4js.Proj("EPSG:2097");
 var wgs84 = new Proj4js.Proj("EPSG:5174");
 var pa = new Proj4js.Point(${hospital.indexX},${hospital.indexY});
 p = Proj4js.transform(tm,wgs84,pa);
 var q =p.x+","+p.y;
 console.dir(q);
 
//지도
 var map = null;
 var map = new naver.maps.Map("main_map", {
  useStyleMap: true,
  center: new naver.maps.Point(p.x, p.y),
  zoom: 16
});
 
var urlimg = '${hospital.lindJobGbnNm}'=='동물병원'?'${contextPath}/resources/img/hospital/map-pin-red2.png' :  '${hospital.lindJobGbnNm}'=='동물약국'? '${contextPath}/resources/img/hospital/map-pin-green.png' : '${contextPath}/resources/img/hospital/map-pin-pink.png';
//마커
 var marker = new naver.maps.Marker({
  position: new naver.maps.Point(p.x, p.y),
    map: map,
    icon:{
    	url: urlimg,
    	size: new naver.maps.Size(50,52),
    	origin: new naver.maps.Point(0,0),
    	anchor: new naver.maps.Point(25,26)
    }
});
 
//정보창
var contentString = [
        '<div class="iw_inner" style="padding:16px">',
        '   <div div style="font-weight: 1000;font-size: 20px">${hospital.bplcNm}</div>',
        '   <div style="color:#999;font-weight: 600;font-size: 18px">${hospital.lindJobGbnNm}</div>',
        '   <div style="color:#999;font-weight: 500;font-size: 15px">[지번주소] : ${hospital.siteWhlAddr}</div>',
        '   <div style="color:#999;font-weight: 500;font-size: 15px">[도로명주소] : ${hospital.rdnWhlAddr}</div>',
        '   <div style="color:#3c83dc;font-weight: 500"> 전화번호 : ${hospital.siteTel}<div>',
        '</div>'
    ].join('');


var infowindow = new naver.maps.InfoWindow({
    content: contentString,
    borderColor: "#F6E3CE",
    backgroundColor: "#FFFFFF",
    borderWidth: 3,
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

infowindow.open(map, marker);


//동물판매업 주소 reversegeocode변환
if('${hospital.lindJobGbnNm}'== '편의시설'){
	searchCoordinateToAddress(q);
}

function searchCoordinateToAddress(q) {

  infowindow.close();
  naver.maps.Service.reverseGeocode({
    coords: q,
    orders: [
      naver.maps.Service.OrderType.ADDR,
      naver.maps.Service.OrderType.ROAD_ADDR
    ].join(',')
  }, function(status, response) {
    if (status === naver.maps.Service.Status.ERROR) {
      if (!q) {
        return alert('ReverseGeocode Error, Please check latlng');
      }
      if (q.toString) {
        return alert('ReverseGeocode Error, latlng:' + q.toString());
      }
      if (q.x && q.y) {
        return alert('ReverseGeocode Error, x:' + q.x + ', y:' + q.y);
      }
      return alert('ReverseGeocode Error, Please check latlng');
    }

    var address = response.v2.address,
        htmlAddresses = [];
    if (address.jibunAddress !== '') {
        htmlAddresses.push('<div style="color:#999;font-weight: 500;font-size: 15px">[지번 주소] ' + address.jibunAddress)+'</div>';
    }
    if (address.roadAddress !== '') {
        htmlAddresses.push('<div style="color:#999;font-weight: 500;font-size: 15px">[도로명 주소] ' + address.roadAddress)+'</div>';
    }
    infowindow.setContent([
      '<div class="iw_inner" style="padding:16px">',
      '<div style="font-weight: 1000;font-size: 20px">${hospital.bplcNm}</div>',
      '<div style="color:#999;font-weight: 500;font-size: 18px">${hospital.lindJobGbnNm}</div>',
      htmlAddresses.join('<br />'),
      '</div>'
    ].join('\n'));
	
    $('#landStar').text('주소 :'+ address.jibunAddress);
    $('#roadStar').text('도로명 주소 :'+ address.roadAddress);
    infowindow.open(map, marker.getPosition());
  });
}

  </script>
  

</body>
</html>