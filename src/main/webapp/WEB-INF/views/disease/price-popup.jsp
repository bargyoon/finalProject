<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="/resources/css/admin/style.min.css" rel="stylesheet">
</head>
<body>
<div class="col-md-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5 class="card-title m-b-0 d-inline-block">진료비 영수증 등록</h5>
                                                        <small>사진을 등록하시면 평균 금액에 반영됩니다.</small>


                                                        <span class="btn btn-flat btn-primary float-right" id="reset-img" onclick="window.close()">사진등록</span>


                                                    </div>
                                                    <div id="prod_image_dropzone2" style="height: calc(100% - 50px);">
                                                        <div class="card-body">
                                                            <div class="drop-zone drop-img">
                                                                <span class="drop-zone__prompt">이미지를 드래그 하거나 클릭해서 추가하세요</span>
                                                            <input type="file" name="myFile" class="drop-zone__input img-1" multiple>
                                                            </div>
                                                            <div id="prod_image_list" class="ui-sortable"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div></div>
   <script src="/resources/js/admin/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/resources/js/admin/popper.min.js"></script>
    <script src="/resources/js/admin/bootstrap.min.js"></script>                                 
<script src="/resources/js/price/drag-drop.js"></script>
</body>
</html>