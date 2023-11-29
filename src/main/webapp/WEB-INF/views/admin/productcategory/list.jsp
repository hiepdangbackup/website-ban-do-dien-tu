<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="formUrl" value="/admin/productcategory/list"/>
<c:url var="productCategoryAPI" value="/api/admin/productcategory"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách thể loại sản phẩm</title>
</head>
<body>
<div class="main-content">
    <%--<form:form commandName="model" action="${formUrl}" id="listForm" method="GET">--%>
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Danh sách thể loại sản phẩm</li>
                </ul><!-- /.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <c:if test="${messageResponse!=null}">
                            <div class="alert alert-block alert-${alert}">
                                <button type="button" class="close" data-dismiss="alert">
                                    <i class="ace-icon fa fa-times"></i>
                                </button>
                                    ${messageResponse}
                            </div>
                        </c:if>
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-btn-controls">
                                    <div class="pull-right tableTools-container">
                                        <div class="dt-buttons btn-overlap btn-group">
                                            <a flag="info" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                               data-toggle="tooltip" title="Thêm loại sản phẩm" href='<c:url value="/admin/productcategory/edit"/>'>
                                                    <span>
                                                    <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                </span>
                                            </a>
                                            <button id="btnDelete" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                    data-toggle="tooltip" title="Xóa loại sản phẩm" onclick="warningBeforeDelete()">
                                                    <span>
                                                    <i class="fa fa-trash-o bigger-110 pink"></i>
                                                	</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Tên loại sản phẩm</th>
                                                <th>Mã loại sản phẩm</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${productcategories}">
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checkList" value="${item.id}" id="checkbox_${item.id}" class="check-box-element"/>
                                                    </td>
                                                    <td>${item.name}</td>
                                                    <td>${item.code}</td>
                                                    <td>
                                                        <c:url var="editURL" value="/admin/productcategory/edit">
                                                            <c:param name="id" value="${item.id}"/>
                                                        </c:url>
                                                        <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                           title="Cập nhật thông tin" href='${editURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%--</form:form>--%>
</div>
<script type="text/javascript">
    $(document).ready(function () {

    });
    function warningBeforeDelete() {
        showAlertBeforeDelete(function () {
            event.preventDefault();
            var dataArray = $(' tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
            deleteProductCategory(dataArray);
        });
    }

    function deleteProductCategory(data) {
        $.ajax({
            url: '${productCategoryAPI}',
            type: 'DELETE',
            contentType:'application/json',
            data: JSON.stringify(data),
            success: function(res) {
                window.location.href = "<c:url value='/admin/productcategory/list?message=delete_success'/>";
            },
            error: function(res) {
                console.log(res);
                window.location.href = "<c:url value='/admin/productcategory/list?message=error_system'/>";
            }
        });
    }
</script>
</body>
</html>
