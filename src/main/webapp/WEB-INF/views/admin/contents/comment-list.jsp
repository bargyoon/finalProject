<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <!-- ============================================================== -->
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
                        <h4 class="page-title">Tables</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">사용자 리스트</li>
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
                                        <label for="postSearch"><i style="position: absolute; top: 28px;"
                                                class="fas fa-search"></i></label>
                                        <label><a><i style="position: absolute; top: 28px; right: 26%; z-index: 999;"
                                                    class="fas fa-times"></i></a></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control ml-3" placeholder="작성자 내용 검색"
                                                name="keyword">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="row">

                    <div class="col-12">

                        <div class="card">
                            <div class="card-header">
                                <header class="small">
                                    전체 댓글 <span class="text-primary">3</span>
                                </header>
                            </div>
                            <div class="comment-widgets scrollable ps-container ps-theme-default"
                                data-ps-id="4d3d0b7d-4667-4dfb-6173-498416fca048">
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><label><input type="checkbox"></label></div>
                                    <div class="comment-text active w-100">
                                        <h6 class="font-medium"><a class="text-primary">관리자</a>
                                            <small><a>게시판 종류</a></small>
                                        </h6>
                                        <div  class="nav-item dropdown"  href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right;margin-top: -20px">
                                          
                                                <i class="m-r-10 mdi mdi-menu "> </i>
                                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                        </div>
                                       
                                        <span class="m-b-15 d-block">댓글 내용</span>
                                       
                                        
                                    </div>
                                </div>
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><label><input type="checkbox"></label></div>
                                    <div class="comment-text active w-100">
                                        <h6 class="font-medium"><a class="text-primary">관리자</a>
                                            <small><a>게시판 종류</a></small>
                                        </h6>
                                        <div  class="nav-item dropdown"  href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right;margin-top: -20px">
                                          
                                                <i class="m-r-10 mdi mdi-menu "> </i>
                                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                        </div>
                                        <blockquote ><p><span class="_delete_c20211114d4744b20ab346" style="font-size:13px;"> : 원래 게시물 - 관리자</span></p></blockquote>
                                        <span class="m-b-15 d-block">댓글 내용</span>
                                       
                                        
                                    </div>
                                </div>
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><label><input type="checkbox"></label></div>
                                    <div class="comment-text active w-100">
                                        <h6 class="font-medium"><a class="text-primary">관리자</a>
                                            <small><a>게시판 종류</a></small>
                                        </h6>
                                        <div  class="nav-item dropdown"  href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right;margin-top: -20px">
                                          
                                                <i class="m-r-10 mdi mdi-menu "> </i>
                                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                        </div>
                                        <blockquote ><p><span class="_delete_c20211114d4744b20ab346" style="font-size:13px;"> : 원래 게시물 - 관리자</span></p></blockquote>
                                        <span class="m-b-15 d-block">댓글 내용</span>
                                       
                                        
                                    </div>
                                </div>
                                <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
                                    <div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                </div>
                                <div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;">
                                    <div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                                </div>
                            </div>
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