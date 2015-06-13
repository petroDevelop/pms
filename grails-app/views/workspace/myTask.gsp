<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="luminoPro">
</head>

<body>

<div class="row">
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
        <li class="active" >代办任务</li>
    </ol>
</div><!--/.row-->

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">工单列表</h1>
    </div>
</div><!--/.row-->
<div class="row box animated tile active" id="box-list">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading"><span class="glyphicon glyphicon-check"></span>代办任务</div>
            <div class="panel-body">
                <ul class="todo-list">
                    <g:each in="${jobOrders}" var="jobOrder" status="i">
                    <li class="todo-list-item">
                        <div class="checkbox">
                            <input type="checkbox" id="checkbox-${i}" />
                            <label for="checkbox-${i}">${jobDate.format('yyyy-MM-dd')} ${rotation.name} ${position.name} ${type}类工单</label>
                        </div>
                        <div class="pull-right action-buttons">
                            <a href="#"><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="#" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
                            <a href="#" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
                        </div>
                    </li>
                    </g:each>

                    <li class="todo-list-item">
                        <div class="checkbox">
                            <input type="checkbox" id="checkbox-3" checked readonly disabled />
                            <label for="checkbox-3">3333333</label>
                        </div>

                    </li>
                    <li class="todo-list-item">
                        <div class="checkbox">
                            <input type="checkbox" id="checkbox-4" />
                            <label for="checkbox-4">2015年6月13日 早班--电器岗位的工单</label>
                        </div>
                        <div class="pull-right action-buttons">

                            <a href="#"><label for="checkbox-4" ><span class="glyphicon glyphicon-pencil" ></span></label></a>

                            <a href="#" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
                            <a href="#" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
                        </div>
                    </li>
                    <li class="todo-list-item">
                        <div class="checkbox">
                            <input type="checkbox" id="checkbox-5"  />
                            <label for="checkbox-5">2015年6月13日 早班--井架岗位的工单</label>
                        </div>
                        <div class="pull-right action-buttons">
                            <a href="#"><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="#" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
                            <a href="#" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="panel-footer">

            </div>
        </div>
    </div>
</div><!--/.row-->





</body>
</html>