<%@ page import="com.petrodata.pms.core.BaseUser" %>
<!DOCTYPE html>
<html>
<head>
    <g:set var="currentUser" value="${com.petrodata.pms.core.BaseUser.findByUsername(sec.username())}"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><g:layoutTitle/></title>

    <link href="${request.contextPath}/js/template/LuminoPro/css/bootstrap.min.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/LuminoPro/css/datepicker3.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/LuminoPro/css/styles.css" rel="stylesheet">
    <link href='${request.contextPath}/js/template/LuminoPro/css/latoFamily.css' rel='stylesheet' type='text/css'>
    <link href="${request.contextPath}/js/template/LuminoPro/css/bootstrap-table.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/LuminoPro/css/font-awesome.min.css" rel="stylesheet">
    <link href="${request.contextPath}/js/template/LuminoPro/css/skin.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <link href="${request.contextPath}/js/template/LuminoPro/css/rgba-fallback.css" rel="stylesheet">
    <script src="${request.contextPath}/js/template/LuminoPro/js/html5shiv.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/respond.min.js"></script>
<![endif]-->

    <script src="${request.contextPath}/js/template/LuminoPro/js/jquery-1.11.1.min.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/bootstrap.min.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/chart.min.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/chart-data.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/easypiechart.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/easypiechart-data.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/bootstrap-datepicker.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/custom.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/bootstrap-table.js"></script>
    <script src="${request.contextPath}/js/template/LuminoPro/js/bootstrap-table1.7.0/locale/bootstrap-table-zh-CN.js"></script>

    <script src="${request.contextPath}/js/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
    <script src="${request.contextPath}/js/jquery-easyui-1.4.2/jquery.easyui.mobile.js"></script>

    <link rel="stylesheet" href="${request.contextPath}/js/EasyTree/css/easyTree.css">
    <script src="${request.contextPath}/js/EasyTree/src/easyTree.js"></script>
    <link href="${request.contextPath}/js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link href="${request.contextPath}/js/bootstrap-table-master/dist/bootstrap-table.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="${request.contextPath}/js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${request.contextPath}/js/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${request.contextPath}/js/bootstrap-table-master/dist/bootstrap-table.js" charset="UTF-8"></script>
    <g:layoutHead/>
    <style>
    /*页内多个界面的切换样式*/
     .box {
        display: none;
         -webkit-animation-name: fadeOut;
         animation-name: fadeOut;
    }
    .box.active {
        display: block;
        -webkit-animation-name: fadeIn;
        animation-name: fadeIn;
    }
     /*表格中鼠标滑过后的背景色*/
     .table-hover > tbody > tr:hover > td,
     .table-hover > tbody > tr:hover > th {
         background-color: #c0c0c0;
     }
     /*表格中checkbox选中行的背景色*/
     /* the same color with .active */
     .fixed-table-container tbody .selected td {
         background-color: #2f8ac3;
     }
     /*输入框的字体颜色*/
     .form-control {
         color: #c9e8ff;
     }

    select.form-control {
        background: none repeat scroll 0% 0% ;
        background-color:transparent;
    }
    select.form-control option{
        background-color:#619ECC;
    }
    .easy-tree{
        background-color:transparent;
    }

    .datetimepicker{
        background-color:transparent;
    }
    .form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
        background-color:transparent;
    }
    input[disabled], select[disabled], textarea[disabled], input[readonly], select[readonly], textarea[readonly] {
        background-color:transparent;
    }
    .input-group-addon{
        background-color:transparent;
    }
    .input-group[class*="col-"]  {
        padding-left: 15px;
        padding-right: 15px;
    }
    .input-group-addon {
        color:white;
    }
    select {
        background-color:transparent;
    }
    select option{
        background-color:transparent;
    }
    .dropdown-menu li label {
        color: #0000cc;
    }
    .sidebar ul.nav {
        font-size: 14px;
    }
    .breadcrumb{
        font-size: 14px;
    }
    .panel-heading{
        font-size: 14px;
    }
    </style>

    <link rel="stylesheet" type="text/css" href="${request.contextPath}/js/html5checkandradio/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/js/html5checkandradio/css/component.css" />
    <script src="${request.contextPath}/js/html5checkandradio/js/modernizr.custom.js"></script>
    <script src="${request.contextPath}/js/html5checkandradio/js/svgcheckbx.js"></script>
</head>

