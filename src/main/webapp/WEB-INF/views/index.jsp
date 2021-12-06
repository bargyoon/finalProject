<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>똑dog한 집사들</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
        <link href="/resources/css/styles.css" rel="stylesheet" />        
    </head>
    <body id="page-top">
	<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
	        <!-- Masthead-->
	        <header class="masthead">
	            <div class="container">	            	
	                <div class="masthead-subheading">똑dog한 집사들 홈페이지에 오신걸</div>
	                <div class="masthead-heading text-uppercase"> 환영합니다.</div>
	                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
	            </div>
	        </header>
        <!-- Board -->
        <section class="page-section" id="boards">
            <div class="container">
                <div class="row text-center">
                    <div class="board-in-main">
                        <h2 class="my-3">강아지 게시판</h2>     
                        <table class="table mb-0">
                              <thead class="thead-dark">
                                 <tr> 
                                    <th scope="col" style="width: 70%">제목</th>
                                    <th scope="col" style="width: 30%">조회 수</th> 
                                 </tr>
                              </thead>
                              <tbody class="customtable">
                                 <c:forEach items="${infoList}" var="infoList" varStatus="status">
                                    <tr>
                                       <td style="text-align:left"><a
                                          href="/board/${infoList.CATEGORY}/detail?bdIdx=${infoList.BD_IDX}">${infoList.BD_TITLE}</a><small
                                          class="ml-2"><i class="fas fa-comment mr-1"></i>${infoList.CM_CNT}</small></td>
                                       <td>${infoList.VIEW_COUNT}</td> 
                                    </tr>
                                 </c:forEach>
                              </tbody>
                         </table>                 
                    </div>
                    <div class="board-in-main">
                        <h2 class="my-3">고양이 게시판</h2>
                         <div class=board-list-in-main>
                        	<table class="table mb-0">
                              <thead class="thead-dark">
                                 <tr> 
                                    <th scope="col" style="width: 70%">제목</th>
                                    <th scope="col" style="width: 30%">조회 수</th> 
                                 </tr>
                              </thead>
                              <tbody class="customtable">
                                 <c:forEach items="${infoList}" var="infoList" varStatus="status">
                                    <tr>
                                       <td style="text-align:left"><a
                                          href="/board/${infoList.CATEGORY}/detail?bdIdx=${infoList.BD_IDX}">${infoList.BD_TITLE}</a><small
                                          class="ml-2"><i class="fas fa-comment mr-1"></i>${infoList.CM_CNT}</small></td>
                                       <td>${infoList.VIEW_COUNT}</td> 
                                    </tr>
                                 </c:forEach>
                              </tbody>
                         </table>              
                        </div>
                    </div>
                     <div class="board-in-main">
                        <h2 class="my-3">다른 게시판</h2>
                         <div class=board-list-in-main>
                        	<table class="table mb-0">
                              <thead class="thead-dark">
                                 <tr> 
                                    <th scope="col" style="width: 70%">제목</th>
                                    <th scope="col" style="width: 30%">조회 수</th> 
                                 </tr>
                              </thead>
                              <tbody class="customtable">
                                 <c:forEach items="${infoList}" var="infoList" varStatus="status">
                                    <tr>
                                       <td style="text-align:left"><a
                                          href="/board/${infoList.CATEGORY}/detail?bdIdx=${infoList.BD_IDX}">${infoList.BD_TITLE}</a><small
                                          class="ml-2"><i class="fas fa-comment mr-1"></i>${infoList.CM_CNT}</small></td>
                                       <td>${infoList.VIEW_COUNT}</td> 
                                    </tr>
                                 </c:forEach>
                              </tbody>
                         </table>              
                        </div>
                    </div>
                </div>
            </div>
        </section> 
        <!-- market-items-->
        <section class="page-section" id="market-items">
        
        
        
        
        
        
        
        </section> 
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
                            <i class="fas fa-circle fa-stack-2x text-primary" style="color:blue"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">E-Commerce</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary" style="color:blue"></i>
                            <i class="fas fa-hand-holding-heart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Pet Care</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary" style="color:blue"></i>
                            <i class="fas fa-comments fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Community</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                </div>
            </div>
        </section>     
           
    </body>
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>	
   <%@ include file="/WEB-INF/views/include/mainJs.jsp" %>
   
</html>