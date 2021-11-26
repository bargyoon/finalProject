<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>똑Dog한 집사들의 장터</title>

	<!-- slick css -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/shop/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/shop/slick/slick-theme.css"/>
</head>
<body>
        <!-- Navigation-->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand fw-bolder" href="#!">똑Dog한 집사들의 장터</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="#!">기획전</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">랭킹</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">신상품</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">모든 상품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">간식</a></li>
                                <li><a class="dropdown-item" href="#!">사료</a></li>
                                <li><a class="dropdown-item" href="#!">건강관리</a></li>
                                <li><a class="dropdown-item" href="#!">위생/배변</a></li>
                                <li><a class="dropdown-item" href="#!">미용/목욕</a></li>
                                <li><a class="dropdown-item" href="#!">급수기/급식기</a></li>
                                <li><a class="dropdown-item" href="#!">하우스/울타리</a></li>
                                <li><a class="dropdown-item" href="#!">이동장</a></li>
                                <li><a class="dropdown-item" href="#!">의류/악세서리</a></li>
                                <li><a class="dropdown-item" href="#!">장난감</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="d-flex">
                        <button class="btn" type="submit">커뮤니티로 이동</button>
                        <a class="btn" href="#!">MY PAGE</a>
                        <button class="btn" type="submit">
                            <i class="bi-cart-fill"></i>
                            장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="slick_test2 bg-dark py-5" style="margin-top: 3.5rem; min-height: 30rem;">
                <div class="px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">기획전 1</h1>
                        <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                    </div>
                </div>
                <div class="px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">기획전 2</h1>
                        <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                    </div>
                </div>
                <div class="px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">기획전 3</h1>
                        <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                    </div>
                </div>
        </header>
        <!-- Section-->
        <section class="py-5 mb-5">
            <div class="container px-4 mt-5">
                <div class="text-center gx-4">
                    <h1 class="display-6 fw-bolder" style="color: darkorange;">New Arrivals</h1>
                    <h1 class="display-6 fw-bolder">신상품</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
            <div class="container px-4 mt-5">
                <div class="slick_test">
                    <div class="card h-100">
                        <!-- Product image-->
                        <a class="btn" href="http://localhost:9090">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">더독 닥터소프트 <br>야채&식이섬유 1.2kg</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            12,000원
                        </div>
                    </div>
                    <div class="card h-100">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.85rem">할인</div>
                        <!-- Product image-->
                        <a class="btn" href="http://localhost:9090">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            <span style="color: red;">35%</span>
                            <span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
                        </div>
                        <div class="text-center">
                            1,700원
                        </div>
                    </div>
                    <div class="card h-100">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.85rem">할인</div>
                        <!-- Product image-->
                        <a class="btn" href="#!">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            <span style="color: red;">35%</span>
                            <span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
                        </div>
                        <div class="text-center">
                            1,700원
                        </div>
                    </div>
                    
                    <div class="card h-100">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.85rem">할인</div>
                        <!-- Product image-->
                        <a class="btn" href="#!">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            <span style="color: red;">35%</span>
                            <span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
                        </div>
                        <div class="text-center">
                            1,700원
                        </div>
                    </div>
                    
                    <div class="card h-100">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.85rem">할인</div>
                        <!-- Product image-->
                        <a class="btn" href="#!">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            <span style="color: red;">35%</span>
                            <span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
                        </div>
                        <div class="text-center">
                            1,700원
                        </div>
                    </div>
                    
                    <div class="card h-100">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.85rem">할인</div>
                        <!-- Product image-->
                        <a class="btn" href="#!">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            <span style="color: red;">35%</span>
                            <span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
                        </div>
                        <div class="text-center">
                            1,700원
                        </div>
                    </div>
                    
                    <div class="card h-100">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.85rem">할인</div>
                        <!-- Product image-->
                        <a class="btn" href="#!">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            <span style="color: red;">35%</span>
                            <span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
                        </div>
                        <div class="text-center">
                            1,700원
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="py-3 my-5" style="background-color: darkgreen;">
            <div class="px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">친환경 제품</h1>
                    <p class="lead fw-normal text-white-50 mb-0">주인님들의 옥체에 해롭지 않은 제품들</p>
                    <div class="card-footer pt-3 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark bg-dark text-white" href="#">상품 보러 가기</a></div>
                    </div>
                </div>
            </div>
        </section>


        <section class="py-5">
            <div class="container px-4 mt-5">
                <div class="text-center gx-4">
                    <h1 class="display-6 fw-bolder" style="color: darkorange;">Best Item</h1>
                    <h1 class="display-6 fw-bolder">인기 제품</h1>
                    <p class="lead fw-normal mb-0" style="color: gray;">가장 많이 팔리는 베스트 상품</p>
                </div>
            </div>
            <div class="px-4 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="card h-100">
                        <div class="badge-rank position-absolute" style="top: -0.5rem; left: 1rem; background-color: gold;">1위</div>
                        <!-- Product image-->
                        <a class="btn" href="http://localhost:9090">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">더독 닥터소프트 <br>야채&식이섬유 1.2kg</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            12,000원
                        </div>
                    </div>
                    <div class="card h-100">
                        <div class="badge-rank position-absolute" style="top: -0.5rem; left: 1rem; background-color: silver;" >2위</div>
                        <!-- Product image-->
                        <a class="btn" href="http://localhost:9090">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            <span style="color: red;">35%</span>
                            <span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
                        </div>
                        <div class="text-center">
                            1,700원
                        </div>
                    </div>
                    <div class="card h-100">
                        <div class="badge-rank position-absolute" style="top: -0.5rem; left: 1rem; background-color: brown;">3위</div>
                        <!-- Product image-->
                        <a class="btn" href="http://localhost:9090">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body pt-4" style="padding-bottom: 0rem;">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">펫모닝 펫둥이 올바디 펫티슈 30매</h5>
                                </div>
                            </div>
                        </a>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <div class="text-center">
                            <span style="color: red;">35%</span>
                            <span class="text-muted text-decoration-line-through" style="font-size: smaller;">3,000원</span>
                        </div>
                        <div class="text-center">
                            1,700원
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="upBtn()">
            <i class="fas fa-arrow-alt-circle-up"></i>
        </aside>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="${contextPath}/resources/js/shop/slick/slick.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/js/shop/slick/main_slick.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/js/shop/main.js"></script>
        
    
    
    </body>
</html>