<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>正常用户列表页面</title>

    <link href="/static/css/bootstrap1/bootstrap.css" rel="stylesheet">
    <link href="/static/css/bootstrap1/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/plugins/dataTables/datatables.min.css">
    <link href="/static/css/animate/animate.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <!--sweet alert css-->
    <link href="/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <!-- Mainly scripts -->
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap/bootstrap.js"></script>
    <script src="/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="/static/js/inspinia.js"></script>
    <!--datatables-->
    <script src="/static/js/plugins/dataTables/datatables.min.js"></script>
    <script src="/static/js/plugins/pace/pace.min.js"></script>
    <!--sweetalert scripts-->
    <script src="/static/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>

</head>

<body>

<div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="/static/img/profile_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                                <span class="block m-t-xs">
                                    <c:if test="${currentAdmin != null}">
                                        <strong class="font-bold">${currentAdmin.adminName}</strong>
                                    </c:if>
                                    <c:if test="${currentAdmin == null}">
                                        <strong class="font-bold">未登录</strong>
                                    </c:if>

                                </span>
                                <span class="text-muted text-xs block">操作<b class="caret"></b></span>
                            </span>
                        </a>
                        <c:if test="${currentAdmin != null}">
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="/admin/logout">退出</a></li>
                            </ul>
                        </c:if>
                        <c:if test="${currentAdmin == null}">
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="/admin/page/login">登录</a></li>
                            </ul>
                        </c:if>
                        </#if>
                    </div>
                    <div class="logo-element">
                        IN+
                    </div>
                </li>
                <li>
                    <a href="/admin/page/index"><i class="fa fa-th-large"></i> <span class="nav-label">用户管理</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="/admin/member/normalMembers.html">正常用户</a></li>
                        <li><a href="/admin/member/forbiddenMembers.html">拉黑用户</a></li>
                    </ul>
                </li>
                <li>
                    <a href="css_animation.html#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">实名审核管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="/admin/certification/certificated.html">已审核</a></li>
                        <li><a href="/admin/certification/certificating.html">待审核</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="css_animation.html#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message" style="height:40px;line-height: 40px;">欢迎来到精细化工后台!</span>
                    </li>
                    <li class="dropdown">
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46h ago</small>
                                        <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
                                        <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">5h ago</small>
                                        <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica Smith</strong>. <br>
                                        <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/profile.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right">23h ago</small>
                                        <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                        <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="mailbox.html">
                                        <i class="fa fa-envelope"></i> <strong>Read All Messages</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="grid_options.html">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html">
                                        <strong>See All Alerts</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>

            </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>正常用户列表</h2>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <a id="back" hidden="hidden"> <i class="fa fa-reply" style="color: #777777"></i></a>
                        </div>
                        <div class="ibox-content">
                            <div class="table-responsive">
                                <table id="datatable" class="table table-striped table-bordered table-hover dataTables-example" >
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
        <div class="footer">
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2017
            </div>
        </div>

    </div>
</div>

</body>
<script>
    $('#datatable').DataTable({
        "ajax": {
            'url': '/admin/member/listNormalMembers',
            "data": function(d) {
                var param = {};
                param.page = d.start/d.length + 1;
                param.pageSize = d.length;
                param.draw = d.draw;
                param.orderColumn = d.columns[d.order[0]['column']]['data'];
                param.orderType = d.order[0]['dir'];
                param.searchKey = d.search["value"];
                return param;
            },
        },
        "columns": [
            {"data":"userId","width":"7%","title":"","visible": false},
            {"data":"userName","width": "10%","title":"手机号","orderable": false},
            {"data":"state","width": "10%","title":"账号状态","orderable": false},
            {"data":"createTime1","width": "10%","title":"创建时间","orderable": false},
            {
                "data":"userId",
                "width": "8%",
                "title":"操作",
                "orderable": false,
                "render": function (data, type, row) {
                        return [
                            '<a class="btn btn-danger btn-xs table-action btn-block forbid">',
                            '拉黑 <i class="fa fa-times"></i>',
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
    $.fn.dataTable.ext.errMode = 'none'; //不显示任何错误信息
    var table = $('#datatable').DataTable();
    // 拉黑用户
    table.on( 'click', '.forbid', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        $.ajax({
                url: "/admin/member/forbidMember",
                data:{
                    userId: data.userId
                },
                success: function (result) {
                    if(result.code == 200){
                        layer.msg("拉黑该用户成功!");
                        setTimeout(function () {
                            window.location.reload();
                        },1500);
                    }
                }
            })
    });
</script>
</html>
