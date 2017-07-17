<%--
  Created by IntelliJ IDEA.
  User: 江建平
  Date: 2017/7/16
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.6.1/css/font-awesome.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
<jsp:include page="/WEB-INF/assets/views/common/header.jsp" flush="true"/>
<div class="col-lg-6 col-lg-offset-2" style="margin-top: 100px;" >
    <div class="ibox">
        <div class="ibox-title col-lg-offset-7"><h4>精细化网站注册</h4></div>

        <div class="ibox-content">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="firstname" class="col-lg-4 control-label">姓名:</label>
                    <div class="col-lg-8 input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" id="firstname" placeholder="请输入名字">
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-lg-4 control-label">邮箱地址:</label>
                    <div class="col-lg-8 input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                        <input type="email" class="form-control" id="email" placeholder="请输入邮箱"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password1" class="col-lg-4 control-label">设置密码:</label>
                    <div class="col-lg-8 input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" class="form-control" id="password1" placeholder="请输入密码"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password2" class="col-lg-4 control-label">确认密码:</label>
                    <div class="col-lg-8 input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" class="form-control" id="password2" placeholder="确认密码"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password2" class="col-lg-4 control-label">地区:</label>
                    <div class="col-lg-8 input-group">

            <span class="col-lg-6">
                <select class="form-control">
                    <option>1</option>
                </select>
            </span>
                        <span class="col-lg-6">
            <select class="form-control">
                <option>1</option>
            </select>
            </span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password2" class="col-lg-4 control-label">公司名称:</label>
                    <div class="col-lg-8 input-group">
                        <span class="input-group-addon"><i class="fa fa-company"></i></span>
                        <input type="password" class="form-control" id="company" placeholder="填写公司名称"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password2" class="col-lg-4 control-label">手机号码:</label>
                    <div class="col-lg-8 input-group">
                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                        <input type="password" class="form-control" id="phone" placeholder="填写手机号"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password2" class="col-lg-4 control-label">qq号码:</label>
                    <div class="col-lg-8 input-group">
                        <span class="input-group-addon"><i class="fa fa-penguin"></i></span>
                        <input type="password" class="form-control" id="qq" placeholder="填写qq号"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password2" class="col-lg-4 control-label">验证码:</label>
                    <div class="col-lg-8 input-group">
                        <input type="password" class="form-control" id="qq" placeholder="填写qq号"/>
                        <span class="input-group-btn">
                <button class="btn btn-default" type="button">获取验证码</button>
            </span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="text-center col-lg-offset-3">
                        <button type="submit" class="btn btn-default">注册</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<jsp:include page="/WEB-INF/assets/views/common/footer.jsp" flush="true"/>
</body>
</html>
