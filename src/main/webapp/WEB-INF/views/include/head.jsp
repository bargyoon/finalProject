<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
    <head>
  		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>똑dog한 집사들</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"  href="${contextPath}/resources/css/all.css">
<script type="text/javascript" src="${contextPath}/resources/js/webUtil.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/urlEncoder.js"></script>

 </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/"><img src="/resources/assets/img/site-logo-and-name.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#services">병원/시설</a>
                        	<ul class="navbar-detail"><hr>
	                        	<li><a href=#>동물병원</a>
                        		<li><a href=#>편의시설검색</a>
                        	</ul>
                        </li>	
                        <li class="nav-item"><a class="nav-link" href="#portfolio">정보/칼럼</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">수술비용</a></li>
                        <li class="nav-item"><a class="nav-link" href="#team">펫케어</a>
                       		<ul class="navbar-detail"><hr>
	                        	<li><a href=#>예방접종</a>
                        		<li><a href=#>금지음식</a>
                        		<li><a href=#>행동의미</a>
                        	</ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#contact">게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">이벤트</a>
                      	  	<ul class="navbar-detail"><hr>
	                        	<li><a href=#>이벤트</a>
                        		<li><a href=#>체험단</a>
                        	</ul>
                        </li> 
                        <li class="nav-item"><a class="nav-link" href="#contact">마켓</a></li>
                        <li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
         <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>