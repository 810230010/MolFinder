<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>企业门户网站</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link href="/static/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <!--Highcharts-->
    <script src="https://cdn.hcharts.cn/highcharts/highcharts.js"></script>
    <%--<script src="/static/js/plugins/stick-up/stickUp.min.js"></script>--%>
    <style>
       .credit ul li{float: left;width: 80px;height: 40px}
        .nav-bar ul li{float: left;height:60px; line-height: 60px;width: 124px;text-align: center}
        .nav-bar a{color: white;text-decoration: none}
       .nav-bar a:hover{color: silver;text-decoration: none}
        .active2{color: silver;border-bottom: 2px solid red;height: 62px}
       .nav > li.active{border-bottom:2px solid #c23}
    </style>
</head>
<body>
<%@include file="common/header.jsp"%>
<div class="top-logo" style="height: 200px; background: white; width: 80%;margin: 0 auto">
    <div class="col-md-4 logo">
        <a href="/index/indexPage"><img src="/static/img/logo.png"/></a>
    </div>
    <div class="col-md-8 text-left pull-right" style="margin-top: 40px">
        <div class="search">
            <div class="input-group">
                <input type="text" placeholder="搜索公司" name="search" class="form-control input-lg">
                <div class="input-group-btn">
                    <button class="btn btn-lg btn-primary" type="submit">
                        搜索
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="com-main container">
    <div class="com-brief">
        <div class="com-logo col-md-1" style="padding-left: 0">
            <img src="/static/img/company_logo.jpg" alt="公司Logo" style="width: 80px;height: 80px">
        </div>
        <div class="col-md-11 com-name" style="height: 40px;padding-top: 0">
            <font>阿里巴巴有限公司</font>
        </div>
        <div class="col-md-11 credit" style="height: 40px;padding-bottom: 0">
            <ul style="list-style: none;padding-left:0;width:240px;height: 40px">
                <li><a href="#"><i class="fa fa-thumbs-o-up"></i>点赞1次</a></li>
                <li><a href="#"><i class="fa fa-share"></i>分享2次</a></li>
                <li><i class="fa fa-comment"></i>1次评价</li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="nav-bar" style="height: 60px;background: #524e4d;color: white">
        <ul style="list-style: none;padding-left: 0;">
            <li class="menu-item active2"><a href="#analysis">总体评价</a></li>
            <li class="menu-item"><a href="#com-intro">企业概述</a></li>
            <li class="menu-item"><a href="#contact">联系信息</a></li>
            <li class="menu-item"><a href="#comment">评论</a></li>
        </ul>
    </div>
    <div class="clearfix"></div>
    <div class="analysis" style="margin-top: 30px" >
        <div class="ibox-title" style="border-left: 5px solid #c23" id="analysis">
            <h4>总体评价</h4>
        </div>
        <div id="graph" style="height: 200px;width: 40%;padding-left: 0;border-right: 1px solid silver;float: left;"></div>
        <div class="tag" style="float: right;width: 30%;text-align: center;float: left;height: 200px;background: #F6F6F6">
            <h4>买家印象</h4>
            <p>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
            <p>
            <p>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
            </p>
        </div>
        <div class="tag" style="float: right;width: 30%;text-align: center;border-left: 1px solid silver;height: 200px;background: #F6F6F6">
            <h4>卖家印象</h4>
            <p>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
            <p>
            <p>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
                <span class="label label-primary" style="padding-right: 0">默认标签<span class="label label-primary">(50)</span></span>
            </p>
        </div>
    </div>
    <div class="clearfix"></div>
    <!--企业概述-->
    <div class="com-intro" style="margin-top: 30px">
        <div class="ibox-title" style="border-left:5px solid #c23" id="com-intro">
            <h4>企业概述</h4>
        </div>
        <div class="intro-content ibox-content">
            <p style="text-indent: 20px">
                天津佶品佳化工科技有限公司是一家集医药原料药、中间体工艺开发、转让及定制合成为一体的科技型企业。公司以“创新为动力，共赢促发展”的理念，同广大科研院所，制药企业进行亲密合作！ 公司致力于服务全球医药研发及生产企业，为客户提供最专业、全面、高效的配套服务。公司全体同仁凝聚一心，不畏艰险，立足当下，稳步向前，为把公司建成一个业内专业，社会认可的高技术企业而努力奋斗！ 公司生产部根据客户的要求，依托公司技术现有技术积累，灵活安排，进行含氟、三氟甲基、三氟甲氧基系列苯环吡啶环系列产品的定制合成。 同时，公司应广大客户的要求，利用自身专业采购的优势，开展化学品、耗材的代购代销业务，为客户提供更全面的贴心服务。
            </p>
        </div>
        <div class="basic" style="border:1px solid silver;background: #F6F6F6">
            <div class="table-responsive">
                <table class="table">
                    <tbody>
                    <tr>
                        <td>工商注册号:</td>
                        <td>1239102</td>
                        <td>企业法人:</td>
                        <td>江建平</td>
                    </tr>
                    <tr>
                        <td>注册资本:</td>
                        <td>11万</td>
                        <td>成立日期:</td>
                        <td>2025/6/1<td>
                    </tr>
                    <tr>
                        <td>登记状态:</td>
                        <td>存续</td>
                        <td>登记机关:</td>
                        <td>天津市津南区市场和质量监督管理局<td>
                    </tr>
                    <tr>
                        <td>注册住所:</td>
                        <td colspan="3">天津市津南区辛庄创意产业园区津沽路818号辛庄经济服务中心106-4</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle">经营范围:</td>
                        <td colspan="3" >
                            天津市津南区辛庄创意产业园区津沽路818号辛庄经济服务中心106-4<br/>
                            天津市津南区辛庄创意产业园区津沽路818号辛庄经济服务中心106-4<br>
                        </td>
                    </tr>
                    <tr>
                        <td>股东:</td>
                        <td colspan="3">刘强东、马云</td>
                    </tr>
                    <tr>
                        <td>主要人员:</td>
                        <td colspan="3">江建平、马云</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!--联系信息-->
    <div class="contact-info" style="margin-top: 30px">
        <div class="ibox-title" id="contact" style="border-left: 5px solid #c23">
            <h4>联系信息</h4>
        </div>
        <div class="contact-table col-md-6" style="margin-top: 20px;padding-left: 0">
            <div class="table-responsive" style="border:1px solid silver">
                <table class="table">
                    <tbody>
                    <tr>
                        <td>企业地址:</td>
                        <td>1239102</td>
                    </tr>
                    <tr>
                        <td>联系人:</td>
                        <td>江建平</td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <td>123123</td>
                    </tr>
                    <tr>
                        <td>qq:</td>
                        <td>1231313</td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td>8102300@qq.com</td>
                    </tr>
                    <tr>
                        <td>传真:</td>
                        <td>923123</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="comment" style="margin-top:20px">
        <div class="ibox-title" style="border-left:5px solid #c23" id="comment">
            <h4>交易点评</h4>
        </div>
        <div class="ibox-content">
            <div class="row">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-eye"> </i>全部</a></li>
                        <li><a data-toggle="tab" href="#tab-2"><i class="fa fa-book"></i>好评</a></li>
                        <li><a data-toggle="tab" href="#tab-3"><i class="fa fa-user"></i>中评</a></li>
                        <li><a data-toggle="tab" href="#tab-3"><i class="fa fa-user"></i>差评</a></li>
                        <li><a data-toggle="tab" href="#tab-3"><i class="fa fa-user"></i>有图</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade in active">
                            <div class="panel-body text-center">
                                <div style="margin-top: 20px">
                                    <div class="col-md-2">
                                        <div style="width:40px; height:86px" class="col-md-offset-8">
                                            <img src="/static/img/a4.jpg" alt="评论人" style="width:40px; height:40px"/>
                                            <span>j**p</span>
                                            <p>
                                                <span class="pull-left"><i class="fa fa-user"></i></span>
                                                <span class="pull-right"><i class="fa fa-user"></i></span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="tags col-md-12 text-left">
                                            <p>
                                                <span class="label label-primary">价格公道</span>
                                                <span class="label label-primary">价格公道</span>
                                                <span class="label label-primary">价格公道</span>
                                                <span class="label label-primary">价格公道</span>
                                            </p>
                                        </div>
                                        <div class="comment col-md-12 text-left">
                                            <p>
                                                发货很快
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-3 text-right">
                                        <div class="rating col-md-12">
                                            <p><i class="fa fa-star"></i></p>
                                        </div>
                                        <div class="comment-time col-md-12" style="margin-top: 10px">
                                            <p>2016-09-06 20:17:29</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane fade">
                            <div class="panel-body text-center">
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane fade">
                            <div class="panel-body">

                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        // Radialize the colors
        Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
            return {
                radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
                stops: [
                    [0, color],
                    [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                ]
            };
        });
        // 构建图表
        $('#graph').highcharts({
            chart: {
                plotBackgroundColor: "#F6F6F6",
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: ''
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        },
                        connectorColor: 'silver'
                    }
                }
            },
            series: [{
                type: 'pie',
                name: '浏览器占比',
                data: [
                    ['Firefox',   45.0],
                    ['IE',       26.8],
                    {
                        name: 'Chrome',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['Safari',    8.5],
                    ['Opera',     6.2],
                    ['其他',   0.7]
                ]
            }]
        });
    });

</script>
</html>
