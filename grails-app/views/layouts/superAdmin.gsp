<%
//    def uuid =sec.username()
//    def user=BaseUser.findByUsername(uuid)
def uuid="admin"
def user=['username':'admin']
%>
<%@ page import=" org.springframework.web.servlet.support.RequestContextUtils" %>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no">
    <meta charset="UTF-8">

    <meta name="description" content="Violate Responsive Admin Template">
    <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">

    <title><g:layoutTitle default="${g.message(code:'workSpace.message') }" /></title>

    <!-- CSS -->
    <link href="${request.contextPath}/js/template/super-admin/Template/css/bootstrap.min.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/animate.min.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/font-awesome.min.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/form.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/calendar.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/style.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/icons.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/super-admin/Template/css/generics.css" rel="stylesheet">

    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />


    <script src="${request.contextPath}/js/template/super-admin/Template/js/jquery.min.js"></script> <!-- jQuery Library -->


    <calendar:resources lang="${g.message(code:'calendar.message') }" theme="tiger"/>
    <g:layoutHead/>
</head>
<body id="skin-blur-violate">

<header id="header" class="media">
    <a href="" id="menu-toggle"></a>
    <a class="logo pull-left" href="${request.contextPath}/cms/workSpace">我的工作台</a>

    <div class="media-body">
        <div class="glyphicon glyphicon-log-out" id="glyphicon glyphicon-log-out">

                <a  href="${request.contextPath}/logout">

                 <b>注销</b>
                </a>
            </div>

        </div>
    </div>
</header>

<div class="clearfix"></div>

<section id="main" class="p-relative" role="main">

<!-- Sidebar -->
<aside id="sidebar">

    <!-- Sidbar Widgets -->
    <div class="side-widgets overflow">
        <!-- Profile Menu -->
        <div class="text-center s-widget m-b-25 dropdown" id="profile-menu">


            <h4 class="m-0">欢迎： ${user?.username}</h4><br/>
    <sec:ifAnyGranted roles="ROLE_MANAGER,ROLE_PREVIEW">
        <img src="${request.getContextPath()}/images/user.jpg">
    </sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_ADMIN">
        <img src="${request.getContextPath()}/images/admin.jpg">
    </sec:ifAnyGranted>

    
        </div>

        <!-- Calendar -->
        <div class="s-widget m-b-25">
            <div id="sidebar-calendar"></div>
        </div>



        <!-- Projects -->
        <div class="s-widget m-b-25">
            <h1 class="tile-title">
               栏目
            </h1>


        </div>
    </div>

    <!-- Side Menu -->
    <ul class="list-unstyled side-menu">
    <li class="dropdown">
        <a  class="sa-side-home" href=""></a>
        <span class="menu-item">系统管理</span>
        <ul class="list-unstyled menu-item">
        <li>
            <a  href="${request.contextPath}/baseUser/list">
                <span>人员管理</span>
            </a>
        </li>
            <li>
                <a  href="${request.contextPath}/baseUser/userManage">
                    <span>设备处人员管理</span>
                </a>
            </li>
            <li >
                <a href="${request.contextPath}/baseRole/list">
                    <span>角色管理</span>
                </a>
            </li>
            <li >
                <a href="${request.contextPath}/baseDepartment/list">
                    <span>部门管理</span>
                </a>
            </li>
            <li >
                <a href="${request.getContextPath()}/baseUserBaseRole/list">
                    <span>人员角色映射</span>
                </a>
            </li>
            <li >
                <a href="${request.getContextPath()}/requestmap/list">
                    <span>acl访问控制</span>
                </a>
            </li>
           </ul>
    </li>
    <li class="dropdown">
            <a class="sa-side-ui" href="#">
                <span class="menu-item">小队操作</span>
            </a>
            <ul class="list-unstyled menu-item">
                <li><a href="${request.contextPath}/baseUser/myTeam">小队人员管理</a></li>
                <li><a href="${request.contextPath}/rotation/list">班次管理</a></li>
                <li><a href="${request.contextPath}/position/list">岗位管理</a></li>
            </ul>
        </li>
    <li class="dropdown">
        <a class="sa-side-calendar" href=""></a>
        <span class="menu-item">设备管理</span>
        <ul class="list-unstyled menu-item">
            <li>
            <a href="${request.contextPath}/equipmentCatagory/list">
               设备分类管理
            </a></li>
            <li>
                <a  href="${request.contextPath}/standard/list">
                    设备分类标准管理
                </a></li>
            <li>
                <a href="${request.contextPath}/equipment/list">
                    设备台账管理
                </a></li>
           </ul>
        </li>
    <li class="dropdown">
        <a class="sa-side-ui" href="#">
            <span class="menu-item">工单操作</span>
        </a>
        <ul class="list-unstyled menu-item">
            <li><a href="${request.contextPath}/jobOrder/list">工单管理</a></li>
        </ul>
    </li>
    </ul>

