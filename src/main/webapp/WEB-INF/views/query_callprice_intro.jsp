<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>询单报价成员详情</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link href="/static/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="/static/js/plugins/dataTables/datatables.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="hr-line-dashed"></div>
<div class="container">
    <div class="row" style="margin-top: 40px">
        <div class="span6">
            <ul class="breadcrumb">
                <li>
                    <a href="/index/indexPage">首页</a> <span class="divider"></span>
                </li>
                <li>
                    <a href="#" style="font-size:20px;">询单报价详情</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div style="background: #f4f4f4">
<div class="container" style="padding-top: 20px; padding-bottom: 20px">
    <div class="real-content" style="height:200px">
        <div class="real-img col-md-3"><img src="${queryDetail.image}" style="width: 200px;height:200px" alt="图片"/></div>
        <div class="real-des col-md-9">
            <h3>CAS号：${queryDetail.casNo}</h3>
            <div class="pull-left"><i class="fa fa-user"></i>已报名:${queryDetail.joinCount}人</div>
            <div class="pull-right"><i class="fa fa-clock-o"></i>距离时间结束还有：<span class="timespan" style="color: red" endTime="<fmt:formatDate value="${queryDetail.endTime}" pattern="yyyy-MM-dd hh:mm:ss" />"></span></div>
            <div class="col-md-12 text-center" style="height: 50px;line-height: 50px; border: 1px solid #ddd;background: white;margin-top: 10px">
                <div class="col-md-3" style="border-right: 1px solid #ddd">采购量:${queryDetail.buyAmount}</div>
                <div class="col-md-3" style="border-right: 1px solid #ddd">发票要求:${queryDetail.makeBill}</div>
                <div class="col-md-3" style="border-right: 1px solid #ddd">纯度要求:${queryDetail.purity}</div>
                <div class="col-md-3" >交货期:${queryDetail.submitDeadline1}</div>
            </div>
        </div>

    </div>
</div>
</div>
<!--tab-->
<div class="container">
<div class="row" style="margin-top:40px;">
    <div class="tabs-container">
        <ul class="nav nav-tabs">
            <li class="active col-md-4" style="padding-left: 0"><a data-toggle="tab" href="#tab-1"><i class="fa fa-eye"> </i>询单详情</a></li>
            <li class="col-md-4"><a data-toggle="tab" href="#tab-2"><i class="fa fa-book"></i>参考文献与路线</a></li>
            <li class="col-md-4" style="padding-right: 0"><a data-toggle="tab" href="#tab-3"><i class="fa fa-user"></i>报价情况</a></li>
        </ul>
        <div class="tab-content" style="height:400px">
            <div id="tab-1" class="tab-pane fade in active">
                <div class="panel-body text-center">
                    <h3><i class="fa fa-building-o" style="color: red"></i>询单详情</h3>
                    <div class="text-left" style="margin-top: 20px">
                    <div class="col-md-4" style="border-right: 1px dashed grey">
                        <p><strong>CAS号</strong>： ${queryDetail.casNo}</p>
                        <p><strong>英文名称</strong>： ${queryDetail.englishName}</p>
                        <p><strong>中文名称</strong>：${queryDetail.chineseName}</p>
                        <p><strong>其他要求</strong>：${queryDetail.otherRequire}</p>
                    </div>
                    <div class="col-md-4" style="border-right: 1px dashed grey">
                        <p><strong>采购量</strong>：${queryDetail.buyAmount}</p>
                        <p><strong>纯度要求</strong>： ${queryDetail.purity}</p>
                        <p><strong>图谱要求</strong>：${queryDetail.diagramRequire}</p>
                    </div>
                    <div class="col-md-4">
                        <p><strong>交货期</strong>：${queryDetail.submitDeadline1}</p>
                        <p><strong>发布日期</strong>： <fmt:formatDate value="${queryDetail.beginTime}" pattern="yyyy-MM-dd hh:mm:ss" /></p>
                        <p><strong>发票类型</strong>： ${queryDetail.makeBill}</p>
                    </div>
                        <c:if test="${realDetail.guaranteeMoneyPercent != null}">
                        <div class="col-md-12">
                            <div class="hr-line-dashed"></div>
                            <p><b>成交后买方预付全款${queryDetail.guaranteeMoneyPercent}%至网站作为保证金</b></p>
                            <c:if test="${queryDetail.rewardMoneyPercent != null}">
                                <p><b>提前完成奖励订单价${queryDetail.rewardMoneyPercent}%每天</b></p>
                            </c:if>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div id="tab-2" class="tab-pane fade">
                <div class="panel-body text-center">
                      ${queryDetail.referDoc}
                </div>
            </div>
            <div id="tab-3" class="tab-pane fade">
                <div class="panel-body text-center">
                    <div class="table-responsive" style="font-size: 14px">
                        <table id="dataTable" class="table table-striped table-bordered table-hover dataTables-example" >
                            <thead>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
