<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="luminoPro">
    <script>
        function operatorFormatter(value, row,index) {
            var str='<button class="btn btn-default margin box-switcher" data-switch="box-edit" onclick="editOne('+index+','+row.id+')"  type="button"><span class="glyphicon glyphicon-edit"></span> &nbsp;<g:message code="default.button.edit.label" default="Edit" /></button></a>';
            return str;
        }
        function isWrongFormatter(value, row,index) {
            if(value){
                return '不正常';
            }else{
                return '正常';
            }

        }
    </script>
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

                            <a href="#" class="box-switcher"  data-switch="box-edit" ><span class="glyphicon glyphicon-pencil" ></span></a>

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

<div class="row box animated tile " id="box-edit">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <g:form method="post">
                <div class="panel-heading">
                     工单详情
                </div>
                <div class="panel-body">

                    <table id="jobItemTable" data-toolbar="#toolbar" data-toggle="table"
                            data-cache="false" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"
                           data-side-pagination="server" data-pagination="true" data-query-params="queryParams"
                           data-select-item-name="checkIds" data-sort-name="name" data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="nofield" data-checkbox="true"></th>
                            <th data-field="equipment" data-sortable="true"  >设备</th>

                            <th data-field="standardItem" data-sortable="true" >检查标准</th>
                            <th data-field="isWrong" data-sortable="true"  data-formatter="isWrongFormatter">设备状态</th>

                            <th data-field="checker" data-sortable="true" >检查人</th>

                            <th data-field="checkDate" data-sortable="true" >检查日期</th>

                            <th data-field="status" data-sortable="true" >检查状态</th>
                            <th data-field="checkResult" data-sortable="true" >检查描述</th>
                            <th data-field="remark" data-sortable="true" >备注</th>

                            <th data-field="name" data-formatter="operatorFormatter">操作</th>


                        </tr>
                        </thead>
                    </table>

                </div>
            </g:form>
        </div>
    </div>
</div><!--/.row-->




</body>
</html>