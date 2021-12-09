<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/market/slick/slick.css">
<link rel="stylesheet" href="${contextPath}/resources/css/market/slick/slick-theme.css">
<link rel="stylesheet" href="${contextPath}/resources/css/market/market.css">
    <body id="page-top">
	<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
	        <!-- Masthead-->
	        <header class="masthead">
	            <div class="container">	            	
	                <div class="masthead-subheading">똑dog한 집사들 홈페이지에 오신걸</div>
	                <div class="masthead-heading text-uppercase"> 환영합니다.</div>
	                <a class="btn btn-primary btn-xl text-uppercase" href="#services" style="background-color: #625C46; border-color: #625C46;">Tell Me More</a>
	            </div>
	        </header>
        <!-- Board -->
        <section class="page-section" id="boards">
            <div class="container">
           		<div class="text-center">
                    <h2 class="section-heading text-uppercase">Community</h2>
                    <h3 class="section-subheading text-muted">똑DOG한 집사들에서 다양한 커뮤니티를 이용해보세요.</h3>
                </div>
                <div class="row text-center">
                    <div class="board-in-main" style="width:350px; height: 650px; outline :solid 15px #F0EAD5; border-radius: 10px 10px 10px 10px ">
                        <h2 class="my-3">강아지 게시판</h2>     
                        <table class="table mb-0">
                              <thead class="thead-dark">
                                 <tr> 
                                    <th scope="col" style="width: 70%">제목</th>
                                    <th scope="col" style="width: 30%">조회 수</th> 
                                 </tr>
                              </thead>
                              <tbody class="customtable">
                                 <c:forEach items="${dogList}" var="dogList" varStatus="status">
                                    <tr>
                                       <td style="text-align:left"><a
                                          href="/board/dog/detail?bdIdx=${dogList.BD_IDX}" style="color:black; text-decoration:none;">${dogList.BD_TITLE}</a><small
                                          class="ml-2"><i class="fas fa-comment mr-1" style="margin-left:4px; margin-right:4px"></i>${dogList.CM_CNT}</small></td>
                                       <td>${dogList.VIEW_COUNT}</td> 
                                    </tr>
                                 </c:forEach>
                              </tbody>
                         </table>                 
                    </div>
                    <div class="board-in-main"  style="width:350px;height: 650px; margin:auto;outline :solid 15px #F0EAD5; border-radius: 10px 10px 10px 10px ">
                        <h2 class="my-3" >고양이 게시판</h2>
                         <div class=board-list-in-main>
                        	<table class="table mb-0">
                              <thead class="thead-dark">
                                 <tr> 
                                    <th scope="col" style="width: 70%">제목</th>
                                    <th scope="col" style="width: 30%">조회 수</th> 
                                 </tr>
                              </thead>
                              <tbody class="customtable">
                                 <c:forEach items="${catList}" var="catList" varStatus="status">
                                    <tr>
                                       <td style="text-align:left"><a
                                          href="/board/cat/detail?bdIdx=${catList.BD_IDX}" style="color:black; text-decoration:none;">${catList.BD_TITLE}</a><small
                                          class="ml-2"><i class="fas fa-comment mr-1"  style="margin-left:4px; margin-right:4px"></i>${catList.CM_CNT}</small></td>
                                       <td>${catList.VIEW_COUNT}</td> 
                                    </tr>
                                 </c:forEach>
                              </tbody>
                         </table>              
                        </div>
                    </div>
                     <div class="board-in-main"  style="width:350px; height: 650px;outline :solid 15px #F0EAD5; border-radius: 10px 10px 10px 10px ">
                        <h2 class="my-3">정보 게시판</h2>
                         <div class=board-list-in-main>
                        	<table class="table mb-0">
                              <thead class="thead-dark" ;>
                                 <tr> 
                                    <th scope="col" style="width: 70%">제목</th>
                                    <th scope="col" style="width: 30%">조회 수</th> 
                                 </tr>
                              </thead>
                              <tbody class="customtable">
                                 <c:forEach items="${infoList}" var="infoList" varStatus="status" >
                                    <tr>
                                       <td style="text-align:left"><a
                                          href="/board/info/detail?bdIdx=${infoList.BD_IDX}" " style="color:black; text-decoration:none;">${infoList.BD_TITLE}</a><small
                                          class="ml-2"><i class="fas fa-comment mr-1"  style="margin-left:4px; margin-right:4px"></i>${infoList.CM_CNT}</small></td>
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
        	<div class="container">
           		<div class="text-center">
                    <h2 class="section-heading text-uppercase">E-Commerce</h2>
                    <h3 class="section-subheading text-muted">똑DOG한 집사들의 장터를 방문하세요.</h3>
                </div>
        	</div>
        	<div class="container px-4 mt-5">
				<div class="slick_test">
					<c:forEach var="prd" items="${prdList}">
						<div class="card h-100" style="border: none;">
							<c:if test="${prd.SALE_PER ne 0}">
		                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.85rem">할인</div>
							</c:if>
	                        <a class="btn" href="/market/shop/prd-detail?pn=${prd.PRD_IDX}">
	                            <img class="card-img-top" src="${prd.downloadURL}" alt="..." />
	                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
	                                <div class="text-center">
	                                    <h5 class="fw-bolder">${prd.NAME}</h5>
	                                </div>
	                            </div>
	                        </a>
	                        <div class="d-flex justify-content-center small text-warning mb-2">
	                        	<c:if test="${prd.RATING ne 0}">
									<c:forEach var="i" begin="0" step="1" end="${prd.RATING-1}">
		                            	<i class="fas fa-star"></i>
		                            </c:forEach>
	                            </c:if>
	                        </div>
							<c:if test="${prd.SALE_PER ne 0}">
								<div class="text-center">
										<span style="color: red;">${prd.SALE_PER}%</span>
									<span class="text-muted text-decoration-line-through" style="font-size: smaller;"><fmt:formatNumber value="${prd.PRICE}"/>원</span>
								</div>
							</c:if>
							<div class="text-center">
								<c:if test="${prd.SALE_PER eq 0}">
					            	<fmt:formatNumber value="${prd.PRICE}"/>원
								</c:if>
								<c:if test="${prd.SALE_PER ne 0}">
					            	<fmt:formatNumber value="${prd.PRICE * (1 - (prd.SALE_PER/100))}"/>원
								</c:if>
							</div>
	                    </div>
					</c:forEach>        
	     	   </div>
     	   </div>
        </section> 
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Services</h2>
                    <h3 class="section-subheading text-muted">똑DOG한 집사들에서 제공하는 서비스 입니다.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="serviceImage"><img src="/resources/assets/img/market.png"/></span>
                        <h4 class="my-3">E-Commerce</h4>
                        <p class="text-muted">똑DOG한 집사들에서는 고객의 요구에 맞쳐 쇼핑몰을 운영합니다. 반려동물을 위한 사료,간식,용품,장난감,이동장 등 다양하
                        제품을 선보이고 있습니다. 구매금액의 일정부분 적립금을 제공하고 있으며, 다양한 쿠폰과 이벤트가 준비되어 있습니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="serviceImage"><img src="/resources/assets/img/petcare.png"/></span>
                        <h4 class="my-3">Pet Care</h4>
                        <p class="text-muted">반려동물을 키우기 시작하면서 부터 우리는 가족이 되었습니다. 반려동물은 아프면 아프다고 말하지 못합니다. 그렇기 때문에 올바른
                        관심을 통하여 우리는 반려동물이 아프지 않고 오랫동안 같이 우리와 함께 하기위하여 다양한 정보를 제공합니다.</p>
                    </div>
                    <div class="col-md-4">
                       <span class="serviceImage"><img src="/resources/assets/img/comunity.png"/></span>
                        <h4 class="my-3">Community</h4>
                        <p class="text-muted">똑DOG한 집사들에서는 다양한 소통을 할 수 있도록 커뮤니티를 운영합니다. 커뮤니티는 게시판으로 운영됩니다. 다양한 정보,강아지,
                        고양이,다양한후기,모임을위한 게시판 그리고 수의사를 통한 상담이 가능하도록 한 게시판이 운영중에 있습니다. </p>
                    </div>
                </div>
            </div>
        </section>        
    </body>
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>	
   <%@ include file="/WEB-INF/views/include/mainJs.jsp" %>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/slick.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/market/slick/main-slick.js"></script>
   
</html>