$(function () {
    updateEndTime();
    loadTable();
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
function loadTable(){
    $('#dataTable').DataTable({
        "ajax": {
            'url': '/enquiry/getQueryCallpriceMembers',
            "data": function(d) {
                var param = {};
                param.page = d.start/d.length + 1;
                param.pageSize = d.length;
                param.draw = d.draw;
                param.searchKey = d.search["value"];
                param.orderColumn = d.columns[d.order[0]['column']]['data'];
                param.orderType = d.order[0]['dir'];
                param.queryOrderId = ${queryDetail.queryOrderId};
                return param;
            },
        },
        "columns": [
            {"data":"queryCallId","width":"7%","title":"","visible": false},
            {"data":"companyName","width":"10%","title":"发单人","orderable": false,
                "render": function (data, type, row) {
                    return "<a class='scanCom'>" + data + "</a>"
                }
            },
            {"data":"callPriceMoney","width":"7%","title":"报价","orderable":false},
            {"data":"companyName","width": "10%","title":"发单者","orderable": false},
            {"data":"callPurity","width": "10%","title":"纯度","orderable": false},
            {"data":"callSubmitDeadline","width": "10%","title":"交货期","orderable": false},
            {"data":"queryOrderId","width": "10%","title":"其他设置","orderable": false,
                "render": function (data, type, row) {
                    var str = '';
                    if(row.prepayedMoneyAmount != null)
                        str = "预:" + row.prepayedMoneyAmount + '%\n';
                    if(row.vilationMoneyAmount != null)
                        str += "违:" + row.vilationMoneyAmount + "%";
                    if(row.prepayedMoneyAmount == null && row.vilationMoneyAmount == null)
                        str = '无';
                    return str;
                }
            },
            {
                "data":"queryCallId",
                "width": "10%",
                "title":"操作",
                "orderable": false,
                "render": function (data, type, row) {
                    return [
                        '<a class="btn btn-primary btn-xs table-action scan" href="javascript:void(0)">',
                        '查看详情 <i class="fa fa-eye"></i>',
                        '</a>',
                        '<a class="table-button btn btn-danger btn-xs table-action stop" href="javascript:void(0)">',
                        '生成订单 <i class="fa fa-trash-o"></i>',
                        '</a>'
                    ].join('');
                }
            },
        ],
        "searching": true,
        "ordering":true,
        "serverSide": true,
        "deferRender": true,
        "processing": true,
        "autoWidth": false,
        "destroy": true,
        "lengthMenu": [ 5, 10, 15],
        "responsive": true,
        "dom": '<"html5buttons"B>lTfgitp',
        "buttons": [],
        "language": {
            "url": "/static/js/plugins/dataTables/Chinese.json",
        }
    });
    var table = $("#dataTable").DataTable();
    //查看询单报价详情
    table.on( 'click', '.scan', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        window.location.href = "/enquiry/queryCallpriceShowPage?queryCallId=" + data.queryCallId + "&queryOrderId=" + data.queryOrderId;
    });
    //浏览公司信息
    table.on( 'click', '.scanCom', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        window.location.href = "/company/companyDetailPage?certificateId=" + data.certificateId;
    });
}


</script>
</html>
