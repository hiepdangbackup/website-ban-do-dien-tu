<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="formUrl" value="/api/admin/user"/>
<html>
<head>
    <title>Chi tiết tài khoản</title>
</head>
<body>
<div class="main-content">
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
                <li class="active">Chỉnh sửa tài khoản</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>
                    <form:form id="formEdit" commandName="model">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Vai trò</label>
                            <div class="col-sm-9">
                                <form:select path="roleCode" id="roleCode">
                                    <form:option value="" label="--- Chọn vai trò ---"/>
                                    <form:options items="${roles}"/>
                                </form:select>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Tên đăng nhập</label>
                            <div class="col-sm-9">
                                <form:input path="userName" id="userName" cssClass="form-control"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Họ tên</label>
                            <div class="col-sm-9">
                                <form:input path="fullName" id="fullName" cssClass="form-control"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Điện thoại</label>
                            <div class="col-sm-9">
                                <form:input path="phone" id="phone" cssClass="form-control"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Email</label>
                            <div class="col-sm-9">
                                <form:input path="email" id="email" cssClass="form-control"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Mật khẩu</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" name="password" value=""
                                       placeholder="Nếu reset mật khẩu thì nhập mất khẩu mới, không thì để trống"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <c:if test="${not empty model.id}">
                                    <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật tài khoản" id="btnAddOrUpdateUser"/>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm mới tài khoản" id="btnAddOrUpdateUser"/>
                                </c:if>
                            </div>
                        </div>
                        <form:hidden path="id" id="userId"/>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    $(document).ready(function () {
    });

    $('#btnAddOrUpdateUser').click(function (event) {
        event.preventDefault();
        var data = {};
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (i,v) {
            data["" + v.name + ""] = v.value;
        });
        var id = $('#userId').val();
        if (id == "") {
            addUser(data);
        } else {
            updateUser(data);
        }
    });

    function addUser(data) {
        $.ajax({
            url: '${formUrl}',
            type: 'POST',
            dataType: 'json',
            contentType:'application/json',
            data: JSON.stringify(data),
            success: function(res) {
                window.location.href = "<c:url value='/admin/user/edit?id="+res.id+"&message=insert_success'/>";
            },
            error: function(res) {
                window.location.href = "<c:url value='/admin/user/edit?id="+res.id+"&message=error_system'/>";
            }
        });
    }

    function updateUser(data) {
        $.ajax({
            url: '${formUrl}',
            type: 'PUT',
            dataType: 'json',
            contentType:'application/json',
            data: JSON.stringify(data),
            success: function(res) {
                window.location.href = "<c:url value='/admin/user/edit?id="+res.id+"&message=update_success'/>";
            },
            error: function(res) {
                window.location.href = "<c:url value='/admin/user/edit?id="+res.id+"&message=error_system'/>";
            }
        });
    }
</script>
</body>
</html>
