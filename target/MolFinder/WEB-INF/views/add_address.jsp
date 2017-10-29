<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link rel="stylesheet" href="/static/css/plugins/semantic/semantic.min.css">
    <link href="/static/css/plugins/select2/select2.min.css" rel="stylesheet">

</head>
<body>
<div class="hr-line-dashed" style="margin-top: 10px"></div>
<div class="col-md-8 col-md-offset-2" >
    <!--规则-->
    <div class="rules col-md-3" style="height:400px;padding-left: 0">

        <div class="ibox" style="border: 1px dashed #999">
            <div class="ibox-title">
                <h3 id="rank">添加收货地址</h3>
            </div>
            <div class="ibox-content">
                <form id="form" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="accepter">收货人:</label>
                        <div class="col-md-6">
                            <input id="accepter" type="text" class="form-control" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="tel">联系电话:</label>
                        <div class="col-md-6">
                            <input id="tel" type="text" class="form-control" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="acceptAddress">收货地址:</label>
                        <div class="col-md-6">
                            <input id="acceptAddress" type="text" class="form-control" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 text-center">
                            <input class="btn btn-primary" type="submit" value="添加"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="/static/js/jquery-3.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/plugins/layer/layer.js"></script>
<script src="/static/js/plugins/semantic/semantic.min.js" type="text/javascript"></script>


<!--jquery validate-->
<script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/js/plugins/validate/messages_zh.js"></script>
</body>


<script>
    //表单验证提交
    $("#form").validate({
        submitHandler:function(form){
            parent.layer.msg('添加地址成功', {shade: 0.3})
             var accepter = $("#accepter").val();
             var tel = $("#tel").val();
             var address = $("#acceptAddress").val();
             <%--$.ajax({--%>
                 <%--url: "/order/addAcceptOrderAddress",--%>
                 <%--data: {--%>
                      <%--userId: ${currentUser.userId},--%>
                      <%--acceptGoodsUsername: $("#accepter").val(),--%>
                      <%--acceptGoodsAddress: $("#acceptAddress").val(),--%>
                      <%--contactTel: $("#tel").val()--%>
                 <%--},--%>
                 <%--success:function (result) {--%>
                     <%--if(result.code == 200){--%>
                         <%--parent.layer.msg('添加地址成功', {shade: 0.3})--%>
                         <%--setTimeout(function () {--%>
                             <%--window.location.href = "/index/indexPage";--%>
                         <%--},2000)--%>
                     <%--}--%>
                 <%--},--%>
                 <%--error:function(result){--%>
                     <%--alert("系统出错");--%>
                 <%--}--%>
             <%--})--%>
        },
        invalidHandler: function(form, validator) {return false;}
    });
</script>
</html>
