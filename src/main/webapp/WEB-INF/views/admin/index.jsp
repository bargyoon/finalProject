<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
   <%@ include file="/WEB-INF/views/admin/include/head.jsp"%>
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
   
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
       <%@ include file="/WEB-INF/views/admin/include/nav.jsp"%>
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Dashboard</h4>
                        
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
                <!-- Sales Cards  -->
                <!-- ============================================================== -->
              
                <!-- ============================================================== -->
                <!-- Sales chart -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">Site Analysis</h4>
                                        <h5 class="card-subtitle">Overview of Latest Month</h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- column -->
                                    <div class="col-lg-9">
                                        <div class="row">
                                            <canvas id="myChart" style="max-height: 400px;"></canvas>
                                          </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="bg-dark p-10 text-white text-center">
                                                   <i class="fa fa-user m-b-5 font-16"></i>
                                                   <h5 class="m-b-0 m-t-5">2540</h5>
                                                   <small class="font-light">íìì</small>
                                                </div>
                                            </div>
                                             <div class="col-6">
                                                <div class="bg-dark p-10 text-white text-center">
                                                   <i class="fa fa-plus m-b-5 font-16"></i>
                                                   <h5 class="m-b-0 m-t-5">120</h5>
                                                   <small class="font-light">ì ê·íì</small>
                                                </div>
                                            </div>
                                            <div class="col-6 m-t-15">
                                                <div class="bg-dark p-10 text-white text-center">
                                                   <i class="fa fa-cart-plus m-b-5 font-16"></i>
                                                   <h5 class="m-b-0 m-t-5">656</h5>
                                                   <small class="font-light">ë°©ë¬¸ìì</small>
                                                </div>
                                            </div>
                                             <div class="col-6 m-t-15">
                                                <div class="bg-dark p-10 text-white text-center">
                                                   <i class="fa fa-tag m-b-5 font-16"></i>
                                                   <h5 class="m-b-0 m-t-5">9540</h5>
                                                   <small class="font-light">ê²ìê¸ì</small>
                                                </div>
                                            </div>
                                            <div class="col-6 m-t-15">
                                                <div class="bg-dark p-10 text-white text-center">
                                                   <i class="fa fa-table m-b-5 font-16"></i>
                                                   <h5 class="m-b-0 m-t-5">100</h5>
                                                   <small class="font-light">ì ì²´ìíì</small>
                                                </div>
                                            </div>
                                            <div class="col-6 m-t-15">
                                                <div class="bg-dark p-10 text-white text-center">
                                                   <i class="fa fa-globe m-b-5 font-16"></i>
                                                   <h5 class="m-b-0 m-t-5">8540</h5>
                                                   <small class="font-light">ì£¼ë¬¸ì</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- column -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Sales chart -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title m-b-0">ì¼ìë³ ìì½</h5>
                            </div>
                            <table class="table">
                                  <thead>
                                    <tr class="text-center">
                                      <th scope="col">ì¼ì</th>
                                      <th scope="col">ì£¼ë¬¸ì</th>
                                      <th scope="col">ë§¤ì¶ì¡</th>
                                      <th scope="col">ë°©ë¬¸ì</th>
                                      <th scope="col">ê°ì</th>
                                      <th scope="col">ê¸ìì±</th>
                                      <th scope="col">ëê¸ìì±</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">2021-11-09</th>
                                      <td>Mark</td>
                                      <td>Otto</td>
                                      <td>@mdo</td>
                                      <td>Mark</td>
                                      <td>Otto</td>
                                      <td>@mdo</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">2</th>
                                      <td>Jacob</td>
                                      <td>Thornton</td>
                                      <td>@fat</td>
                                      <td>Mark</td>
                                      <td>Otto</td>
                                      <td>@mdo</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">3</th>
                                      <td>Larry</td>
                                      <td>the Bird</td>
                                      <td>@twitter</td>
                                      <td>Mark</td>
                                      <td>Otto</td>
                                      <td>@mdo</td>
                                    </tr>
                                  </tbody>
                            </table>
                        </div>
                      
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">상품문의</h4>
                            </div>
                            <div class="comment-widgets scrollable">
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row m-t-0">
                                   
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">James Anderson</h6>
                                        <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span>
                                        <div class="comment-footer">
                                            <span class="text-muted float-right">April 14, 2016</span> 
                                            <button type="button" class="btn btn-cyan btn-sm">Edit</button>
                                            <button type="button" class="btn btn-success btn-sm">Publish</button>
                                            <button type="button" class="btn btn-danger btn-sm">Delete</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><img src="assets/images/users/4.jpg" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text active w-100">
                                        <h6 class="font-medium">Michael Jorden</h6>
                                        <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span>
                                        <div class="comment-footer">
                                            <span class="text-muted float-right">May 10, 2016</span> 
                                            <button type="button" class="btn btn-cyan btn-sm">Edit</button>
                                            <button type="button" class="btn btn-success btn-sm">Publish</button>
                                            <button type="button" class="btn btn-danger btn-sm">Delete</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><img src="assets/images/users/5.jpg" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">Johnathan Doeting</h6>
                                        <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span>
                                        <div class="comment-footer">
                                            <span class="text-muted float-right">August 1, 2016</span> 
                                            <button type="button" class="btn btn-cyan btn-sm">Edit</button>
                                            <button type="button" class="btn btn-success btn-sm">Publish</button>
                                            <button type="button" class="btn btn-danger btn-sm">Delete</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- card new -->
                        
                    </div>
                    <!-- column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title m-b-0">최근 게시물</h4>
                            </div>
                            <ul class="list-style-none">
                                <li class="d-flex no-block card-body">
                                    <i class="fa fa-check-circle w-30px m-t-5"></i>
                                    <div>
                                        <a href="#" class="m-b-0 font-medium p-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a>
                                        <span class="text-muted">dolor sit amet, consectetur adipiscing</span>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0">20</h5>
                                            <span class="text-muted font-16">Jan</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex no-block card-body border-top">
                                    <i class="fa fa-gift w-30px m-t-5"></i>
                                    <div>
                                        <a href="#" class="m-b-0 font-medium p-0">Congratulation Maruti, Happy Birthday</a>
                                        <span class="text-muted">many many happy returns of the day</span>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0">11</h5>
                                            <span class="text-muted font-16">Jan</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex no-block card-body border-top">
                                    <i class="fa fa-plus w-30px m-t-5"></i>
                                    <div>
                                        <a href="#" class="m-b-0 font-medium p-0">Maruti is a Responsive Admin theme</a>
                                        <span class="text-muted">But already everything was solved. It will ...</span>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0">19</h5>
                                            <span class="text-muted font-16">Jan</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex no-block card-body border-top">
                                    <i class="fa fa-leaf w-30px m-t-5"></i>
                                    <div>
                                        <a href="#" class="m-b-0 font-medium p-0">Envato approved Maruti Admin template</a>
                                        <span class="text-muted">i am very happy to approved by TF</span>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0">20</h5>
                                            <span class="text-muted font-16">Jan</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="d-flex no-block card-body border-top">
                                    <i class="fa fa-question-circle w-30px m-t-5"></i>
                                    <div>
                                        <a href="#" class="m-b-0 font-medium p-0"> I am alwayse here if you have any question</a>
                                        <span class="text-muted">we glad that you choose our template</span>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0">15</h5>
                                            <span class="text-muted font-16">Jan</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
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
    >
    <!--Wave Effects -->
    <script src="/resources/js/admin/waves.js"></script>
    <!--Menu sidebar -->
    <script src="/resources/js/admin/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="/resources/js/admin/custom.min.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
    <!-- Charts js Files -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        
        const labels = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
];
const data = {
  labels: labels,
  datasets: [
      {
    label: 'ë°©ë¬¸ì',
    backgroundColor: 'rgba(255, 99, 132, 0.2)',
    borderColor: 'rgb(255, 99, 132)',
    data: [0, 10, 5, 2, 20, 30, 45],
  },
  {
    label: 'ë°©ë¬¸ì',
    backgroundColor: 'rgba(255, 159, 64, 0.2)',
    borderColor: 'rgb(255, 159, 64)',
    data: [0, 10, 5, 2, 20, 30, 45],
  },
  {
    label: 'ë°©ë¬¸ì',
    backgroundColor: 'rgba(255, 205, 86, 0.2)',
    borderColor: 'rgb(255, 205, 86)',
    data: [0, 10, 5, 2, 20, 30, 45],
  },
  {
    label: 'ë°©ë¬¸ì',
    backgroundColor: 'rgba(75, 192, 192, 0.2)',
    borderColor: 'rgb(75, 192, 192)',
    data: [0, 10, 5, 2, 20, 30, 45],
  },
  {
    label: 'ë°©ë¬¸ì',
    backgroundColor: 'rgba(54, 162, 235, 0.2)',
    borderColor: 'rgb(54, 162, 235)',
    data: [0, 10, 5, 2, 20, 30, 45],
  }
]
};
        const config = {
  type: 'bar',
  data: data,
  options: {
      responsive: true
     
      
  }
};
const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );

    </script>

</body>

</html>