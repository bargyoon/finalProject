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
                                        <label for="postSearch"><i style="position: absolute; top: 28px;" class="fas fa-search"></i></label>
                                        <label><a><i style="position: absolute; top: 28px; right: 26%; z-index: 999;"class="fas fa-times"></i></a></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control ml-3" placeholder="작성자 내용 검색" name="keyword">
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
                                <h5 class="card-title m-b-0">게시글 관리</h5>
                            </div>
                            <div class="col-md-9" data-select2-id="11">
                                <select  style="width: 100%; height:36px;" aria-hidden="true" onchange="location.href=this.value">
                                    <option data-select2-id="3">Select</option>
                                    <optgroup label="Alaskan/Hawaiian Time Zone" data-select2-id="16">
                                        <option value="AK" data-select2-id="17">Alaska</option>
                                        <option value="HI" data-select2-id="18">Hawaii</option>
                                    </optgroup>
                                    <optgroup label="Pacific Time Zone" data-select2-id="19">
                                        <option value="CA" data-select2-id="20">California</option>
                                        <option value="NV" data-select2-id="21">Nevada</option>
                                        <option value="OR" data-select2-id="22">Oregon</option>
                                        <option value="WA" data-select2-id="23">Washington</option>
                                    </optgroup>
                                    <optgroup label="Mountain Time Zone" data-select2-id="24">
                                        <option value="AZ" data-select2-id="25">Arizona</option>
                                        <option value="CO" data-select2-id="26">Colorado</option>
                                        <option value="ID" data-select2-id="27">Idaho</option>
                                        <option value="MT" data-select2-id="28">Montana</option>
                                        <option value="NE" data-select2-id="29">Nebraska</option>
                                        <option value="NM" data-select2-id="30">New Mexico</option>
                                        <option value="ND" data-select2-id="31">North Dakota</option>
                                        <option value="UT" data-select2-id="32">Utah</option>
                                        <option value="WY" data-select2-id="33">Wyoming</option>
                                    </optgroup>
                                    <optgroup label="Central Time Zone" data-select2-id="34">
                                        <option value="AL" data-select2-id="35">Alabama</option>
                                        <option value="AR" data-select2-id="36">Arkansas</option>
                                        <option value="IL" data-select2-id="37">Illinois</option>
                                        <option value="IA" data-select2-id="38">Iowa</option>
                                        <option value="KS" data-select2-id="39">Kansas</option>
                                        <option value="KY" data-select2-id="40">Kentucky</option>
                                        <option value="LA" data-select2-id="41">Louisiana</option>
                                        <option value="MN" data-select2-id="42">Minnesota</option>
                                        <option value="MS" data-select2-id="43">Mississippi</option>
                                        <option value="MO" data-select2-id="44">Missouri</option>
                                        <option value="OK" data-select2-id="45">Oklahoma</option>
                                        <option value="SD" data-select2-id="46">South Dakota</option>
                                        <option value="TX" data-select2-id="47">Texas</option>
                                        <option value="TN" data-select2-id="48">Tennessee</option>
                                        <option value="WI" data-select2-id="49">Wisconsin</option>
                                    </optgroup>
                                    <optgroup label="Eastern Time Zone" data-select2-id="50">
                                        <option value="CT" data-select2-id="51">Connecticut</option>
                                        <option value="DE" data-select2-id="52">Delaware</option>
                                        <option value="FL" data-select2-id="53">Florida</option>
                                        <option value="GA" data-select2-id="54">Georgia</option>
                                        <option value="IN" data-select2-id="55">Indiana</option>
                                        <option value="ME" data-select2-id="56">Maine</option>
                                        <option value="MD" data-select2-id="57">Maryland</option>
                                        <option value="MA" data-select2-id="58">Massachusetts</option>
                                        <option value="MI" data-select2-id="59">Michigan</option>
                                        <option value="NH" data-select2-id="60">New Hampshire</option>
                                        <option value="NJ" data-select2-id="61">New Jersey</option>
                                        <option value="NY" data-select2-id="62">New York</option>
                                        <option value="NC" data-select2-id="63">North Carolina</option>
                                        <option value="OH" data-select2-id="64">Ohio</option>
                                        <option value="PA" data-select2-id="65">Pennsylvania</option>
                                        <option value="RI" data-select2-id="66">Rhode Island</option>
                                        <option value="SC" data-select2-id="67">South Carolina</option>
                                        <option value="VT" data-select2-id="68">Vermont</option>
                                        <option value="VA" data-select2-id="69">Virginia</option>
                                        <option value="WV" data-select2-id="70">West Virginia</option>
                                    </optgroup>
                                </select>
                            </div>
                            <br>
                                <div class="table-responsive">
                                    <form method="post">
                                    <table class="table mb-0">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>
                                                  
                                                        <input type="checkbox" id="mainCheckbox" />
                                                    
                                                </th>
                                                <th scope="col">제목</th>
                                                <th scope="col">작성자</th>
                                                <th scope="col">위치</th>
                                                <th scope="col">작성일</th>
                                                <th scope="col">좋아요 수</th>
                                                <th scope="col">조회 수</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody class="customtable">
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 4.0</td>
                                                <td>Win 95+</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td class="nav-item dropdown"  href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="m-r-10 mdi mdi-menu "> </i>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" id="check" value="뭐야"  />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 5.0</td>
                                                <td>Win 95+</td>
                                                <td>5</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td class="nav-item dropdown"  href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="m-r-10 mdi mdi-menu "> </i>
                                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 4.0</td>
                                                <td>Win 95+</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td class="nav-item dropdown"  href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="m-r-10 mdi mdi-menu "> </i>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 5.0</td>
                                                <td>Win 95+</td>
                                                <td>5</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td class="nav-item dropdown"  href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="m-r-10 mdi mdi-menu "> </i>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 5.5</td>
                                                <td>Win 95+</td>
                                                <td>5.5</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td class="nav-item dropdown"  href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="m-r-10 mdi mdi-menu "> </i>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 6</td>
                                                <td>Win 98+</td>
                                                <td>6</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td class="nav-item dropdown"  href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="m-r-10 mdi mdi-menu "> </i>
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
                                   <div class="border-top">
                                        <div class="card-body">
                                    <button class="btn-secondary " >submit</button>
                                </div></div>
                                </form>
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
                All Rights Reserved by Matrix-admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
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