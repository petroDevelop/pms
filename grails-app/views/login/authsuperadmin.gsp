<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no">
    <meta charset="UTF-8">

    <meta name="description" content="Violate Responsive Admin Template">
    <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">

    <title>Login</title>

    <!-- CSS -->
    <link href="${request.contextPath}/js/template/super-admin/Template/css/bootstrap.min.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/form.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/style.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/animate.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/generics.css" rel="stylesheet">
    <script>
        if(parent){
            if(parent.location.href.indexOf("${request.contextPath}/login/auth")<0){
                parent.location.href="${request.contextPath}/";
            }
        }

    </script>
</head>
<body id="skin-blur-violate" >
<section id="login" >
    <header>
        <h1>内容管理系统</h1>
        <p>系统登录.</p>
    </header>

    <div class="clearfix"></div>

    <!-- Login -->
    <form class="box tile animated active" id="box-login" action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
        <h2 class="m-t-0 m-b-15">Login</h2>


        <input type="text" class="login-control m-b-10" id="username" name="j_username" placeholder="Username or Email Address">
        <input type="password" class="login-control" id="password" name="j_password" placeholder="Password">
        <div class="checkbox m-b-20">
            <label>
                <input type="checkbox">
                Remember Me
            </label>
        </div>
        <button class="btn btn-sm m-r-5">Sign In</button>

        <small>
            <a class="box-switcher" data-switch="box-register" href="">Don't have an Account?</a> or
            <a class="box-switcher" data-switch="box-reset" href="">Forgot Password?</a>
        </small>
    </form>

    <!-- Register -->
    <form class="box animated tile" id="box-register">
        <h2 class="m-t-0 m-b-15">Register</h2>
        <input type="text" class="login-control m-b-10" placeholder="Full Name">
        <input type="text" class="login-control m-b-10" placeholder="Username">
        <input type="email" class="login-control m-b-10" placeholder="Email Address">
        <input type="password" class="login-control m-b-10" placeholder="Password">
        <input type="password" class="login-control m-b-20" placeholder="Confirm Password">

        <button class="btn btn-sm m-r-5">Register</button>

        <small><a class="box-switcher" data-switch="box-login" href="">Already have an Account?</a></small>
    </form>

    <!-- Forgot Password -->
    <form class="box animated tile" id="box-reset">
        <h2 class="m-t-0 m-b-15">Reset Password</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu risus. Curabitur commodo lorem fringilla enim feugiat commodo sed ac lacus.</p>
        <input type="email" class="login-control m-b-20" placeholder="Email Address">

        <button class="btn btn-sm m-r-5">Reset Password</button>

        <small><a class="box-switcher" data-switch="box-login" href="">Already have an Account?</a></small>
    </form>
</section>

<!-- Javascript Libraries -->
<!-- jQuery -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/jquery.min.js"></script> <!-- jQuery Library -->

<!-- Bootstrap -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/bootstrap.min.js"></script>

<!--  Form Related -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/icheck.js"></script> <!-- Custom Checkbox + Radio -->

<!-- All JS functions -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/functions.js"></script>
<script>
    $(document).ready(function() {
        $('#username').focus();
    });
</script>
</body>
</html>