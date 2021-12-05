<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${contextPath}/resources/js/hospital/jquery.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/1.1.0/proj4js-combined.min.js"></script>
  
<link rel='stylesheet' href="${contextPath}/resources/css/all.css">
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



	.name_section{
	background-color: rgb(240, 234, 213);
    height: 250px;
    font-family: 'SBAggroL';
	}
  .main1{
    height: 200px;
    margin: 0px 0px 0px 0px; 
  }
  .main_name{
    font-size: 35px;
    height:35%;
    text-align: center;
  }
  .main_group{
    height:35%;
    font-size: 20px;
    text-align: center;
  }

	.body_section{
	background-color: rgb(240, 234, 213);
    height: 1000px;
    font-family: 'SBAggroL';
	}
  .main2{
    position: absolute;
    transform: translate(-25%,5%);
    left:43%;
    
  }
  #main_map{
    width:700px;
    height:500px;
    border:2px solid white;
  }
  #main_content{
    margin:  50px 0px 0px 80px; 
    height:300px;
     width:500px;
  }
  #main_content>div{
    margin:  30px 0px 0px 0px; 
    font-size:18px;
    text-align:center;
  }




</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/"><img src="/resources/assets/img/site-logo-and-name.png" alt="..." style="width:280px;height:48px"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0"><hr>
                       <li class="nav-item"><a class="nav-link" href="#"  style="font-size: 1.5rem;">병원/시설</a>
	                        	<ul class="navbar-detail" ><hr>
		                        	<li><a href=#  style="font-size: 1.5rem;">동물병원</a>
	                        		<li><a href=#  style="font-size: 1.5rem;">편의시설검색</a>
	                        	</ul>
	                        </li>	
	                        <li class="nav-item"><a class="nav-link" href="/disease/index"  style="font-size: 1.5rem;">수술비용</a></li>
	                        <li class="nav-item"><a class="nav-link" href="/petcare/vaccine/dog"  style="font-size: 1.5rem;">펫케어</a>
	                       		<ul class="navbar-detail"><hr>
		                        	<li><a href="/petcare/vaccine/dog"  style="font-size: 1.5rem;">예방접종</a>
	                        		<li><a href="/petcare/food"  style="font-size: 1.5rem;">금지음식</a>
	                        		<li><a href="/petcare/action/dog/eyes"  style="font-size: 1.5rem;">행동의미</a>
	                        	</ul>
	                        </li>
	                        <li class="nav-item"><a class="nav-link" href="/board/info"  style="font-size: 1.5rem;">게시판</a>
	                        	<ul class="navbar-detail"><hr>
		                        	<li><a href=#  style="font-size: 1.5rem;">정보게시판</a>
	                        		<li><a href=#  style="font-size: 1.5rem;">고양이</a>
	                        		<li><a href=#  style="font-size: 1.5rem;">강아지</a>
	                        		<li><a href=#  style="font-size: 1.5rem;">후기</a>
	                        		<li><a href=#  style="font-size: 1.5rem;">모임게시판</a>
	                        		<li><a href=#  style="font-size: 1.5rem;">상담게시판</a>
	                        	</ul>
							</li>
	                        <li class="nav-item"><a class="nav-link" href="/market"  style="font-size: 1.5rem;">마켓</a></li>
	                        <c:if test="${empty authentication}">
								<li class="nav-item"><a class="nav-link" href="/member/login"  style="font-size: 1.5rem;">로그인</a></li><hr>
							</c:if>
							<c:if test="${not empty authentication}">
								<li class="nav-item"><a class="nav-link" href="/mypage/my-info"  style="font-size: 1.5rem;">마이페이지</a>
									<ul class="navbar-detail"><hr>
									<li><a href="/mypage/my-info"  style="font-size: 1.5rem;">마이페이지</a>
		                        	<li><a href="/member/logout"  style="font-size: 1.5rem;">로그아웃</a>
		                        	</ul>
								</li><hr>
							</c:if> 
					</ul>
                </div>
            </div>
        </nav>
        <section style="padding:0px;">
    <div class="name_section" >
      <div class="main1">
        <div class="main_name"><c:out value='${hospital.bplcNm}'/></div>
        <div class="main_group"><c:out value='${hospital.lindJobGbnNm} ${hospital.lindPrcbGbnNm}'/></div>
      </div>
    </div>
    <div class="body_section">
        <div class="main2">
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