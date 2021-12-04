<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Matrix Template - The Ultimate Multipurpose admin template</title>

    <!-- Custom CSS -->
    <link href="/resources/css/admin/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="/resources/css/admin/style.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <style>
        .d-table-cell input {
            vertical-align: middle;
        }

       
    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->

    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <%@ include file="/WEB-INF/views/admin/include/nav.jsp"%>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">구매평관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">구매평관리</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">

                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body no-padding">
                                <form>
                                    <div class="form-group row">

                                        <div class="col-sm-9">
                                            <div>
                                                <div style="display: table; width: 100%; margin-bottom: 5px;">
                                                    <div style="display: table-row-group; ">
                                                        <div class='d-table-cell' style="width: 15%;">별점</div>
                                                        <div class='d-table-cell '>
                                                            <input type="radio" name="grade" checked><label
                                                                class="ml-2 mr-2">전체</label>
                                                            <input type="radio" name="grade"><label
                                                                class="ml-2 mr-2">1점</label>
                                                            <input type="radio" name="grade"><label
                                                                class="ml-2 mr-2">2점</label>
                                                            <input type="radio" name="grade"><label
                                                                class="ml-2 mr-2">3점</label>
                                                            <input type="radio" name="grade"><label
                                                                class="ml-2 mr-2">4점</label>
                                                            <input type="radio" name="grade"><label
                                                                class="ml-2">5점</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; margin-bottom: 5px;">
                                                    <div style="display: table-row-group; ">
                                                        <div class='d-table-cell' style="width: 15%;">구매평 유형</div>
                                                        <div class='d-table-cell '>
                                                            <input type="radio" name="comment-type" checked><label
                                                                class="ml-2 mr-2">전체</label>
                                                            <input type="radio" name="comment-type"><label
                                                                class="ml-2 mr-2">일반구매평</label>
                                                            <input type="radio" name="comment-type"><label
                                                                class="ml-2 mr-2">포토구매평</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; margin-bottom: 5px;">
                                                    <div style="display: table-row-group; ">
                                                        <div class='d-table-cell' style="width: 15%;">승인 종류</div>
                                                        <div class='d-table-cell '>
                                                            <input type="radio" name="allow-type" checked><label
                                                                class="ml-2 mr-2">전체</label>
                                                            <input type="radio" name="allow-type"><label
                                                                class="ml-2 mr-2">승인대기중</label>
                                                            <input type="radio" name="allow-type"><label
                                                                class="ml-2 mr-2">승인</label>
                                                            <input type="radio" name="allow-type"><label
                                                                class="ml-2 mr-2">승인거절</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="display: table; width: 100%; margin-bottom: 5px;">
                                                    <div style="display: table-row-group; ">
                                                        <div class='d-table-cell' style="width: 15%;">키워드 검색</div>
                                                        <div class='d-table-cell '>
                                                            <input type="text" class="form-control" style="width:50%"
                                                                placeholder="작성자 내용 검색" name="keyword">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="border-top">
                                                <div class="card-body">
                                                    <button class="btn-secondary float-right ml-2">검색</button>
                                                    <button class="btn-primary float-right">초기화</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="row">

                    <div class="col-12">
                        <div class="card-head ">
                            <header class=" comments-header ml-3">
                                <div>
                                    <label class="no-margin">
                                        <input type="checkbox" class="all-check" style="vertical-align: middle;">
                                        <span class="ml-2">구매평 <span class="text-primary"
                                                id="review_total_count">3</span></span>
                                    </label>
                                </div>
                            </header>


                        </div>
                        <div class="card" id="review_list">
                            <div class="card-body no-padding ">
                                <div style="">
                                <div class="card" style="display: table; border-collapse: collapse; width: 100%;">
                                    <c:forEach items="${orderList}" var="orderList">
                                    <div class="border-bottom" style="display: table-row-group; padding: 20px 30px 20px 0;">
                                            <div class="d-table-cell pt-3" style="width: 2%; vertical-align: top;">
                                                <label><input type="checkbox"></label>
                                            </div>
                                            <div class="d-table-cell" style="vertical-align: top; width: 20%;">
                                                <div><a href="#">${orderList.NAME }</a></div>
                                                <div class="d-inline-block">
                                                    <div class="d-flex small text-warning justify-content-center">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </div>
                                                </div>
                                                <span class="d-inline-block">${orderList.USER_NAME}</span>
                                                <div class="d-inline-block">
                                                   

                                                </div>
                                                <span class="d-inline-block ml-2" style="color: gray;"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
																		value="${orderList.REG_DATE}" /></span>
                                                <div class="pt-2" style="cursor: pointer;" onclick="">${orderList.RV_CONTENT}</div>
                                                <div class="pt-2 pb-3" style="cursor: pointer;" onclick="">추천수 ${orderList.RECOMMAND}</div>
                                            </div>
                                            <div class="d-table-cell board_thumb_wrap"
                                                style="padding: 10px; cursor:pointer; "
                                                onclick="">
                                                <c:if test="${orderList.TYPE== 1 }">
                                                <div>
                                                    <img src="${orderList.downloadURL }"
                                                        class="board_thumb">
                                                        <img src="${orderList.downloadURL }"
                                                        class="board_thumb">
                                                </div>
                                                </c:if>
                                            </div>
                                            
                                            <div class="d-table-cell text-right" style="vertical-align: middle;">
                                                <div class="nav-item text-center dropdown" href=""
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="m-r-10 mdi mdi-menu ml-2"> </i>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                        
                                        <div class="border-bottom" style="display: table-row-group; padding: 20px 30px 20px 0;">
                                            <div class="d-table-cell pt-3" style="width: 2%; vertical-align: top;">
                                                <label><input type="checkbox"></label>
                                            </div>
                                            <div class="d-table-cell pt-3" style="vertical-align: top; width: 20%;">
                                                <div><a href="#">상품이름</a></div>
                                                <div class="d-inline-block">
                                                    <div class="d-flex small text-warning justify-content-center">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </div>
                                                </div>
                                                <span class="d-inline-block">작성자</span>
                                                <div class="d-inline-block">
                                                    <span class="badge badge-danger">N</span>
                                                    <span class="badge badge-info">BEST</span>

                                                </div>
                                                <span class="d-inline-block ml-2" style="color: gray;">날짜</span>
                                                <div class="pt-2" style="cursor: pointer;" onclick="">구매평</div>
                                                <div class="pt-2 pb-3" style="cursor: pointer;" onclick="">댓글 1</div>
                                            </div>
                                            <div class="d-table-cell board_thumb_wrap"
                                                style="padding: 10px; cursor:default;  "
                                                onclick="">
                                                <div style="display: none;">
                                                    <img src="https://cdn.imweb.me/thumbnail/20211117/2fe09638f49bd.png"
                                                        class="board_thumb">
                                                        <img src="https://cdn.imweb.me/thumbnail/20211117/2fe09638f49bd.png"
                                                        class="board_thumb">
                                                </div>
                                            </div>
                                            
                                            <div class="d-table-cell text-right" style="vertical-align: middle;">
                                                <div class="nav-item text-center dropdown" href=""
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="m-r-10 mdi mdi-menu ml-2"> </i>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                     
                                    </div>
                                 
                                        
                                        
                                        
                                     
                                    
                                </div>
                            </div>
                            <nav class="text-center">
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>

            <footer class="footer text-center">
                All Rights Reserved by Matrix-admin. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="/resources/js/admin/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/resources/js/admin/popper.min.js"></script>
    <script src="/resources/js/admin/bootstrap.min.js"></script>
    <script src="/resources/js/admin/perfect-scrollbar.jquery.min.js"></script>
    <script src="/resources/js/admin/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="/resources/js/admin/waves.js"></script>
    <!--Menu sidebar -->
    <script src="/resources/js/admin/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="/resources/js/admin/custom.min.js"></script>
    <!--This page JavaScript -->

    <script src="/resources/js/admin/datatables.min.js"></script>


</body>

</html>