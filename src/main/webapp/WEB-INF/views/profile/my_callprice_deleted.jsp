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
        <font style="font-size: 24px"><b>我删除的</b></font>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="filter2" style="box-shadow: 0 5px 3px #e8e8e8;margin-top:20px">
        <ul style="list-style: none">
            <li class="active"><b>已删除报价实单</b></li>
            <li><b>已删除报价询单</b></li>
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
            case "已删除报价实单":
                fun1();
                break;
            case "已删除报价询单":
                fun2();
                break;
        }
    })
    $(document).ready(function () {
        fun1();
    });

    //获取已删除实单的列表
    function fun1(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/myaccept/realOrders/' + 'DELETED',
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
                {"data":"realOrderId","width":"7%","title":"","visible": false},
                {"data":"casNo","width": "10%","title":"CAS","orderable": false},
                {
                    "data":"image",
                    "width": "10%",
                    "title":"结构式",
                    "orderable": false,
                    "render": function (data, type, row) {
                        var html = '<div class="pull-left"><img src="' + row.pic + '" style="width: 60px;height: 60px;"></div>';
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
                        return "已删除";
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
                            '<a class="table-button btn btn-danger btn-xs table-action stop" href="javascript:void(0)">',
                            '恢复删除 <i class="fa fa-trash-o"></i>',
                            '</a>',
                            '<a class="table-button btn btn-danger btn-xs table-action stop" href="javascript:void(0)">',
                            '重新发单 <i class="fa fa-trash-o"></i>',
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

    }
  //已删除询单列表
    function fun2(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/myaccept/queryOrders/' + 'DELETED',
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
                {"data":"realOrderId","width":"7%","title":"","visible": false},
                {"data":"casNo","width": "10%","title":"CAS","orderable": false},
                {
                    "data":"image",
                    "width": "10%",
                    "title":"结构式",
                    "orderable": false,
                    "render": function (data, type, row) {
                        var html = '<div class="pull-left"><img src="' + row.pic + '" style="width: 60px;height: 60px;"></div>';
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
                        return "已删除";
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
                            '<a class="table-button btn btn-danger btn-xs table-action stop" href="javascript:void(0)">',
                            '修改订单 <i class="fa fa-trash-o"></i>',
                            '</a>',
                        ].join('');
                    }},
            ],
            "searching": false,
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

    }

</script>
</html>
