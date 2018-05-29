<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link href="/static/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>
    <script src="/static/js/plugins/dataTables/datatables.min.js"></script>
    <script src="/static/js/util.js"></script>
    <style>
        .filter2 ul{height: 40px;padding-left: 0px;background: #f8f8f8}
        .filter2 ul li{height:40px;float: left;line-height: 40px;padding: 0 15px;cursor: pointer}
        .filter2 .active{background-color: #c23;color: white}
    </style>
</head>
<body style="background-color: white">
<div style="padding-top: 30px;">
    <div style="border-left: 5px solid #c23;height:44px;line-height:44px;padding-left:10px;box-shadow: grey">
        <font style="font-size: 24px"><b>我的询单</b></font>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="filter2" style="box-shadow: 0 5px 3px #e8e8e8;margin-top:20px">
        <ul style="list-style: none">
            <li class="active"><b>询单中</b></li>
            <li><b>已派单</b></li>
            <li><b>停止询价</b></li>
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
            case "询单中":
                fun1();
                break;
            case "已派单":
                fun2();
                break;
            case "停止询价":
                fun3();
                break;
        }
    })
    $(document).ready(function () {
        fun1();
    });

    //获取询价中的列表
    function fun1(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/profile/mypublish/queryOrders/' + "ONSALE",
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
                {"data":"queryOrderId","width":"7%","title":"询单编号"},
                {"data":"casNo","width": "10%","title":"CAS","orderable": false},
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
                {
                    "data":"beginTime",
                    "width": "10%",
                    "title":"发布时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data":"endTime",
                    "width": "10%",
                    "title":"报价结束时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {"data":"joinCount","width": "10%","title":"报价人数","orderable": true},
                {
                    "data":"state",
                    "width": "10%",
                    "title":"状态",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return "询价中";
                    }
                },
                {
                    "data":"queryOrderId",
                    "width": "15%",
                    "title":"操作",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return [
                            '<a class="btn btn-primary btn-xs table-action scan" href="javascript:void(0)">',
                            '查看报价 <i class="fa fa-eye"></i>',
                            '</a>',
                            '<a class="table-button btn btn-danger btn-xs table-action stop" href="javascript:void(0)">',
                            '停止询价 <i class="fa fa-trash-o"></i>',
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
    //停止询价
    function fun2(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/profile/mypublish/queryOrders/' + "STOPPED",
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
                {"data":"queryOrderId","width":"7%","title":"询单编号","visible": false},
                {"data":"casNo","width": "10%","title":"CAS","orderable": false},
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
                {
                    "data":"beginTime",
                    "width": "10%",
                    "title":"开始时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data":"endTime",
                    "width": "10%",
                    "title":"结束时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {"data":"joinCount","width": "10%","title":"抢单人数","orderable": true},
                {
                    "data":"state",
                    "width": "10%",
                    "title":"状态",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return "已停止";
                    }
                },
                {
                    "data":"queryOrderId",
                    "width": "15%",
                    "title":"操作",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return [
                            '<a class="btn btn-primary btn-xs table-action scan" href="javascript:void(0)">',
                            '查看报价 <i class="fa fa-eye"></i>',
                            '</a>',
                            '<a class="table-button btn btn-success btn-xs table-action again" href="javascript:void(0)">',
                            '再次询价 <i class="fa fa-rotate-left(alias)"></i>',
                            '</a>',
                            '<a class="table-button btn btn-danger btn-xs table-action delete" href="javascript:void(0)">',
                            '删除 <i class="fa fa-trash-o"></i>',
                            '</a>',
                        ].join('');
                    }},
            ],
            "searching": true,
            "ordering":true,
            "serverSide": true,
            "lengthMenu": [ 5, 10, 15],
            "deferRender": true,
            "processing": true,
            "autoWidth": false,
            "destroy": true,
            "responsive": true,
            "dom": '<"html5buttons"B>lTfgitp',
            "buttons": [],
            "language": {
                "url": "/static/js/plugins/dataTables/Chinese.json",
            }
        });
        tableAction();
    }
    //已派单
    function fun3(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/profile/mypublish/queryOrders/' + "SENDED",
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
                {"data":"queryOrderId","width":"7%","title":"询单编号"},
                {"data":"casNo","width": "10%","title":"CAS","orderable": false},
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
                {
                    "data":"beginTime",
                    "width": "10%",
                    "title":"开始时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data":"endTime",
                    "width": "10%",
                    "title":"结束时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {"data":"joinCount","width": "10%","title":"抢单人数","orderable": true},
                {
                    "data":"state",
                    "width": "10%",
                    "title":"状态",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return "已派单";
                    }
                },
                {
                    "data":"realOrderId",
                    "width": "15%",
                    "title":"操作",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return [
                            '<a class="btn btn-primary btn-xs table-action scan" href="javascript:void(0)">',
                            '查看报价 <i class="fa fa-eye"></i>',
                            '</a>',
                            '<a class="table-button btn btn-danger btn-xs table-action update" href="javascript:void(0)">',
                            '修改 <i class="fa fa-trash-o"></i>',
                            '</a>',
                            '<a class="table-button btn btn-danger btn-xs table-action again" href="javascript:void(0)">',
                            '再次发单 <i class="fa fa-trash-o"></i>',
                            '</a>',
                            '<a class="table-button btn btn-danger btn-xs table-action delete" href="javascript:void(0)">',
                            '删除 <i class="fa fa-trash-o"></i>',
                            '</a>'
                        ].join('');
                    }},
            ],
            "searching": true,
            "ordering":true,
            "serverSide": true,
            "lengthMenu": [ 5, 10, 15],
            "deferRender": true,
            "processing": true,
            "autoWidth": false,
            "destroy": true,
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
        table.on( 'click', '.scan', function () {
            var queryOrderId = $(this).parent().siblings().first().text();
            window.top.location = "/enquiry/queryCallpriceMembersPage?queryOrderId=" + queryOrderId;
        });
        table.on( 'click', '.stop', function () {
            var queryOrderId = $(this).parent().siblings().first().text();
            $.ajax({
                url: "/enquiry/closeMyQueryOrder",
                data: {
                    queryOrderId: queryOrderId
                },
                success: function (result) {
                    if(result.code == 200){
                        swal("关闭询单成功!", "该询单已停止发布!", "success");
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
