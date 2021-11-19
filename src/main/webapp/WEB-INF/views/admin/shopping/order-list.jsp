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
    <style>
        .table tbody tr td,
        th {
            border-right: 1px solid #dee2e6;
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
                        <h4 class="page-title">주문관리</h4>
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="card" style="background-color: transparent; ">
                            <div class="row">
                                <div class="ml-3">
                                    <div class=" text-center m-10">
                                        <h4><a style="border-bottom: 2px solid blue;">전체<span> 3</span></a></h4>
                                    </div>
                                </div>
                                <div class="ml-3">
                                    <div class=" text-center m-10">
                                        <h4><a>신규주문 <span>1</span></a></h4>
                                    </div>
                                </div>
                                <div class="ml-3">
                                    <div class=" text-center m-10">
                                        <h4><a>배송중 <span>1</span></a></h4>
                                    </div>
                                </div>
                                <div class="ml-3">
                                    <div class=" text-center m-10">
                                        <h4><a>배송완료 <span>0</span></a></h4>
                                    </div>
                                </div>
                                <div class="ml-3">
                                    <div class=" text-center m-10">
                                        <h4><a>반품대기중 <span>1</span></a></h4>
                                    </div>
                                </div>
                                <div class="ml-3">
                                    <div class=" text-center m-10">
                                        <h4><a>반품완료 <span>0</span></a></h4>
                                    </div>
                                </div>
                                <div class="ml-3">
                                    <div class=" text-center m-10">
                                        <h4><a>취소대기중 <span>0</span></a></h4>
                                    </div>
                                </div>
                                <div class="ml-3">
                                    <div class=" text-center m-10">
                                        <h4><a>취소완료 <span>0</span></a></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                            <div class="card-body">
                                <h5 class="card-title m-b-0 d-inline-block">상품목록</h5>

                            </div>

                            <div class="table-responsive">
                               
                                    <table class="table mb-0">
                                        <thead class="thead-dark">
                                            <tr>

                                                <th scope="col"  style="width: 12%;">주문번호/시각</th>
                                                <th scope="col" class="text-center" style="width: 20%;">주문상품</th>
                                                <th scope="col" class="text-right" style="width: 8%;">상품금액</th>
                                                <th scope="col" class="text-center" style="width: 5%;">수량</th>
                                                <th scope="col" class="text-center" style="width: 15%;">운송장번호</th>
                                                <th scope="col" class="text-center" style="width: 15%;">배송정보</th>
                                                <th scope="col" class="text-center" style="width: 15%;">결제내역</th>
                                                <th scope="col" class="text-center" style="width: 10%;">상태</th>
                                            </tr>
                                        </thead>
                                        <tbody class="customtable">
                                            <tr>

                                                <td rowspan="2">
                                                    <div><span style="color: black;">주문번호</span></div>
                                                    <div style="font-size: 10pt; color: gray;">
                                                        주문시각
                                                    </div>
                                                    <p style="margin-top: 10px;">주문한사람</p>
                                                </td>
                                                <td>
                                                    <a><img
                                                            src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>
                                                    <div class="d-inline-block">
                                                        <div style="font-size: 10pt; color: gray;">주문번호</div>
                                                        <div><a href="#">화장품</a></div>
                                                    </div>
                                                </td>
                                                <td class="text-right  ">10000원</td>
                                                <td class="text-center">4</td>
                                                <td rowspan="2">
                                                    <div>
                                                        <div>
                                                            <select>
                                                                <option value="" selected="">택배사 선택</option>
                                                                <option value="CJ">CJ대한통운</option>
                                                                <option value="EPOST">우체국택배</option>
                                                                <option value="REGISTPOST">우편등기</option>
                                                                <option value="HANJIN">한진택배</option>
                                                                <option value="LOGEN">로젠택배</option>
                                                                <option value="GTX">GTX로지스</option>
                                                                <option value="LOTTE">롯데택배</option>
                                                                <option value="DS">대신택배</option>
                                                                <option value="IY">일양로지스</option>
                                                                <option value="KD">경동택배</option>
                                                                <option value="NHLOGIS">농협택배</option>
                                                                <option value="SEBANG">세방택배</option>
                                                                <option value="CI">천일택배</option>
                                                                <option value="CVS">CVSnet 편의점택배</option>
                                                                <option value="HD">합동택배</option>
                                                                <option value="EMS">EMS</option>
                                                                <option value="kpacket">K-Packet</option>
                                                                <option value="DHL">DHL</option>
                                                                <option value="FEDEX">Fedex</option>
                                                                <option value="GSMN">GSMNtoN</option>
                                                                <option value="UPS">UPS</option>
                                                                <option value="TNT">TNT Express</option>
                                                                <option value="USPS">USPS</option>
                                                                <option value="AIRBOY">에어보이익스프레스</option>
                                                                <option value="DHLMAIL">DHL Global Mail</option>
                                                                <option value="IPARCEL">i-Parcel</option>
                                                                <option value="HANWISA">한의사랑택배</option>
                                                                <option value="HANWISA">한의사랑택배</option>
                                                                <option value="GUNYOUNG">건영택배</option>
                                                                <option value="BUMHAN">범한판토스</option>
                                                                <option value="APEX">APEX</option>
                                                                <option value="ECMSExpress">ECMSExpress</option>
                                                                <option value="GOODTOLUCK">굿투럭</option>
                                                                <option value="DHLGER">DHL 독일</option>
                                                                <option value="ACI">ACI</option>
                                                                <option value="LOTTEGLOBAL">롯데택배(국제택배)</option>
                                                                <option value="CJGLOBAL">CJ대한통운(국제택배)</option>
                                                                <option value="SUNGWON">성원글로벌</option>
                                                                <option value="DAEWOON">대운글로벌</option>
                                                                <option value="SLX">SLX택배</option>
                                                                <option value="HONAM">호남택배</option>
                                                                <option value="GSIEXPRESS">GSI익스프레스</option>
                                                                <option value="KGBPS">KGB 택배</option>
                                                                <option value="CUPARCEL">CU편의점택배</option>
                                                                <option value="VROONG">부릉</option>
                                                                <option value="todaypickup">오늘의 픽업</option>
                                                                <option value="CHAINLOGIS">두발히어로</option>
                                                                <option value="HOMEPICK">홈픽택배</option>
                                                                <option value="QXPRESS">큐익스프레스</option>
                                                                <option value="LINEEXP">라인익스프레스</option>
                                                                <option value="GPSLOGIX">GPS LOGIX</option>
                                                                <option value="CRLX">시알로지텍</option>
                                                                <option value="BRIDGE">브릿지로지스</option>
                                                                <option value="EFS">EFS</option>
                                                                <option value="FRESH">프레시솔루션</option>
                                                                <option value="FRESHMATES">프레시메이트</option>
                                                                <option value="GTSLOGIS">GTS로지스</option>
                                                                <option value="GENIEGO">지니고</option>
                                                                <option value="PINGPONG">핑퐁</option>
                                                                <option value="ETC">기타택배</option>
                                                            </select>
                                                        </div>
                                                        <div>
                                                            <input type="text"
                                                                placeholder="송장번호" value="">
                                                           
                                                        </div>
                                                      
                                                    </div>
                                                </td>



                                                <td rowspan="2">
                                                    <div class="mb-2">
                                                        <strong>주문자</strong>/<span>전화번호</span>
                                                        <div class="mb-1" style="font-size: 10pt; color:gray">
                                                            주소주소주소주소<br>
                                                            <div>우편번호</div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td rowspan="2">
                                                    <div>
                                                        <div style="display: table; width: 100%; margin-bottom: 7px;">
                                                            <div style="display: table-row-group; ">
                                                                <div class='d-table-cell'>총 결제금액</div>
                                                                <div class='d-table-cell text-right'>20000원</div>
                                                            </div>
                                                        </div>
                                                        <div style="display: table; width: 100%; color: gray;">
                                                            <div style="display: table-row-group;">
                                                                <div class='d-table-cell'>소계</div>
                                                                <div class='d-table-cell text-right'>25000원</div>
                                                            </div>
                                                            <div style="display: table-row-group;">
                                                                <div class='d-table-cell'>상품 할인금액</div>
                                                                <div class='d-table-cell text-right'>5000원</div>
                                                            </div>
                                                        </div>
                                                        <div style="display: table; width: 100%; color: gray;">
                                                            <div style="display: table-row-group;">
                                                                <div class='d-table-cell'>결제방법</div>
                                                                <div class='d-table-cell text-right'>무통장입금<br>신한은행</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td rowspan="2" class="nav-item text-center dropdown" href=""
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <span>반품중</span><i class="m-r-10 mdi mdi-chevron-down ml-2"> </i>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </td>

                                            </tr>
                                            <tr>

                                                <td>
                                                    <a><img
                                                            src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>
                                                    <div class="d-inline-block">
                                                        <div style="font-size: 10pt; color: gray;">주문번호</div>
                                                        <div><a href="#">화장품</a></div>
                                                    </div>
                                                </td>
                                                <td class="text-right  ">10000원</td>
                                                <td class="text-center">4</td>


                                            </tr>
                                            <tr>

                                                <td>
                                                    <div><span style="color: black;">주문번호</span></div>
                                                    <div style="font-size: 10pt; color: gray;">
                                                        주문시각
                                                    </div>
                                                    <p style="margin-top: 10px;">주문한사람</p>
                                                </td>
                                                <td>
                                                    <a><img
                                                            src="https://cdn.imweb.me/thumbnail/20180305/5a9cea9e49044.png"></a>
                                                    <div class="d-inline-block">
                                                        <div style="font-size: 10pt; color: gray;">주문번호</div>
                                                        <div><a href="#">화장품</a></div>
                                                    </div>
                                                </td>
                                                <td class="text-right  ">10000원</td>
                                                <td class="text-center">4</td>
                                                <td>
                                                    <div>
                                                        <div>
                                                            <select>
                                                                <option value="" selected="">택배사 선택</option>
                                                                <option value="CJ">CJ대한통운</option>
                                                                <option value="EPOST">우체국택배</option>
                                                                <option value="REGISTPOST">우편등기</option>
                                                                <option value="HANJIN">한진택배</option>
                                                                <option value="LOGEN">로젠택배</option>
                                                                <option value="GTX">GTX로지스</option>
                                                                <option value="LOTTE">롯데택배</option>
                                                                <option value="DS">대신택배</option>
                                                                <option value="IY">일양로지스</option>
                                                                <option value="KD">경동택배</option>
                                                                <option value="NHLOGIS">농협택배</option>
                                                                <option value="SEBANG">세방택배</option>
                                                                <option value="CI">천일택배</option>
                                                                <option value="CVS">CVSnet 편의점택배</option>
                                                                <option value="HD">합동택배</option>
                                                                <option value="EMS">EMS</option>
                                                                <option value="kpacket">K-Packet</option>
                                                                <option value="DHL">DHL</option>
                                                                <option value="FEDEX">Fedex</option>
                                                                <option value="GSMN">GSMNtoN</option>
                                                                <option value="UPS">UPS</option>
                                                                <option value="TNT">TNT Express</option>
                                                                <option value="USPS">USPS</option>
                                                                <option value="AIRBOY">에어보이익스프레스</option>
                                                                <option value="DHLMAIL">DHL Global Mail</option>
                                                                <option value="IPARCEL">i-Parcel</option>
                                                                <option value="HANWISA">한의사랑택배</option>
                                                                <option value="GUNYOUNG">건영택배</option>
                                                                <option value="BUMHAN">범한판토스</option>
                                                                <option value="APEX">APEX</option>
                                                                <option value="ECMSExpress">ECMSExpress</option>
                                                                <option value="GOODTOLUCK">굿투럭</option>
                                                                <option value="DHLGER">DHL 독일</option>
                                                                <option value="ACI">ACI</option>
                                                                <option value="LOTTEGLOBAL">롯데택배(국제택배)</option>
                                                                <option value="CJGLOBAL">CJ대한통운(국제택배)</option>
                                                                <option value="SUNGWON">성원글로벌</option>
                                                                <option value="DAEWOON">대운글로벌</option>
                                                                <option value="SLX">SLX택배</option>
                                                                <option value="HONAM">호남택배</option>
                                                                <option value="GSIEXPRESS">GSI익스프레스</option>
                                                                <option value="KGBPS">KGB 택배</option>
                                                                <option value="CUPARCEL">CU편의점택배</option>
                                                                <option value="VROONG">부릉</option>
                                                                <option value="todaypickup">오늘의 픽업</option>
                                                                <option value="CHAINLOGIS">두발히어로</option>
                                                                <option value="HOMEPICK">홈픽택배</option>
                                                                <option value="QXPRESS">큐익스프레스</option>
                                                                <option value="LINEEXP">라인익스프레스</option>
                                                                <option value="GPSLOGIX">GPS LOGIX</option>
                                                                <option value="CRLX">시알로지텍</option>
                                                                <option value="BRIDGE">브릿지로지스</option>
                                                                <option value="EFS">EFS</option>
                                                                <option value="FRESH">프레시솔루션</option>
                                                                <option value="FRESHMATES">프레시메이트</option>
                                                                <option value="GTSLOGIS">GTS로지스</option>
                                                                <option value="GENIEGO">지니고</option>
                                                                <option value="PINGPONG">핑퐁</option>
                                                                <option value="ETC">기타택배</option>
                                                            </select>
                                                        </div>
                                                        <div>
                                                            <input type="text"
                                                                placeholder="송장번호" value="">
                                                           
                                                        </div>
                                                      
                                                    </div>
                                                </td>

                                                <td>
                                                    <div class="mb-2">
                                                        <strong>주문자</strong>/<span>전화번호</span>
                                                        <div class="mb-1" style="font-size: 10pt; color:gray">
                                                            주소주소주소주소<br>
                                                            <div>우편번호</div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <div style="display: table; width: 100%; margin-bottom: 7px;">
                                                            <div style="display: table-row-group; ">
                                                                <div class='d-table-cell'>총 결제금액</div>
                                                                <div class='d-table-cell text-right'>20000원</div>
                                                            </div>
                                                        </div>
                                                        <div style="display: table; width: 100%; color: gray;">
                                                            <div style="display: table-row-group;">
                                                                <div class='d-table-cell'>소계</div>
                                                                <div class='d-table-cell text-right'>25000원</div>
                                                            </div>
                                                            <div style="display: table-row-group;">
                                                                <div class='d-table-cell'>상품 할인금액</div>
                                                                <div class='d-table-cell text-right'>5000원</div>
                                                            </div>
                                                        </div>
                                                        <div style="display: table; width: 100%; color: gray;">
                                                            <div style="display: table-row-group;">
                                                                <div class='d-table-cell'>결제방법</div>
                                                                <div class='d-table-cell text-right'>무통장입금<br>신한은행</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="nav-item text-center dropdown" href="" data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false">
                                                    <span>반품중</span><i class="m-r-10 mdi mdi-chevron-down ml-2"> </i>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                   
                               
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