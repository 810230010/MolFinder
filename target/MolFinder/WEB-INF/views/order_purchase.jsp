<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我购买的订单</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link href="/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="/static/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>
    <script src="/static/js/plugins/dataTables/datatables.min.js"></script>
    <script src="/static/js/plugins/sweetalert/sweetalert.min.js"></script>
    <style>
        .filter2 ul{height: 40px;padding-left: 0px;background: #f8f8f8}
        .filter2 ul li{height:40px;float: left;line-height: 40px;padding: 0 15px;cursor: pointer}
        .filter2 .active{background-color: #c23;color: white}
    </style>
</head>
<body style="background-color: white">
<div style="padding-top: 30px;">
    <div style="border-left: 5px solid #c23;height:44px;line-height:44px;padding-left:10px;box-shadow: grey">
        <font style="font-size: 24px"><b>我购买的订单</b></font>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="filter2" style="box-shadow: 0 5px 3px #e8e8e8;margin-top:20px">
        <ul style="list-style: none">
            <li class="active"><b>已发货</b></li>
            <li><b>未发货</b></li>
            <li><b>已确认</b></li>
        </ul>
    </div>
    <div class="table-responsive" style="font-size: 14px">
        <table id="dataTable" class="table table-striped table-bordered table-hover dataTables-example" >
            <thead>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>
</body>
<script>
    $(".filter2 ul li").click(function () {
        $(".filter2 ul li").removeClass('active');
        $(this).addClass('active');
        $("#dataTable tbody tr").remove();
        switch($(this).text()){
            case "已发货":
                fun1();
                break;
            case "未发货":
                fun2();
                break;
            case "已确认":
                fun3();
                break;
        }
    })
    $(document).ready(function () {
        fun1();
    });

    //获取已发货订单列表
    function fun1(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/order/myPurchaseOrders/' + 'SEND',
                "data": function(d) {
                    var param = {};
                    param.page = d.start/d.length + 1;
                    param.pageSize = d.length;
                    param.draw = d.draw;
                    param.searchKey = d.search["value"];
                    param.orderColumn = d.columns[d.order[0]['column']]['data'];
                    param.orderType = d.order[0]['dir'];
                    return param;

                },
            },
            "columns": [
                {"data":"goodsOrderId","width":"7%","title":"","visible": false},
                {"data":"companyName","width": "10%","title":"厂商","orderable": false},
                {"data":"casNo","width": "10%","title":"CAS号","orderable": false},
                {"data":"chineseName","width": "10%","title":"中文名","orderable": false},
                {
                    "data":"image",
                    "width": "10%",
                    "title":"结构式",
                    "orderable": false,
                    "render": function (data, type, row) {
                        var html = '<div class="pull-left"><img src="' + row.image + '" style="width: 60px;height: 60px;"></div>';
                        return html;
                    }
                },
                {"data":"orderPrice","width": "10%","title":"订单价","orderable": false},
                {"data":"createTime","width": "10%","title":"下单时间","orderable": false},
                {"data":"orderType","width": "10%","title":"订单类型","orderable": false},
                {
                    "data":"goodsOrderId",
                    "width": "10%",
                    "title":"订单状态",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return "已发货";
                    }
                },
                {
                    "data":"goodsOrderId",
                    "width": "15%",
                    "title":"操作",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return [
                            '<a class="btn btn-info btn-xs table-action confirm" href="javascript:void(0)">',
                            '确认收货 <i class="fa fa-eye"></i>',
                            '</a>',
                            '<a class="btn btn-primary btn-xs table-action scan" href="javascript:void(0)">',
                            '订单详情 <i class="fa fa-eye"></i>',
                            '</a>',
                        ].join('');
                    }},
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
        tableAction();
    }
    //未发货订单列表
    function fun2(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/order/myPurchaseOrders/' + 'ORDER',
                "data": function(d) {
                    var param = {};
                    param.page = d.start/d.length + 1;
                    param.pageSize = d.length;
                    param.draw = d.draw;
                    param.searchKey = d.search["value"];
                    param.orderColumn = d.columns[d.order[0]['column']]['data'];
                    param.orderType = d.order[0]['dir'];
                    return param;
                },
            },
            "columns": [
                {"data":"goodsOrderId","width":"7%","title":"","visible": false},
                {"data":"companyName","width": "10%","title":"厂商","orderable": false},
                {"data":"casNo","width": "10%","title":"CAS号","orderable": false},
                {"data":"chineseName","width": "10%","title":"中文名","orderable": false},
                {
                    "data":"image",
                    "width": "7%",
                    "title":"结构式",
                    "orderable": false,
                    "render": function (data, type, row) {
                        var html = '<div class="pull-left"><img src="' + row.image + '" style="width: 60px;height: 60px;"></div>';
                        return html;
                    }
                },
                {"data":"orderPrice","width": "10%","title":"订单价","orderable": false},
                {"data":"createTime","width": "10%","title":"下单时间","orderable": false},
                {"data":"orderType","width": "11%","title":"订单来源","orderable": false},
                {
                    "data":"goodsOrderId",
                    "width": "10%",
                    "title":"订单状态",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return "未发货";
                    }
                },
                {
                    "data":"goodsOrderId",
                    "width": "10%",
                    "title":"操作",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return [
                            '<a class="btn btn-danger btn-xs table-action cancel" href="javascript:void(0)">',
                            '取消订单 <i class="fa fa-eye"></i>',
                            '</a>',
                            '<a class="btn btn-primary btn-xs table-action scan" href="javascript:void(0)">',
                            '订单详情 <i class="fa fa-eye"></i>',
                            '</a>',
                        ].join('');
                    }},
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
       tableAction();
    }
    //已确认列表
    function fun3(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/order/myPurchaseOrders/' + 'SUCCESS',
                "data": function(d) {
                    var param = {};
                    param.page = d.start/d.length + 1;
                    param.pageSize = d.length;
                    param.draw = d.draw;
                    param.searchKey = d.search["value"];
                    param.orderColumn = d.columns[d.order[0]['column']]['data'];
                    param.orderType = d.order[0]['dir'];
                    return param;
                },
            },
            "columns": [
                {"data":"goodsOrderId","width":"7%","title":"","visible": false},
                {"data":"companyName","width": "10%","title":"厂商","orderable": false},
                {"data":"casNo","width": "10%","title":"CAS号","orderable": false},
                {"data":"chineseName","width": "10%","title":"中文名","orderable": false},
                {
                    "data":"image",
                    "width": "10%",
                    "title":"结构式",
                    "orderable": false,
                    "render": function (data, type, row) {
                        var html = '<div class="pull-left"><img src="' + row.image + '" style="width: 60px;height: 60px;"></div>';
                        return html;
                    }
                },
                {"data":"orderPrice","width": "10%","title":"订单价","orderable": false},
                {"data":"createTime","width": "10%","title":"下单时间","orderable": false},
                {"data":"orderType","width": "10%","title":"订单类型","orderable": false},
                {
                    "data":"goodsOrderId",
                    "width": "10%",
                    "title":"订单状态",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return "已确认收货";
                    }
                },
                {
                    "data":"goodsOrderId",
                    "width": "15%",
                    "title":"操作",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return [
                            '<a class="btn btn-info btn-xs table-action comment" href="javascript:void(0)">',
                            '去评论 <i class="fa fa-eye"></i>',
                            '</a>',
                            '<a class="btn btn-primary btn-xs table-action scan" href="javascript:void(0)">',
                            '订单详情 <i class="fa fa-eye"></i>',
                            '</a>',
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
        tableAction();
    }

    function tableAction(){
        var table = $('#dataTable').DataTable();

        //查看订单详情
        table.on( 'click', '.scan', function () {
            var tr = $(this).children('tr:first');
            var data = table.row(tr).data();
            swal({
                title: "HTML <small>标题</small>!",
                text: "自定义<span style='color:#F8BB86'>html<span>信息。",
                html: true
        });
        });
        //订单确认
        table.on( 'click', '.confirm', function () {
            var tr = $(this).closest('tr');
            var data = table.row(tr).data();
            $.ajax({
                url: "/order/updateGoodsOrderStatus/" + "SUCCESS",
                data: {
                    goodsOrderId: data.goodsOrderId
                },
                success: function (result) {
                    if(result.code == 200){
                        layer.msg("该订单已确认!");
                        setTimeout(function () {
                            window.location.reload();
                        },2000)
                    }
                },
                error: function(result){
                    alert("系统出错")
                }
            })

        });
        //取消订单
        table.on( 'click', '.cancel', function () {
            var tr = $(this).closest('tr');
            var data = table.row(tr).data();
            $.ajax({
                url: "/order/updateGoodsOrderStatus/" + "CANCEL",
                data: {
                    goodsOrderId: data.goodsOrderId
                },
                success: function (result) {
                    if(result.code == 200){
                        layer.msg("取消订单成功!");
                        setTimeout(function () {
                            window.location.reload();
                        },2000)
                    }
                },
                error: function(result){
                    alert("系统出错")
                }
            })

        });
    }
</script>
</html>
