<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <%@ include file="../../common/meta-info.jsp" %>
    <title>eCommerce Website - Admin</title>
    <%@ include file="../../common/link-css.jsp" %>
</head>

<body>
<!--Left side nav-->
<jsp:include page="./ad--side-nav.jsp">
    <jsp:param name="selectedIndex" value="5"/>
</jsp:include>

<!-- Main content -->
<div class="main-content" id="panel">
    <!--Top navigation-->
    <%@include file="../../common/ad-top-nav.jsp" %>

    <!-- Page content -->
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mt-4">
            <div class="col-md-10 ml-auto mr-auto">
                <nav aria-label="breadcrumb" role="navigation">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin"><i class="fa fa-home mr-2"></i>Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Ngành hàng</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!--Title-->
        <div class="row">
            <div class="col-md-10 ml-auto mr-auto">
                <h2 class="display-3 text-center text-uppercase my-5">Chỉnh sửa thông tin ngành hàng</h2>
            </div>
        </div>

        <!-- form edit -->
        <div class="row">
            <div class="col-md-10 ml-auto mr-auto">
                <form id="brand-edit-form" method="POST" enctype="multipart/form-data">

                    <!--Mã-->
                    <div class="form-group">
                        <label for="id" class="form-control-label">Mã</label>
                        <div>
                            <input class="form-control" type="text" id="id" name="id" readonly
                                  value="${productCategoryEdit.getProductCategoryId()}">
                        </div>
                    </div>

                    <!--Tên ngành hàng-->
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="name" class="form-control-label">Tên ngành hàng</label>
                                <a tabindex="-1" href="javascript:void(0)" class="badge badge-secondary" data-toggle="popover" data-placement="right" data-content="Trường bắt buộc - Tối đa 100 ký tự">?</a>
                                <div>
                                    <input class="form-control" type="text" placeholder="VD: Tên ngành hàng ..." id="name" name="name" maxlength="100"
                                           value="${productCategoryEdit.getProductCategoryName()}">
                                </div>
                                <small class="error-input text-danger">Vui lòng nhập tên ngành hàng</small>
                            </div>
                        </div>
                    </div>
                    <!--Ảnh-->
                    <div class="form-group">
                        <label for="up-image" class="form-control-label d-inline-block w-100">Ảnh</label>
                        <img id="img-upload" class="mb-2 rounded avatar-img" src="${productCategoryEdit.getImageSrc()}"/>
                        <div class="custom-file">
                            <label class="custom-file-label custom-file-img-label" for="up-image">Select file</label>
                            <input type="file" class="custom-file-input" id="up-image" name="up-image" accept="image/*"
                                   onchange="encodeImgToBase64(this)">
                        </div>
                    </div>

                    <!--Button-->
                    <div class="row mt-6">
                        <div class="col-md-6 text-md-right text-center">
                            <button type="submit" class="btn btn-primary pl-6 pr-6">LƯU</button>
                        </div>
                        <div class="col-md-6 text-md-left text-center">
                            <a href="/admin/category" data-toggle="modal" data-target="#conform-modal" class="btn btn-secondary pl-6 pr-6">HỦY</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="conform-modal" tabindex="-1" role="dialog" aria-labelledby="conform-modal-lb" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="conform-modal-lb">Cảnh báo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Những thay đổi sẽ không được cập nhật !<br>
                        Bạn có muốn hủy thay đổi ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary px-3" data-dismiss="modal">KHÔNG</button>
                        <a href="/admin/category" class="btn btn-primary px-4">CÓ</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@ include file="../../common/footer.jsp" %>
    </div>
</div>

<!--Javascript-->
<%@ include file="../../common/import-js.jsp" %>
<script>

  $(document).ready(function () {
    const apiUrl = "/api/product-categories";

    $.ajax({
      url: apiUrl,
      method: 'PUT',
      data: {
        page: '1',
      },
      success: function (data, textStatus, jqXHR) {
        let list = $.parseJSON(data);
        console.log(list);
      },
      cache: false
    });
  });
</script>
<script src="../../assets/js/validate/validate-product-category-edit-form.js"></script>
</body>
</html>