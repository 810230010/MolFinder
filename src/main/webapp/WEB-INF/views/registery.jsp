<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link href="/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/static/js/plugins/validate/messages_zh.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>
</head>

<body style="background: url(/static/img/login-al.png)">
<div class="container">
<div class="row col-lg-offset-2">
    <div class="col-sm-9" style="margin-top: 100px;" >
        <div class="ibox">
            <div class="ibox-title text-center">
                <h4>精细化网站注册</h4>
            </div>

            <div class="ibox-content">
                <form class="form-horizontal" id="form" onsubmit="return false">
                    <div class="form-group">
                        <label for="phone" class="col-lg-3 control-label">手机号码:</label>
                        <div class="col-lg-6 input-group">
                            <span class="input-group-addon"><i class="fa fa-mobile"></i></span>
                            <input type="password" class="form-control" id="phone" placeholder="填写手机号" required/>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">邮箱地址:</label>
                        <div class="col-sm-6 input-group">
                            <span class="input-group-addon"><span class="fa fa-envelope"></span></span>
                            <input type="email" class="form-control" id="email" placeholder="请输入邮箱" required/>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label for="password1" class="col-sm-3 control-label">设置密码:</label>
                        <div class="col-sm-6 input-group">
                            <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                            <input type="password" class="form-control" id="password1" placeholder="请输入密码" required/>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="text-center">
                            <button id="register" type="submit" class="btn btn-default col-lg-6">注册</button>
                            <button id="go" type="button" class="btn btn-success col-lg-6">已有账号,去登陆<i class=" fa fa-arrow-right"></i></button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
</div>
</body>
<script>
    $("#form").validate({
        submitHandler:function(form){
            var email = $("#email").val();
            var password = $("#password1").val();
            var phone = $("#phone").val();
            $.ajax({
                url: "/user/register",
                data: {email: email, password: password, phone: phone},
                success: function(result){
                    if(result.code == 200){
                        swal("成功！", "注册成功,现在可以去登录了", "success");
                        setTimeout(function () {
                            window.location.href = "/user/loginPage";
                        },2000)
                    }else{
                        sweetAlert("注册失败", result.msg,"error");
                    }
                },
                error: function(result){
                    alert("系统出错")
                }
            })
        },
        invalidHandler: function(form, validator) {return false;}
    });
    $("#go").click(function () {
        window.location.href = "/user/loginPage";
    })
</script>
</html>