</aside>

<!-- Content -->
<section id="content" class="container">
   <g:layoutBody/>

</section>


<!-- Older IE Message -->
<!--[if lt IE 9]>
                <div class="ie-block">
                    <h1 class="Ops">Ooops!</h1>
                    <p>You are using an outdated version of Internet Explorer, upgrade to any of the following web browser in order to access the maximum functionality of this website. </p>
                    <ul class="browsers">
                        <li>
                            <a href="https://www.google.com/intl/en/chrome/browser/">
                                <img src="${request.contextPath}/js/template/super-admin/Template/img/browsers/chrome.png" alt="">
                                <div>Google Chrome</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.mozilla.org/en-US/firefox/new/">
                                <img src="${request.contextPath}/js/template/super-admin/Template/img/browsers/firefox.png" alt="">
                                <div>Mozilla Firefox</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.opera.com/computer/windows">
                                <img src="${request.contextPath}/js/template/super-admin/Template/img/browsers/opera.png" alt="">
                                <div>Opera</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://safari.en.softonic.com/">
                                <img src="${request.contextPath}/js/template/super-admin/Template/img/browsers/safari.png" alt="">
                                <div>Safari</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://windows.microsoft.com/en-us/internet-explorer/downloads/ie-10/worldwide-languages">
                                <img src="${request.contextPath}/js/template/super-admin/Template/img/browsers/ie.png" alt="">
                                <div>Internet Explorer(New)</div>
                            </a>
                        </li>
                    </ul>
                    <p>Upgrade your browser for a Safer and Faster web experience. <br/>Thank you for your patience...</p>
                </div>   
            <![endif]-->
</section>

<!-- Javascript Libraries -->
<!-- jQuery -->

<script src="${request.contextPath}/js/template/super-admin/Template/js/jquery-ui.min.js"></script> <!-- jQuery UI -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/jquery.easing.1.3.js"></script> <!-- jQuery Easing - Requirred for Lightbox + Pie Charts-->

<!-- Bootstrap -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/bootstrap.min.js"></script>

<!-- Charts -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/charts/jquery.flot.js"></script> <!-- Flot Main -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/charts/jquery.flot.time.js"></script> <!-- Flot sub -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/charts/jquery.flot.animator.min.js"></script> <!-- Flot sub -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/charts/jquery.flot.resize.min.js"></script> <!-- Flot sub - for repaint when resizing the screen -->

<script src="${request.contextPath}/js/template/super-admin/Template/js/sparkline.min.js"></script> <!-- Sparkline - Tiny charts -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/easypiechart.js"></script> <!-- EasyPieChart - Animated Pie Charts -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/charts.js"></script> <!-- All the above chart related functions -->

<!-- Map -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/maps/jvectormap.min.js"></script> <!-- jVectorMap main library -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/maps/usa.js"></script> <!-- USA Map for jVectorMap -->

<!--  Form Related -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/icheck.js"></script> <!-- Custom Checkbox + Radio -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/select.min.js"></script> <!-- Custom Select -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/chosen.min.js"></script> <!-- Custom Multi Select -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/fileupload.min.js"></script> <!-- File Upload -->
<!-- UX -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/scroll.min.js"></script> <!-- Custom Scrollbar -->

<!-- Other -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/calendar.min.js"></script> <!-- Calendar -->
<!--
<script src="${request.contextPath}/js/template/super-admin/Template/js/feeds.min.js"></script>
-->
<!-- News Feeds -->


<!-- All JS functions -->
<script src="${request.contextPath}/js/template/super-admin/Template/js/functions.js"></script>
</body>
</html>