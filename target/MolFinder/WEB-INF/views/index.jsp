<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/index.css">
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>
<div class="hr-line-dashed" style="margin-top: 10px"></div>
<div class="menus" style="font-size: 24px;font-weight: 600;margin-bottom: 140px">
    <div class="row1">
        <div class="col-md-4 text-right"><a href="#">实单</a></div>
        <div class="col-md-4 text-center"><a href="#">询单</a></div>
        <div class="col-md-4 text-left"><a href="#">原料采购</a></div>
    </div>
    <div class="row2" style="margin-top: 40px">
        <div class="col-md-4 text-right"><a href="#">发布实单</a></div>
        <div class="col-md-4 text-center"><a href="#">发布询单</a></div>
        <div class="col-md-4 text-left"><a href="#">原料供应</a></div>
    </div>
</div>
<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="/static/img/banner06.png" alt="First slide">
        </div>
        <div class="item">
            <img src="/static/img/banner06.png" alt="Second slide">
        </div>
        <div class="item">
            <img src="/static/img/banner06.png" alt="Third slide">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">‹</a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">›</a>
</div>
<!--定制实单-->
<div class="col-lg-12 text-center real-bill"><h3><i class="fa fa-building-o" style="color: red"></i>定制实单</h3></div>
<div class="row text-center" style="position: relative;top:40px;width: 66%; margin:0 auto">
    <div class="col-md-6">
        <a href="#" class="thumbnail" style="text-decoration: none">
            <div class="description" style="height: 200px">
                <div class="img col-md-4">
                    <img src="/static/img/kittens.jpg" alt="通用的占位符缩略图" style="width: 100%; height: 150px;border: 0"/>
                </div>
                <div class="word col-md-7 col-md-offset-1" style="color: #000; text-align: left">
                    <h4>CAS号:34351</h4>
                    <p style="text-align: left">
                        <span>纯度:98</span></br>
                        实单价:<font color="red" style="font-size: 24px">3000~4000</font><br/>
                        采购量:<font color="red">98g</font><br/>
                        交货期:<font color="red">3~4</font>周<br/>
                        已报名:<font color="red">98</font>人
                    </p>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="deadline text-left" style="height: 60px;">
                <div style="color: black" class="col-md-8">
                    <i class="fa fa-clock-o fa-2x"></i>
                    <span style="font-size: 20px;font-weight: 400">0天2小时40分钟20秒</span>
                </div>
                <div class="col-md-4">
                    <button class="btn btn-danger col-md-12">立即抢单</button>
                </div>
            </div>
        </a>
    </div>

    <div class="col-md-6">
        <a href="#" class="thumbnail" style="text-decoration: none">
            <div class="description" style="height: 200px">
                <div class="img col-md-4">
                    <img src="/static/img/kittens.jpg" alt="通用的占位符缩略图" style="width: 100%; height: 150px;border: 0"/>
                </div>
                <div class="word col-md-7 col-md-offset-1" style="color: #000; text-align: left">
                    <h4>CAS号:34351</h4>
                    <p style="text-align: left">
                        <span>纯度:98</span></br>
                        实单价:<font color="red" style="font-size: 24px">3000~4000</font><br/>
                        采购量:<font color="red">98g</font><br/>
                        交货期:<font color="red">3~4</font>周<br/>
                        已报名:<font color="red">98</font>人
                    </p>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="deadline text-left" style="height: 60px;">
                <div style="color: black" class="col-md-8">
                    <i class="fa fa-clock-o fa-2x"></i>
                    <span style="font-size: 20px;font-weight: 400">0天2小时40分钟20秒</span>
                </div>
                <div class="col-md-4">
                    <button class="btn btn-danger col-md-12">立即抢单</button>
                </div>
            </div>
        </a>
    </div>

    <div class="col-md-6">
        <a href="#" class="thumbnail" style="text-decoration: none">
            <div class="description" style="height: 200px">
                <div class="img col-md-4">
                    <img src="/static/img/kittens.jpg" alt="通用的占位符缩略图" style="width: 100%; height: 150px;border: 0"/>
                </div>
                <div class="word col-md-7 col-md-offset-1" style="color: #000; text-align: left">
                    <h4>CAS号:34351</h4>
                    <p style="text-align: left">
                        <span>纯度:98</span></br>
                        实单价:<font color="red" style="font-size: 24px">3000~4000</font><br/>
                        采购量:<font color="red">98g</font><br/>
                        交货期:<font color="red">3~4</font>周<br/>
                        已报名:<font color="red">98</font>人
                    </p>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="deadline text-left" style="height: 60px;">
                <div style="color: black" class="col-md-8">
                    <i class="fa fa-clock-o fa-2x"></i>
                    <span style="font-size: 20px;font-weight: 400">0天2小时40分钟20秒</span>
                </div>
                <div class="col-md-4">
                    <button class="btn btn-danger col-md-12">立即抢单</button>
                </div>
            </div>
        </a>
    </div>
    <div class="more">
        <button class="btn btn-primary btn-rounded btn-block" href="#"><i class="fa fa-spinner"></i> 更多实单</button>
    </div>
