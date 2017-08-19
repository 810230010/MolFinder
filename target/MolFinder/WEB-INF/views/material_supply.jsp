<%--
  Created by IntelliJ IDEA.
  User: usher
  Date: 2017/8/17
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>原料供应</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link href="/static/css/plugins/select2/select2.min.css" rel="stylesheet">
    <%@include file="/WEB-INF/views/common/resource_js.jsp"%>
    <!--bootstrap select-->
    <script src="/static/js/plugins/select2/select2.full.min.js" type="text/javascript"></script>
    <!--jquery validate-->
    <script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/static/js/plugins/validate/messages_zh.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
    <div class="row">
        <div class="span6">
            <ul class="breadcrumb">
                <li>
                    <a href="/index/indexPage">首页</a> <span class="divider"></span>
                </li>
                <li>
                    <a style="font-size:20px;">原料供应</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container" style="border:1px solid #f1f1f1">
        <div style="height: 44px; line-height: 44px;border-bottom: 1px solid #f1f1f1">
            <h3>单个发布</h3>
        </div>
        <div class="ibox-content">
            <form class="form-horizontal" id="form" onsubmit="return false">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="cas">CAS号:</label>
                    <div class="col-sm-7">
                        <input id="cas" type="text" class="form-control" required>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="cas">产品名称:</label>
                    <div class="col-sm-7">
                        <input id="material_name" type="text" class="form-control" required>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <div class="col-sm-12 text-center">
                        <input type="submit" value="提交发布" class="btn btn-success"/>
                    </div>
                </div>
            </form>
        </div>
    <div class="divider" style="height:44px;background-color: silver"></div>
    <div style="height: 44px; line-height: 44px;border-bottom: 1px solid #f1f1f1">
        <h3>多个发布</h3>
    </div>
    <div class="ibox-content">
        <form class="form-horizontal" onsubmit="return false">
            <div class="form-group">
                <label class="col-sm-3 control-label" for="cas"></label>
                <div class="col-sm-7">
                    <p>请输入产品的cas号和英文产品名称,每行仅限输入一条产品信息,每次最多上传100条。</p>
                    <p><b>输入格式要求:cas号 空格 名称(如23123 chrollsd)</b></p>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="cas">产品名称:</label>
                <div class="col-sm-7">
                    <textarea class="col-sm-12" style="height: 200px;"></textarea>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <div class="col-sm-12 text-center">
                    <input type="submit" value="提交发布" class="btn btn-success"/>
                </div>
            </div>
        </form>
    </div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
