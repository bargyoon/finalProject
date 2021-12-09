<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<body>
   <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                   
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                            class="ti-menu ti-close"></i></a>
                   
                    <a class="navbar-brand" href="/admin/member/member-list">
                      
                        <span class="logo-text" alt="homepage">
                            똑DOG한 집사들 Admin

                        </span>
                        
                    </a>
                    
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)"
                        data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
                            class="ti-more"></i></a>
                </div>
               
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                   
                    <div class="navbar-nav float-left mr-auto">
                        <div class="nav-item d-none d-md-block"><a
                                class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)"
                                data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></div>

                    </div>
                   
                   
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30">
                       
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark"
                                href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span
                                    class="hide-menu">사용자 관리</span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="/admin/member/member-list" class="sidebar-link"><i
                                            class="mdi mdi-note-outline"></i><span class="hide-menu"> 사용자 목록 </span></a>
                                </li>
                               
                            </ul>
                        </li>
                      
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark"
                                href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span
                                    class="hide-menu">병명 관리</span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="/admin/disease/disease-list" class="sidebar-link"><i
                                            class="mdi mdi-note-outline"></i><span class="hide-menu">병명 목록 </span></a>
                                </li>
                                <li class="sidebar-item"><a href="/admin/disease/price-img-list" class="sidebar-link"><i
                                            class="mdi mdi-note-outline"></i><span class="hide-menu">사용자 등록 사진 목록 </span></a>
                                </li>
                               
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark"
                                href="javascript:void(0)" aria-expanded="false"><i
                                    class="mdi mdi-chart-bubble"></i><span class="hide-menu">쇼핑</span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="/admin/shopping/item-list" class="sidebar-link"><i
                                            class="mdi mdi-note-outline"></i><span class="hide-menu">상품관리 </span></a>
                                </li>
                                <li class="sidebar-item"><a href="/admin/shopping/order-list" class="sidebar-link"><i
                                            class="mdi mdi-note-plus"></i><span class="hide-menu">주문관리</span></a></li>
                                            <li class="sidebar-item"><a href="/admin/shopping/item-comment" class="sidebar-link"><i
                                                class="mdi mdi-note-plus"></i><span class="hide-menu">상품후기</span></a></li>
                                                <li class="sidebar-item"><a href="/admin/shopping/QnA" class="sidebar-link"><i
                                                    class="mdi mdi-note-plus"></i><span class="hide-menu">문의사항</span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark"
                                href="javascript:void(0)" aria-expanded="false"><i
                                    class="mdi mdi-border-inside"></i><span class="hide-menu">컨텐츠 관리</span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="/admin/contents/board-list" class="sidebar-link"><i
                                            class="mdi mdi-note-outline"></i><span class="hide-menu"> 게시물 관리 </span></a>
                                </li>
                                <li class="sidebar-item"><a href="/admin/contents/comment-list" class="sidebar-link"><i
                                            class="mdi mdi-note-plus"></i><span class="hide-menu"> 댓글관리 </span></a></li>
                            </ul>
                        </li>
                        

                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
</body>
</html>