<body class="${currentUser.skin?:'skin-1'}">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><!--<span>生产设备</span>管理系统-->
            <img src="${request.contextPath}/images/line.png"  style="height: 25px;border: 0px"/>
            </a>
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown"><a>欢迎 ：<sec:username/></a></li>
                <!-- message -->
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="glyphicon glyphicon-envelope"></i>  <span class="label label-danger">0</span>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">

                        <li class="divider"></li>

                        <li>
                            <div class="all-button">
                                <a href="#">
                                    <em class="glyphicon glyphicon-inbox"></em> <strong>全部消息</strong>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- end message -->
                <!-- warning -->
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="glyphicon glyphicon-bell"></i>  <span class="label label-primary">0</span>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li class="divider"></li>

                        <li>
                            <div class="all-button">
                                <a href="#">
                                    <em class="glyphicon glyphicon-inbox"></em> <strong>全部提醒</strong>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- end warning-->
                <li class="dropdown"><a href="${request.contextPath}/logout"><span class="glyphicon glyphicon-user"></span> 退出</a></li>
            </ul>
        </div>
    </div><!-- /.container-fluid -->
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <form role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
    </form>
    <ul class="nav menu">
<sec:ifNotGranted roles="ROLE_MEMBER">
        <li ><a href="${request.contextPath}/"><span class="glyphicon glyphicon-dashboard"></span> 首页</a></li>
 </sec:ifNotGranted>
         <sec:ifAnyGranted roles="ROLE_ADMIN">
             <g:render template="/layouts/menu/admin"/>
         </sec:ifAnyGranted>
         <sec:ifAnyGranted roles="ROLE_MANAGER">
             <g:render template="/layouts/menu/manager"/>
         </sec:ifAnyGranted>
         <sec:ifAnyGranted roles="ROLE_PROJECT">
             <g:render template="/layouts/menu/project"/>
         </sec:ifAnyGranted>
         <sec:ifAnyGranted roles="ROLE_CAPTAIN">
             <g:render template="/layouts/menu/captain"/>
         </sec:ifAnyGranted>
         <sec:ifAnyGranted roles="ROLE_MEMBER">
             <g:render template="/layouts/menu/member"/>
         </sec:ifAnyGranted>
        <li role="presentation" class="divider"></li>
        <li><a href="${request.contextPath}/logout"><span class="glyphicon glyphicon-user"></span> 退出</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <g:layoutBody/>
</div>
<!--/.main-->

<script>
    $(document).ready(function() {
        /* --------------------------------------------------------
     Template Settings
     -----------------------------------------------------------*/

        var settings =  '<a id= "settings" href="#changeSkin" data-toggle="modal">' +
                '<i class="fa fa-gear"></i> 切换风格' +
                '</a>' +
                '<div class="modal fade" id="changeSkin" tabindex="-1" role="dialog" aria-hidden="true">' +
                '<div class="modal-dialog" >' +
                '<div class="modal-content">' +
                '<div class="modal-header">' +
                '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' +
                '<h4 class="modal-title">选择风格模式</h4>' +
                '</div>' +
                '<div class="modal-body">' +
                '<div class="row template-skins">' +
                '<a data-skin="skin-1" class="skin-1 skin-choise col-md-4" href="">' +
                '</a>' +
                '<a data-skin="skin-2" class="skin-2 skin-choise col-md-4" href="">' +
                '</a>' +
                '<a data-skin="skin-3" class="skin-3  skin-choise col-md-4" href="">' +
                '</a>' +
                '<a data-skin="skin-4" class="skin-4  skin-choise col-md-4" href="">' +
                '</a>' +
                '<a data-skin="skin-5" class="skin-5  skin-choise col-md-4" href="">' +
                '</a>' +
                '<a data-skin="skin-6" class="skin-6  skin-choise col-md-4" href="">' +
                '</a>' +
                '<a data-skin="skin-7" class="skin-7  skin-choise col-md-4" href="">' +
                '</a>' +
                '<a data-skin="skin-8" class="skin-8  skin-choise col-md-4" href="">' +
                '</a>' +
                '<a data-skin="skin-9" class="skin-9  skin-choise col-md-4" href="">' +
                '</a>' +
                '<a data-skin="skin-10" class="skin-10  skin-choise col-md-4" href="">' +
                '</a>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';
        $('body').prepend(settings);
        $('body').on('click', '.template-skins > a', function(e){
            e.preventDefault();
            var skin = $(this).attr('data-skin');
            var object={};
            object.skin=skin;
            $.get("${request.contextPath}/workspace/changeSkin", object,
                    function (data, textStatus) {
                    }, "json");
            $('body').attr('class', function(i, v){
                var classes = v.split(' ');
                for(var i=0;i<classes.length;i++){
                    if(classes[i].indexOf('skin-')>=0){
                        $('body').removeClass(classes[i]);
                    }
                }
                //position = $.inArray('class3', classes);
                //return classes.slice(0, position + 1).join(' ');
            });
            $('body').addClass(skin);
            $('#changeSkin').modal('hide');
        });
     });
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