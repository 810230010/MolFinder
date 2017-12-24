<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link href="/static/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>
    <script src="/static/js/plugins/dataTables/datatables.min.js"></script>
    <script src="/static/js/plugins/sweetalert/sweetalert.min.js"></script>
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
        <font style="font-size: 24px"><b>我报价的实单</b></font>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="filter2" style="box-shadow: 0 5px 3px #e8e8e8;margin-top:20px">
        <ul style="list-style: none">
            <li class="active"><b>抢单中</b></li>
            <li><b>派单中</b></li>
            <li><b>已派单</b></li>
            <li><b>已取消</b></li>
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
            case "抢单中":
                fun1();
                break;
            case "派单中":
                fun2();
                break;
            case "已派单":
                fun3();
                break;
            case "已取消":
                fun4();
                break;
        }
    })
    $(document).ready(function () {
        fun1();
    });

    //获取已报价实单抢单状态列表
    function fun1(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/profile/myaccept/realOrders/' + 'BIDDING',
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
                {"data":"realCallId","width":"7%","title":"报价编号"},
                {"data":"realOrderId","width":"7%","title":"实单编号"},
                {"data":"companyName","width": "10%","title":"发单者","orderable": false},
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
                {"data":"callPriceMoney","width": "10%","title":"价格/含量","orderable": false},
                {"data":"callSubmitDeadline","width": "10%","title":"交货期","orderable": false},
                {"data":"casNo","width": "10%","title":"其他设置","orderable": false,
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
                    "data":"createTime",
                    "width": "10%",
                    "title":"报价时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data":"state",
                    "width": "10%",
                    "title":"是否中标",
                    "orderable": true,
                    "render": function (data, type, row) {
                       return "抢单中";
                    }
                },
                {"data":"casNo","width": "10%","title":"积分奖励","orderable": false},
                {
                    "data":"realCallId",
                    "width": "15%",
                    "title":"操作",
                    "orderable": false,
                    "render": function (data, type, row) {
                        return [
                            '<a class="btn btn-primary btn-xs table-action update" href="javascript:void(0)">',
                            '修改 <i class="fa fa-eye"></i>',
                            '</a>',
                            '<a class="table-button btn btn-danger btn-xs table-action cancel" href="javascript:void(0)">',
                            '取消报价 <i class="fa fa-trash-o"></i>',
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
  //派单中列表
    function fun2(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/profile/myaccept/realOrders/' + 'SENDING',
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
                {"data":"realCallId","width":"7%","title":"报价编号"},
                {"data":"realOrderId","width":"7%","title":"实单编号"},
                {"data":"prepayedMoneyAmount","width":"7%","title":"","visible": false},
                {"data":"companyName","width": "10%","title":"发单者","orderable": false},
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
                {"data":"callPriceMoney","width": "10%","title":"价格/含量","orderable": false},
                {"data":"callSubmitDeadline","width": "10%","title":"交货期","orderable": false},
                {"data":"casNo","width": "10%","title":"其他设置","orderable": false,
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
                    "data":"createTime",
                    "width": "10%",
                    "title":"报价时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data":"state",
                    "width": "10%",
                    "title":"是否中标",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return "派单中";
                    }
                },
                {"data":"casNo","width": "10%","title":"积分奖励","orderable": false},
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
    //已派单列表
    function fun3(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/profile/myaccept/realOrders/' + 'SENDED',
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
                {"data":"realCallId","width":"7%","title":"报价编号"},
                {"data":"realOrderId","width":"7%","title":"实单编号"},
                {"data":"prepayedMoneyAmount","width":"7%","title":"","visible": false},
                {"data":"vilationMoneyAmount","width":"7%","title":"","visible": false},
                {"data":"companyName","width": "10%","title":"发单者","orderable": false},
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
                {"data":"callPriceMoney","width": "10%","title":"价格/含量","orderable": false},
                {"data":"callSubmitDeadline","width": "10%","title":"交货期","orderable": false},
                {"data":"casNo","width": "10%","title":"其他设置","orderable": false,
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
                    "data":"createTime",
                    "width": "10%",
                    "title":"报价时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data":"state",
                    "width": "10%",
                    "title":"是否中标",
                    "orderable": true,
                    "render": function (data, type, row) {
                        if(data == 'HERE'){
                            return "已派单到这里";
                        }else
                            return "派单至别处";
                    }
                },
                {"data":"casNo","width": "10%","title":"积分奖励","orderable": false},
                {
                    "data":"realCallId",
                    "width": "10%",
                    "title":"操作",
                    "orderable": false,
                    "render": function (data, type, row) {
                        if(row.state == 'HERE'){
                            return [
                                '<a class="btn btn-primary btn-xs table-action scan" href="javascript:void(0)">',
                                '订单确认 <i class="fa fa-eye"></i>',
                                '</a>'
                            ].join('');
                        }else{
                            return [
                                '<a class="table-button btn btn-danger btn-xs table-action delete" href="javascript:void(0)">',
                                '删除 <i class="fa fa-trash-o"></i>',
                                '</a>',
                            ].join('');
                        }

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
    //已取消列表
    function fun4(){
        $('#dataTable').DataTable({
            "ajax": {
                'url': '/profile/myaccept/realOrders/' + 'CANCEL',
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
                {"data":"realCallId","width":"7%","title":"报价编号"},
                {"data":"realOrderId","width":"7%","title":"实单编号"},
                {"data":"prepayedMoneyAmount","width":"7%","title":"","visible": false},
                {"data":"vilationMoneyAmount","width":"7%","title":"","visible": false},
                {"data":"companyName","width": "10%","title":"发单者","orderable": false},
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
                {"data":"callPriceMoney","width": "10%","title":"价格/含量","orderable": false},
                {"data":"callSubmitDeadline","width": "10%","title":"交货期","orderable": false},
                {"data":"casNo","width": "10%","title":"其他设置","orderable": false,
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
                    "data":"createTime",
                    "width": "10%",
                    "title":"报价时间",
                    "orderable": true,
                    "render": function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data":"state",
                    "width": "10%",
                    "title":"是否中标",
                    "orderable": true,
                    "render": function (data, type, row) {
                        if(data == 'CANCEL') return '已取消';
                        else
                            return '买家已取消';
                    }
                },
                {"data":"casNo","width": "10%","title":"积分奖励","orderable": false},
                {
                    "data":"realCallId",
                    "width": "10%",
                    "title":"操作",
                    "orderable": false,
                    "render": function (data, type, row) {
                            return [
                                '<a class="table-button btn btn-danger btn-xs table-action delete" href="javascript:void(0)">',
                                '删除 <i class="fa fa-trash-o"></i>',
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
    tableAction()
    }

    function tableAction(){
        var table = $('#dataTable').DataTable();
        table.on( 'click', '.update', function () {
            var realCallId = $(this).parent().siblings().first().text();
            var realOrderId = $(this).parent().siblings().first().next().text();
            window.top.location = "/real/realCallpriceUpdatePage?realOrderId=" + realOrderId + "&realCallId=" + realCallId;
        });
        table.on( 'click', '.cancel', function () {
            var realCallId = $(this).parent().siblings().first().text();
            $.ajax({
                url: "/real/cancelMyRealCallprice",
                data: {
                    realCallId: realCallId
                },
                success: function (result) {
                    if(result.code == 200){
                       layer.msg("取消实单报价成功!");
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
