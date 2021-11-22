<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
        <!-- Google fonts-->
        <!--
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" /> 
        -->
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />        
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	         <div class="container">
	         	<a class="navbar-brand" href="/"><img src="/resources/assets/img/site-logo-and-name.png" alt="..." /></a>      
               	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	                    Menu <i class="fas fa-bars ms-1"></i>
	                </button>
	                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0"><hr>
                       <li class="nav-item"><a class="nav-link" href="#">병원/시설</a>
	                        	<ul class="navbar-detail"><hr>
		                        	<li><a href=#>동물병원</a>
	                        		<li><a href=#>편의시설검색</a>
	                        	</ul>
	                        </li>	
	                        <li class="nav-item"><a class="nav-link" href="#">정보/칼럼</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#">수술비용</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#">펫케어</a>
	                       		<ul class="navbar-detail"><hr>
		                        	<li><a href="/petcare/vaccine/dog">예방접종</a>
	                        		<li><a href="/petcare/food">금지음식</a>
	                        		<li><a href="/petcare/action/dog/eyes">행동의미</a>
	                        	</ul>
	                        </li>
	                        <li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#">이벤트</a>
	                      	  	<ul class="navbar-detail"><hr>
		                        	<li><a href=#>이벤트</a>
	                        		<li><a href=#>체험단</a>
	                        	</ul>
	                        </li> 
	                        <li class="nav-item"><a class="nav-link" href="#">마켓</a></li>
	                        <c:if test="${empty authentication}">
								<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li><hr>
							</c:if>
							<c:if test="${not empty authentication}">
								<li class="nav-item"><a class="nav-link" href="/member/my-info">마이페이지</a></li><hr>
							</c:if> 
					</ul>
                </div>
            </div>
        </nav>   	
	        <!-- Masthead-->
	        <header class="masthead">
	            <div class="container">	            	
	                <div class="masthead-subheading">똑dog한 집사들 홈페이지에 오신걸</div>
	                <div class="masthead-heading text-uppercase"> 환영합니다.</div>
	                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
	            </div>
	        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Services</h2>
                    <h3 class="section-subheading text-muted">우리 사이트는 아래와 같은 서비스를 제공한다.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">E-Commerce</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-hand-holding-heart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Pet Care</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-comments fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Community</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                </div>
            </div>
        </section>        
        <!-- Board -->
        <section class="page-section" id="board">
            <div class="container">
                <div class="row text-center">
                    <div class="board-in-main">
                        <h2 class="my-3">강아지 게시판</h2>
                        <div class=board-list-in-main>
                        	게시판 코드 따 올 예정
                        </div>
                    </div>
                    <div class="board-in-main">
                        <h2 class="my-3">고양이 게시판</h2>
                         <div class=board-list-in-main>
                        	게시판 코드 따 올 예정
                        </div>
                    </div>
                </div>
            </div>
        </section> 
    </body>
    <footer>
	    <a>Creators : 똑Dog한 집사들</a><br>
		<a>Tel : 070-1111-1111</a><br>
		<a>Address : kh정보교육원 PClass </a><br>
	    <a>Partners : 광고 | 마켓 업체 | 동물병원</a><br>
    	<hr>
    	COPYRIGHT (C) SMART BUTLERS , ALL RIGHTS RESERVED. SMART BUTLERS.CO.KR    
    </footer>
    
      <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</html>