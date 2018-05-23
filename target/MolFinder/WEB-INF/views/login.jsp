<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link href="/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <!-- Mainly scripts -->
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/static/js/plugins/validate/messages_zh.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>
</head>

<body style="background: url(/static/img/body.jpg);">
<div class="nav text-center" style="background-color: #354b56;height: 44px;color: white;line-height: 44px;font-size: 20px">欢迎来到精细化工交易平台</div>
<div class="container">

     <div class="row col-lg-offset-2">
        <div class="col-sm-9" style="margin-top: 100px;" >
            <div class="ibox">
                <div class="ibox-title text-center">
                    <h4>精细化网站登录</h4>
                </div>

                <div class="ibox-content">
                    <form class="form-horizontal" id="form" onsubmit="return false">
                        <div class="form-group">
                            <div class="col-sm-6 col-sm-offset-3 input-group">
                                <span class="input-group-addon"><span class="fa fa-envelope"></span></span>
                                <input type="text" class="form-control" id="phone" placeholder="请输入手机号" required/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-6 col-sm-offset-3 input-group">
                                <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                                <input type="password" class="form-control" id="password1" placeholder="请输入密码" required/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-3">
                                <div class="form-group has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>
                                        <input id="checkCodeText" class="form-control" placeholder="请输入验证码" maxlength="4" type="text" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <img id="checkCode" src="/user/getCheckCode" alt="" onclick="refreshCheckCode()">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="text-center">
                                <button id="login" type="submit" class="btn btn-default col-md-6">登录</button>
                                <button id="register" type="button" class="btn btn-primary col-md-6" onclick="window.location.href='/user/registerPage'">没有账号?去注册<i class="fa fa-arrow-right"></i></button>
                            </div>
                            <div class="col-md-12 text-right" style="margin-top: 14px">
                                <a href="/index/indexPage">不了!随便逛逛</a>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

</div>
<%@include file="common/footer.jsp"%>
</body>
<script>
    $("#form").validate({
        submitHandler:function(form){
            var password = $("#password1").val();
            var phone = $("#phone").val();
            var checkCode = $("#checkCodeText").val();
            $.ajax({
                url: "/user/checkLogin",
                data: {
                        password: password,
                        phone: phone,
                        checkCode: checkCode
                },
                success: function(result){
                    if(result.code == 200){
                        swal("成功！", "登录成功", "success");
                        setTimeout(function () {
                            window.location.href = "/index/indexPage";
                        },2000)
                    }else{
                        layer.msg(result.msg);
                    }
                },
                error: function(result){
                    alert("系统出错")
                }
            })
        },
        invalidHandler: function(form, validator) {return false;}
    });
    function refreshCheckCode() {
        var date = new Date(); // 创建一个 Date 对象的 一个 实例
        $("#checkCode").attr('src','/user/getCheckCode?time='+date.getTime());
    }
</script>
</html>
