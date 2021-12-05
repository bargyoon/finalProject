<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0"><hr>
                       <li class="nav-item"><a class="nav-link" href="#">병원/시설</a>
	                        	<ul class="navbar-detail"><hr>
		                        	<li><a href=#>동물병원</a>
	                        		<li><a href=#>편의시설검색</a>
	                        	</ul>
	                        </li>	
	                        <li class="nav-item"><a class="nav-link" href="/disease/index">수술비용</a></li>
	                        <li class="nav-item"><a class="nav-link" href="/petcare/vaccine/dog">펫케어</a>
	                       		<ul class="navbar-detail"><hr>
		                        	<li><a href="/petcare/vaccine/dog">예방접종</a>
	                        		<li><a href="/petcare/food">금지음식</a>
	                        		<li><a href="/petcare/action/dog/eyes">행동의미</a>
	                        	</ul>
	                        </li>
	                        <li class="nav-item"><a class="nav-link" href="/board/info">게시판</a>
	                        	<ul class="navbar-detail"><hr>
		                        	<li><a href=#>정보게시판</a>
	                        		<li><a href=#>고양이</a>
	                        		<li><a href=#>강아지</a>
	                        		<li><a href=#>후기</a>
	                        		<li><a href=#>모임게시판</a>
	                        		<li><a href=#>상담게시판</a>
	                        	</ul>
							</li>
	                        <li class="nav-item"><a class="nav-link" href="/market">마켓</a></li>
	                        <c:if test="${empty authentication}">
								<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li><hr>
							</c:if>
							<c:if test="${not empty authentication}">
								<li class="nav-item"><a class="nav-link" href="/mypage/my-info">마이페이지</a>
									<ul class="navbar-detail"><hr>
									<li><a href="/mypage/my-info">마이페이지</a>
		                        	<li><a href="/member/logout">로그아웃</a>
		                        	</ul>
								</li><hr>
							</c:if> 
					</ul>
                </div>
            </div>
        </nav>
</body>