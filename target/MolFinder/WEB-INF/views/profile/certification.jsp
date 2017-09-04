<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@include file="/WEB-INF/views/common/resource_css.jsp"%>
<link href="/static/css/plugins/select2/select2.min.css" rel="stylesheet">
<!-- 文件上传 -->
<link href="/static/css/plugins/fileinput/fileinput.min.css" media="all" rel="stylesheet" type="text/css"/>
<script src="/static/js/jquery-3.1.1.min.js"></script>
<script src="/static/js/plugins/select2/select2.full.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/plugins/layer/layer.js"></script>
<script src="/assets/admin/js/plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>
<!-- 文件上传 -->
<script src="/static/js/plugins/fileinput/fileinput.min.js" type="text/javascript"></script>
<script src="/static/js/plugins/fileinput/zh.js" type="text/javascript"></script>
<script src="/static/js/plugins/fileinput/theme.js" type="text/javascript"></script>
<!-- Jquery Validate -->
<script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/js/plugins/validate/messages_zh.js"></script>
<html>
<head>
    <title>实名认证</title>
</head>
<body style="background-color: white;">
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>实名认证</h2>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h3>填写资料</h3>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" id="form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">认证类型</label>
                            <div class="col-sm-6">
                                <select id="type" name="parentId" class="parent_select form-control">
                                    <option value="PERSONAL">个人实验室</option>
                                    <option value="COMPANY">企业用户</option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="companyName">所在企业:</label>
                            <div class="col-sm-6">
                                <input id="companyName" name="name" type="text" class="form-control" readonly value="无" required/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="username">用户名:</label>
                            <div class="col-sm-6">
                                <input id="username" name="username" class="form-control" type="text" required />
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="phone">手机号:</label>
                            <div class="col-sm-6">
                                <input id="phone" name="sort" class="form-control" type="text" required/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="realname">真实姓名:</label>
                            <div class="col-sm-6">
                                <input id="realname" name="realname" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="qq">qq:</label>
                            <div class="col-sm-6">
                                <input id="qq" name="qq" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group" id="material">
                            <label class="col-sm-2 control-label" for="upload-image">认证材料</label>
                            <div class="col-sm-10">
                                <input id="upload-image" class="file" name="file" type="file" multiple>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-12 text-center">
                                <input class="btn btn-success" type="submit" id="submit" value="提交">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(".parent_select").select2({
        minimumResultsForSearch: -1
    }).on("select2:select",function(e){
        if($("#type").val() == '企业用户'){
            $("#companyName").removeAttr('readonly');
            $("#companyName").val('');
        }else{
            $("#companyName").attr('readonly', 'readonly');
            $("#companyName").val('无');
        }
    });

    var img = "";
    $('#upload-image').fileinput({
        language: 'zh',
        uploadUrl: 'http://up.qiniu.com',
        allowedFileExtensions: ['jpg', 'png', 'gif', 'jpeg'],
        showUpload: false, //是否显示上传按钮
        showRemove: false,
        uploadAsync: true,
        browseClass: "btn btn-primary", //按钮样式
        msgFilesTooMany: "选择上传的文件数量({1}) 超过允许的最大数值{6}！",
        uploadExtraData: {
            token: "${uploadToken}"
        },
        maxFileCount: 3,
        deleteUrl: "/utils/donothing",
        initialPreviewAsData: true,
        initialPreview: [],
        initialPreviewConfig: [],
    }).on("fileuploaded", function (event, data, previewId, index) {
        var img_dom = $(".kv-file-content img[title='"+data.filenames[index]+"']");
        img_dom.attr('src', '${domain}'+data.response.key);
        img += img_dom.attr('src') + ",";
    }).on("filebatchselected", function (event, files) {
        $(this).fileinput("upload");
    });
    $('.file-preview-thumbnails').parent().css('height','25%');

    $("#form").validate({
        submitHandler:function(form){
            var images = "";
            var imgs_dom = $("#material .kv-zoom-cache .kv-file-content img");
            var flag = 0;
            imgs_dom.each(function (index, item) {
                if (flag ==0){
                    images += item.src;
                    flag = 1;
                }else{
                    images += "," + item.src;
                }
            });
            if(images == ""){
                layer.msg("上传资料不得为空")
                return;
            }
            var companyName = $("#type").val() == "PERSONAL"?null:$("#companyName").val();
            $.ajax({
                url: "/profile/certificate",
                data:{
                   userId:${currentUser.userId},
                   certificateType: $("#type").val(),
                   companyName: companyName,
                   username: $("#username").val(),
                   phone: $("#phone").val(),
                   realname: $("#realname").val(),
                   qq: $("#qq").val(),
                   guaranteenMaterial: images
                },
                success:function(result){
                   if(result.code == 200){
                       swal({
                           title: "成功!",
                           text: "您的实名认证请求已提交,等待验证!",
                           type: "success",
                           showConfirmButton: false,
                           timer: 2000,
                       });
                       setTimeout(function () {
                           window.location.reload();
                       }, 2000);
                   }
                },
                error:function(result){
                    alert("系统出错")
                }
            })
        },
        invalidHandler: function(form, validator) {return false;}
    });

</script>
</html>
