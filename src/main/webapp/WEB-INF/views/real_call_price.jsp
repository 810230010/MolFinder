<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>实单详情</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <%--<%@include file="/WEB-INF/views/common/resource_js.jsp"%>--%>
    <script src="/static/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="/static/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="hr-line-dashed"></div>
<div class="container">
    <div class="row">
        <div class="span6">
            <ul class="breadcrumb">
                <li>
                    <a href="/index/indexPage">首页</a> <span class="divider"></span>
                </li>
                <li>
                    <a href="#" style="font-size:20px;">实单报价详情</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div style="background: #f4f4f4">
<div class="container" style="padding-top: 20px; padding-bottom: 20px">
    <div class="real-content" style="height:200px">
        <div class="real-img col-md-3"><img src="${realDetail.image}" style="width: 200px;height:200px" alt="图片"/></div>
        <div class="real-des col-md-9">
            <h3>CAS号：${realDetail.casNo}</h3>
            <div class="pull-left"><i class="fa fa-user"></i>已报名:${realDetail.joinCount}人</div>
            <div class="pull-right"><i class="fa fa-clock-o"></i>距离时间结束还有：<span class="timespan" style="color: red" endTime="<fmt:formatDate value="${realDetail.endTime}" pattern="yyyy-MM-dd hh:mm:ss" />"></span></div>
            <div class="col-md-12 text-center" style="height: 50px;line-height: 50px; border: 1px solid #ddd;background: white;margin-top: 10px">
                <div class="col-md-3" style="border-right: 1px solid #ddd">采购量:${realDetail.buyAmount}</div>
                <div class="col-md-3" style="border-right: 1px solid #ddd">发票要求:${realDetail.makeBill}</div>
                <div class="col-md-3" style="border-right: 1px solid #ddd">纯度要求:${realDetail.purity}</div>
                <div class="col-md-3" >交货期:${realDetail.submitDeadline}周</div>
            </div>
            <div class="col-md-6 text-left" style="color: red;font-size: 24px;margin-top: 30px">¥ ${realDetail.priceBetween}</div>
            <div class="col-md-6 text-right" style="margin-top: 30px"><button type="button" class="btn btn-danger" style="width:120px">立即抢单</button></div>
        </div>

    </div>
</div>
</div>
<!--tab-->
<div class="container">
<div class="row" style="margin-top:40px;">
    <div class="tabs-container">
        <ul class="nav nav-tabs">
            <li class="active col-md-4" style="padding-left: 0"><a data-toggle="tab" href="#tab-1"><i class="fa fa-eye"> </i>实单详情</a></li>
            <li class="col-md-4"><a data-toggle="tab" href="#tab-2"><i class="fa fa-book"></i>参考文献与路线</a></li>
            <li class="col-md-4" style="padding-right: 0"><a data-toggle="tab" href="#tab-3"><i class="fa fa-user"></i>报价情况</a></li>
        </ul>
        <div class="tab-content" style="height:400px">
            <div id="tab-1" class="tab-pane fade in active">
                <div class="panel-body text-center">
                    <h3><i class="fa fa-building-o" style="color: red"></i>实单详情</h3>
                    <div class="text-left" style="margin-top: 20px">
                    <div class="col-md-4" style="border-right: 1px dashed grey">
                        <p><strong>CAS号</strong>： ${realDetail.casNo}</p>
                        <p><strong>英文名称</strong>： ${realDetail.englishName}</p>
                        <p><strong>中文名称</strong>：${realDetail.chineseName}</p>
                        <p><strong>其他要求</strong>：${realDetail.remark}</p>
                    </div>
                    <div class="col-md-4" style="border-right: 1px dashed grey">
                        <p><strong>采购量</strong>：${realDetail.buyAmount}</p>
                        <p><strong>纯度要求</strong>： ${realDetail.purity}</p>
                        <p><strong>图谱要求</strong>：${realDetail.diagramRequire}</p>
                        <p><strong>实单价格</strong>：${realDetail.priceBetween}元</p>
                    </div>
                    <div class="col-md-4">
                        <p><strong>交货期</strong>：${realDetail.submitDeadline}</p>
                        <p><strong>发布日期</strong>： <fmt:formatDate value="${realDetail.beginTime}" pattern="yyyy-MM-dd hh:mm:ss" /></p>
                        <p><strong>发票类型</strong>： ${realDetail.makeBill}</p>
                    </div>
                        <c:if test="${realDetail.guaranteeMoneyPercent != null}">
                        <div class="col-md-12">
                            <div class="hr-line-dashed"></div>
                            <p><b>成交后买方预付全款${realDetail.guaranteeMoneyPercent}%至网站作为保证金</b></p>
                            <c:if test="${realDetail.rewardMoneyPercent != null}">
                                <p><b>提前完成奖励订单价${realDetail.rewardMoneyPercent}%每天</b></p>
                            </c:if>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div id="tab-2" class="tab-pane fade">
                <div class="panel-body text-center">
                      ${realDetail.referDoc}
                </div>
            </div>
            <div id="tab-3" class="tab-pane fade">
                <div class="panel-body text-center">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>报价人</th>
                            <th>报价金额</th>
                            <th>发票信息</th>
                            <th>纯度</th>
                            <th>交货期限</th>
                            <th>其他(预付款、保证金)</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>查看详情</td>
                            <td>生成订单</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script src="/static/js/plugins/semantic/semantic.min.js" type="text/javascript"></script>
<script>
$(function () {
    updateEndTime();
})
//倒计时函数
function updateEndTime()
{
    var date = new Date();
    var time = date.getTime(); //当前时间距1970年1月1日之间的毫秒数


    $(".timespan").each(function(i){


        var endDate =this.getAttribute("endTime"); //结束时间字符串
        //转换为时间日期类型
        var endDate1 = eval('new Date(' + endDate.replace(/\d+(?=-[^-]+$)/, function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) +')');


        var endTime = endDate1.getTime(); //结束时间毫秒数


        var lag = (endTime - time) / 1000; //当前时间和结束时间之间的秒数
        if(lag > 0)
        {
            var second = Math.floor(lag % 60);
            var minite = Math.floor((lag / 60) % 60);
            var hour = Math.floor((lag / 3600) % 24);
            var day = Math.floor((lag / 3600) / 24);
            $(this).html(day+"天"+hour+"小时"+minite+"分"+second+"秒");
        }
        else{
            $(this).removeClass("timespan");
            $(this).html("已经结束");
        }
    });
    setTimeout("updateEndTime()",1000);
}
</script>
</html>