</div>

<!--定制询单-->
<div class="col-lg-12 text-center enquiry-bill"><h3><i class="fa fa-question-circle-o" style="color: red"></i>定制询单</h3></div>
<div class="row text-center enquiry-main" style="position: relative;top:40px;width: 66%; margin:0 auto">
    <div class="col-md-6">
        <a href="#" class="thumbnail" style="text-decoration: none">
            <div class="description" style="height: 200px">
                <div class="img col-md-4">
                    <img src="/static/img/kittens.jpg" alt="通用的占位符缩略图" style="width: 100%; height: 150px;border: 0"/>
                </div>
                <div class="word col-md-7 col-md-offset-1" style="color: #000; text-align: left">
                    <h4>CAS号:34351</h4>
                    <p>纯度:98</p>
                    <p>采购量:<font color="red">98g</font></p>
                    <p>交货期:<font color="red">3~4</font>周</p>
                    <p>已报名:<font color="red">98</font>人</p>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="deadline text-left" style="height: 60px;">
                <div style="color: black" class="col-md-8">
                    <i class="fa fa-clock-o fa-2x"></i>
                    <span style="font-size: 20px;font-weight: 400">0天2小时40分钟20秒</span>
                </div>
                <div class="col-md-4">
                    <button class="btn btn-danger col-md-12">立即报价</button>
                </div>
            </div>
        </a>
    </div>

    <div class="col-md-6">
        <a href="#" class="thumbnail" style="text-decoration: none">
            <div class="description" style="height: 200px">
                <div class="img col-md-4">
                    <img src="/static/img/kittens.jpg" alt="通用的占位符缩略图" style="width: 100%; height: 150px;border: 0"/>
                </div>
                <div class="word col-md-7 col-md-offset-1" style="color: #000; text-align: left">
                    <h4>CAS号:34351</h4>
                    <p>纯度:98</p>
                    <p>采购量:<font color="red">98g</font></p>
                    <p>交货期:<font color="red">3~4</font>周</p>
                    <p>已报名:<font color="red">98</font>人</p>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="deadline text-left" style="height: 60px;">
                <div style="color: black" class="col-md-8">
                    <i class="fa fa-clock-o fa-2x"></i>
                    <span style="font-size: 20px;font-weight: 400">0天2小时40分钟20秒</span>
                </div>
                <div class="col-md-4">
                    <button class="btn btn-danger col-md-12">立即报价</button>
                </div>
            </div>
        </a>
    </div>

    <div class="col-md-6">
        <a href="#" class="thumbnail" style="text-decoration: none">
            <div class="description" style="height: 200px">
                <div class="img col-md-4">
                    <img src="/static/img/kittens.jpg" alt="通用的占位符缩略图" style="width: 100%; height: 150px;border: 0"/>
                </div>
                <div class="word col-md-7 col-md-offset-1" style="color: #000; text-align: left">
                    <h4>CAS号:34351</h4>
                    <p>纯度:98</p>
                    <p>采购量:<font color="red">98g</font></p>
                    <p>交货期:<font color="red">3~4</font>周</p>
                    <p>已报名:<font color="red">98</font>人</p>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="deadline text-left" style="height: 60px;">
                <div style="color: black" class="col-md-8">
                    <i class="fa fa-clock-o fa-2x"></i>
                    <span style="font-size: 20px;font-weight: 400">0天2小时40分钟20秒</span>
                </div>
                <div class="col-md-4">
                    <button class="btn btn-danger col-md-12">立即报价</button>
                </div>
            </div>
        </a>
    </div>
    <div class="more">
        <button class="btn btn-primary btn-rounded btn-block" href="#"><i class="fa fa-spinner"></i> 更多询单</button>
    </div>
    <div class="hr-line-dashed"></div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
</body>
<script>
    $(function(){
        // 初始化轮播
            $("#myCarousel").carousel('cycle');

    });


</script>
</html>