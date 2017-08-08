<%--
  Created by IntelliJ IDEA.
  User: 江建平
  Date: 2017/8/8
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>实单详情</title>
    <script src="/static/js/plugins/semantic/semantic.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="hr-line-dashed"></div>
<div class="container">
    <div class="row">
        <div class="span6">
            <ul class="breadcrumb">
                <li>
                    <a href="#">首页</a> <span class="divider"></span>
                </li>
                <li>
                    <a href="#" style="font-size:20px;">实单详情</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div style="background: #f4f4f4">
<div class="container" style="padding-top: 20px; padding-bottom: 20px">
    <div class="real-content" style="height:200px">
        <div class="real-img col-md-3"><img src="/static/img/a4.jpg" style="width: 200px;height:200px" alt="图片"/></div>
        <div class="real-des col-md-9">
            <h3>CAS号：1896159-87-7</h3>
            <div class="pull-left"><i class="fa fa-user"></i>已报名:1人</div>
            <div class="pull-right"><i class="fa fa-clock-o"></i>距离时间结束还有</div>
            <div class="col-md-12 text-center" style="height: 50px;line-height: 50px; border: 1px solid #ddd;background: white;margin-top: 10px">
                <div class="col-md-3" style="border-right: 1px solid #ddd">采购量:</div>
                <div class="col-md-3" style="border-right: 1px solid #ddd">发票要求:</div>
                <div class="col-md-3" style="border-right: 1px solid #ddd">纯度要求:</div>
                <div class="col-md-3" >交货期:</div>
            </div>
            <div class="col-md-12 text-center" style="color: red;font-size: 24px;margin-top: 30px">¥ 7,000~7,500</div>
        </div>

    </div>
</div>
</div>
<!--tab-->
<div class="container">
<div class="row" style="margin-top:40px;">
    <div class="tabs-container">
        <ul class="nav nav-tabs">
            <li class="active col-md-4"><a data-toggle="tab" href="tabs.html#tab-1"> 实单详情</a></li>
            <li class="col-md-4"><a data-toggle="tab" href="tabs.html#tab-2">参考文献与路线</a></li>
            <li class="col-md-4"><a data-toggle="tab" href="tabs.html#tab-3">发单人</a></li>
        </ul>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane active">
                <div class="panel-body text-center">
                    <h3><i class="fa fa-building-o" style="color: red"></i>实单详情</h3>
                    <div class="text-left" style="margin-top: 20px">
                    <div class="col-md-4" style="border-right: 1px dashed grey">
                        <p><strong>CAS号</strong>： 1896159-87-7</p>
                        <p><strong>英文名称</strong>： N,1-Dimethyl-1h-pyrazol-4-aminedihydrochloride</p>
                        <p><strong>中文名称</strong>：</p>
                        <p><strong>其他要求</strong>：货到检测合格付款</p>
                    </div>
                    <div class="col-md-4" style="border-right: 1px dashed grey">
                        <p><strong>CAS号</strong>： 1896159-87-7</p>
                        <p><strong>英文名称</strong>： N,1-Dimethyl-1h-pyrazol-4-aminedihydrochloride</p>
                        <p><strong>中文名称</strong>：</p>
                        <p><strong>其他要求</strong>：货到检测合格付款</p>
                    </div>
                    <div class="col-md-4">
                        <p><strong>CAS号</strong>： 1896159-87-7</p>
                        <p><strong>英文名称</strong>： N,1-Dimethyl-1h-pyrazol-4-aminedihydrochloride</p>
                        <p><strong>中文名称</strong>：</p>
                    </div>
                    </div>
                </div>
            </div>
            <div id="tab-2" class="tab-pane">
                <div class="panel-body">
                    <strong>Donec quam felis</strong>

                    <p>Thousand unknown plants are noticed by me: when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects
                        and flies, then I feel the presence of the Almighty, who formed us in his own image, and the breath </p>

                    <p>I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite
                        sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet.</p>
                </div>
            </div>
            <div id="tab-3" class="tab-pane">
                <div class="panel-body">
                    <strong>Donec quam felis</strong>

                    <p>Thousand unknown plants are noticed by me: when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects
                        and flies, then I feel the presence of the Almighty, who formed us in his own image, and the breath </p>

                    <p>I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite
                        sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet.</p>
                </div>
            </div>
        </div>


    </div>
</div>
</div>

<div style="height:100px">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
</body>
<script src="/static/js/plugins/semantic/semantic.min.js" type="text/javascript"></script>
<script>

</script>
</html>
