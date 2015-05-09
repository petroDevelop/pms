<!DOCTYPE html>
<html>
<head>
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
    <link rel="stylesheet" href="${request.contextPath}/js/EasyTree/css/easyTree.css">
    <script src="${request.contextPath}/js/EasyTree/src/easyTree.js"></script>
    <link href="${request.contextPath}/js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="${request.contextPath}/js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${request.contextPath}/js/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
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

    .dropdown-menu{
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
    </style>
</head>

<body class="skin-1">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>Lumino</span>Pro</a>
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="glyphicon glyphicon-envelope"></i>  <span class="label label-danger">2</span>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="${request.contextPath}/js/template/LuminoPro/images/fff40.gif">
                                </a>
                                <div class="message-body">
                                    <small class="pull-right">3 mins ago</small>
                                    <a href="#"><strong>John Doe</strong> commented on <strong>your photo</strong>.</a>
                                    <br />
                                    <small class="text-muted">1:24 pm - 25/03/2015</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="${request.contextPath}/js/template/LuminoPro/images/fff40.gif">
                                </a>
                                <div class="message-body">
                                    <small class="pull-right">1 hour ago</small>
                                    <a href="#">New message from <strong>Jane Doe</strong>.</a>
                                    <br />
                                    <small class="text-muted">12:27 pm - 25/03/2015</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>

                        <li>
                            <div class="all-button">
                                <a href="#">
                                    <em class="glyphicon glyphicon-inbox"></em> <strong>All Messages</strong>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="glyphicon glyphicon-bell"></i>  <span class="label label-primary">18</span>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <em class="glyphicon glyphicon-envelope"></em> 1 New Message
                                    <span class="pull-right text-muted small">3 mins ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <em class="glyphicon glyphicon-heart"></em> 12 New Likes
                                    <span class="pull-right text-muted small">4 mins ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <em class="glyphicon glyphicon-user"></em> 5 New Followers
                                    <span class="pull-right text-muted small">4 mins ago</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
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
        <li class="parent active">
            <a href="#">
                <div  data-toggle="collapse" href="#sub-item-1">
                    <span class="glyphicon glyphicon-list"></span> 用户管理
                    <span class="icon pull-right">
                        <em class="glyphicon glyphicon-s glyphicon-plus"></em>
                     </span>
                </div>
            </a>
            <ul class="children collapse" id="sub-item-1">
                <li>
                    <a class="" href="${request.contextPath}/baseUser/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 用户管理
                    </a>
                </li>
                <li>
                    <a class="" href="${request.contextPath}/baseRole/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 角色管理
                    </a>
                </li>
                <li>
                    <a class="" href="${request.contextPath}/baseUserBaseRole/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 权限管理
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent ">
            <a href="#">
                <div  data-toggle="collapse" href="#sub-item-2"><span class="glyphicon glyphicon-list"></span> 队伍管理
                    <span class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
                </div>
            </a>
            <ul class="children collapse" id="sub-item-2">
                <li>
                    <a class="" href="${request.contextPath}/position/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 岗位管理
                    </a>
                </li>
                <li>
                    <a class="" href="${request.contextPath}/rotation/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 班次管理
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent ">
            <a href="#">
                <div  data-toggle="collapse" href="#sub-item-3"><span class="glyphicon glyphicon-list"></span> 设备管理
                <span class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
                </div>
            </a>
            <ul class="children collapse" id="sub-item-3">
                <li>
                    <a class="" href="${request.contextPath}/equipmentCatagory/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 设备类别管理
                    </a>
                </li>
                <li>
                    <a class="" href="${request.contextPath}/standard/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 标准管理
                    </a>
                </li>
                <li>
                    <a class="" href="${request.contextPath}/equipment/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 设备台帐管理
                    </a>
                </li>
                <li>
                    <a class="" href="${request.contextPath}/EquipmentRunningInfo/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 设备运行情况管理
                    </a>
                </li>
                <li>
                    <a class="" href="${request.contextPath}/EquipmentStandardHistory/list">
                        <span class="glyphicon glyphicon-share-alt"></span> 设备标准历史管理
                    </a>
                </li>
            </ul>
        </li>

        <li ><a href="index.html"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
        <li><a href="widgets.html"><span class="glyphicon glyphicon-th"></span> Widgets</a></li>
        <li><a href="charts.html"><span class="glyphicon glyphicon-stats"></span> Charts</a></li>
        <li><a href="tables.html"><span class="glyphicon glyphicon-list-alt"></span> Tables</a></li>
        <li><a href="forms.html"><span class="glyphicon glyphicon-pencil"></span> Forms</a></li>
        <li><a href="buttons.html"><span class="glyphicon glyphicon-hand-up"></span> Buttons</a></li>
        <li><a href="panels.html"><span class="glyphicon glyphicon-info-sign"></span> Alerts &amp; Panels</a></li>

        <li role="presentation" class="divider"></li>
        <li><a href="login.html"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
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
                '<i class="fa fa-gear"></i> Change Skin' +
                '</a>' +
                '<div class="modal fade" id="changeSkin" tabindex="-1" role="dialog" aria-hidden="true">' +
                '<div class="modal-dialog" >' +
                '<div class="modal-content">' +
                '<div class="modal-header">' +
                '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' +
                '<h4 class="modal-title">Change Template Skin</h4>' +
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