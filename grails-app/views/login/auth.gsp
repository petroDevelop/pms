<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0">
    <title>Login</title>
    <link href="${request.contextPath}/js/template/LuminoPro/css/bootstrap.min.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/LuminoPro/css/datepicker3.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/LuminoPro/css/styles.css" rel="stylesheet">
    <link href='${request.contextPath}/js/template/LuminoPro/css/latoFamily.css' rel='stylesheet' type='text/css'>
    <link href="${request.contextPath}/js/template/LuminoPro/css/skin.css" rel="stylesheet">
    <!--[if lt IE 9]>
<link href="${request.contextPath}/js/template/LuminoPro/css/rgba-fallback.css" rel="stylesheet">
<script src="${request.contextPath}/js/template/LuminoPro/js/html5shiv.js"></script>
<script src="${request.contextPath}/js/template/LuminoPro/js/respond.min.js"></script>
<![endif]-->
  <style>
    #login .box {
        display: none;
    }

    #login .box.active {
        display: block;
        -webkit-animation-name: fadeIn;
        animation-name: fadeIn;
    }
    /*输入框的字体颜色*/
    .form-control {
        color: #c9e8ff;
    }
    .row {
        margin-right: 0px;
        margin-left: 0px;
    }
  </style>
</head>
<body class="skin-1" id="login">

<div class="row box tile animated active" >
    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">

                <img src="${request.contextPath}/images/line.png"  style="height: 30px;border: 0px"/>
            </div>
            <div class="panel-body">
                <!-- Login -->
                <form role="form" id="box-login" action='${postUrl}' method='POST'  name="loginForm" autocomplete='off'>
                    <fieldset>
                        <div class="form-group">
                            <input type="text" class="form-control"  autofocus=""  name="j_username" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control"   name="j_password" placeholder="Password">
                        </div>

                        <div class="checkbox">
                            <label>
                               <!-- <input name="remember" type="checkbox" value="Remember Me">Remember Me  -->
                            </label>
                        </div>
                        <input type="submit" value="登录" class="btn btn-primary" />
                        <small>
                            <!--
                            <a class="box-switcher" data-switch="box-register" href="">注册</a> or
                            <a class="box-switcher" data-switch="box-reset" href="">忘记密码?</a>
                            -->
                        </small>
                    </fieldset>
                </form>

            </div>
        </div>
    </div><!-- /.col-->
</div><!-- /.row -->

<div class="row box animated tile">
    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">
                <img src="${request.contextPath}/images/line.png"  style="height: 30px;border: 0px"/></div>
            <div class="panel-body">

                <!-- Register -->
                <form class="" id="box-register">
                    <h2 class="m-t-0 m-b-15">注册</h2>
                    <input type="text" class="form-control" placeholder="Full Name">
                    <input type="text" class="form-control" placeholder="Username">
                    <input type="email" class="form-control" placeholder="Email Address">
                    <input type="password" class="form-control" placeholder="Password">
                    <input type="password" class="form-control m-b-20" placeholder="Confirm Password">

                    <input type="submit" value="注册" class="btn btn-primary" />
                    <small><a class="box-switcher" data-switch="box-login" href="">去登录</a></small>
                </form>


            </div>
        </div>
    </div><!-- /.col-->
</div><!-- /.row -->

<div class="row box animated tile">
    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">
                <img src="${request.contextPath}/images/line.png"  style="height: 30px;border: 0px"/></div>
            <div class="panel-body">
                <!-- Forgot Password -->
                <form id="box-reset">
                    <h2 class="m-t-0 m-b-15">重设密码</h2>
                    <p> .</p>
                    <input type="email" class="form-control m-b-20" placeholder="Email Address">
                    <input type="submit" value="重设密码" class="btn btn-primary" />
                    <small><a class="box-switcher" data-switch="box-login" href="">去登录</a></small>
                </form>
            </div>
        </div>
    </div><!-- /.col-->
</div><!-- /.row -->



<script src="${request.contextPath}/js/template/LuminoPro/js/jquery-1.11.1.min.js"></script>
<script src="${request.contextPath}/js/template/LuminoPro/js/bootstrap.min.js"></script>
<script src="${request.contextPath}/js/template/LuminoPro/js/chart.min.js"></script>
<script src="${request.contextPath}/js/template/LuminoPro/js/chart-data.js"></script>
<script src="${request.contextPath}/js/template/LuminoPro/js/easypiechart.js"></script>
<script src="${request.contextPath}/js/template/LuminoPro/js/easypiechart-data.js"></script>
<script src="${request.contextPath}/js/template/LuminoPro/js/bootstrap-datepicker.js"></script>
<script>
    !function ($) {
        $(document).on("click","ul.nav li.parent > a > span.icon", function(){
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show');
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    });


    /* --------------------------------------------------------
     Login + Sign up
     -----------------------------------------------------------*/
    (function(){
        $('body').on('click touchstart', '.box-switcher', function(e){
            e.preventDefault();
            var box = $(this).attr('data-switch');
            $(this).closest('.box').toggleClass('active');
            $('#'+box).closest('.box').addClass('active');
        });
    })();
</script>
</body>
</html>