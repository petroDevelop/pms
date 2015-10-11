<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <g:if test="${!params.layout}">
        <meta name="layout" content="luminoPro">
    </g:if>
    <script>
        function queryParams(params) {
            //params.your_param1 = 1;
            return params;
        }
        function operatorFormatter(value, row,index) {
            var str='';
            if(row.status=='未查'){
                //str='<button class="btn btn-default margin"  onclick="oneProcess(true,'+index+','+row.id+')"  type="button"><span class="glyphicon glyphicon-edit"></span> &nbsp;正常</button></a>';
                str='<button class="btn btn-danger margin"  data-toggle="modal" data-target="#processModal"  onclick="oneProcess(false,'+index+','+row.id+')"  type="button"><span class="glyphicon glyphicon-wrench"></span> &nbsp;异常</button>';
            }else{
                str='<button class="btn btn-info margin" onclick="openRemark('+index+','+row.id+')"  type="button"><span class="glyphicon glyphicon-wrench"></span> &nbsp;查看</button>';
            }
            return str;
        }
        function openRemark(index,id){
            var data=$('#jobItemTable').bootstrapTable('getData');
            alert(data[index].checkResult);
        }
        function oneProcess(status,index,id){
          $('#itemId').val(id);
            $('#checkResult').val('');
/*            var obj=new Object();
            obj.id=id;
            obj.isWrong=status;
            $.post("${request.contextPath}/workspace/jobItemProcess", obj,
                    function (data, textStatus) {
                        if (data.result){
                            $('#alertSucess').removeClass('hide');
                            setTimeout(function(){
                                $('#alertSucess').addClass('hide');
                            }, 2000);
                            if(data.allFinish){
                                document.location.href='myTask';
                            }
                            $('#jobItemTable').bootstrapTable('refresh',{url:"${request.contextPath}/workspace/getJobItemJson/"+data.parentId});
                        }else{
                            $('#alertFault').removeClass('hide');
                        }
                    }, "json");*/
        }
        function isWrongFormatter(value, row,index) {
            if(row.status=='未查'){
                return '';
            }
            if(value){
                return '不正常';
            }else{
                return '正常';
            }
        }
        var currentJobOrderId;
        function changeItemTable(id){
            //$('#box-list').closest('.box').toggleClass('active');
            //$('#box-edit').closest('.box').addClass('active');
            currentJobOrderId=id;
            $('#jobItemTable').bootstrapTable('refresh',{url:"${request.contextPath}/workspace/getJobItemJson/"+id});
        }

        function finishAllItem(){
            var obj={};
            obj.id=currentJobOrderId;
            $.post("${request.contextPath}/workspace/finishAllItem", obj,
                    function (data, textStatus) {
                        if (data.result){
                            $('#alertSucess').removeClass('hide');
                            setTimeout(function(){
                                $('#alertSucess').addClass('hide');
                            }, 2000);
                            document.location.href='myTask';
                        }else{
                            $('#alertFault').removeClass('hide');
                        }
                    }, "json");
        }

        $(function(){
            $('#jobItemTable').bootstrapTable({
                onLoadSuccess:function(data){
                    var data=$('#jobItemTable').bootstrapTable('getData');
                    var index=0;
                    var equipment='';
                    var rowspan=1;
                    for(var i=0;i<data.length;i++){
                        if(data[i].equipment==equipment){
                            rowspan++;
                        }else{
                            if(i>0){
                                $('#jobItemTable').bootstrapTable('mergeCells', {index: index, field: 'equipment', colspan: 1, rowspan: rowspan});
                            }
                            equipment=data[i].equipment;
                            rowspan=1;
                            index=i;
                        }
                        if(i==(data.length-1)){
                            $('#jobItemTable').bootstrapTable('mergeCells', {index: index, field: 'equipment', colspan: 1, rowspan: rowspan});
                        }
                    }

                }
            });
            $('#processForm').form({
                url:"processJobItem",
                success: function(data){
                    $('#processModal').modal('hide');
                    var data = eval('(' + data + ')'); // change the JSON string to javascript object
                    if (data.result){
                        $('#alertSucess').removeClass('hide');
                        setTimeout(function(){
                            $('#alertSucess').addClass('hide');
                        }, 2000);
                        if(data.allFinish){
                            document.location.href='myTask';
                        }
                        $('#jobItemTable').bootstrapTable('refresh',{url:"${request.contextPath}/workspace/getJobItemJson/"+data.parentId});
                    }else{
                        $("#faultMessage").html(data.message);
                        $('#alertFault').removeClass('hide');
                    }
                }
            });
        });
    </script>
</head>

<body>


<div class="row">
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
        <li class="active" >待办任务</li>
    </ol>
</div><!--/.row-->

<div class="row">
    <div class="col-lg-12" style="height: 15px">

    </div>
</div><!--/.row-->
<div class="row box animated tile active" id="box-list">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading"><span class="glyphicon glyphicon-check"></span>待办任务</div>
            <div class="panel-body tabs">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#tab1">未完成工单</a></li>
                    <li><a data-toggle="tab" href="#tab2">超期工单</a></li>
                    <li><a data-toggle="tab" href="#tab3">已完成工单</a></li>

                </ul>

                <div class="tab-content">
                    <div id="tab1" class="tab-pane fade in active">
                        <ul class="todo-list">
                            <g:each in="${progressJobOrders}" var="jobOrder" status="i">
                                <li class="todo-list-item">
                                    <div class="checkbox">
                                        <input type="checkbox"  readonly disabled  id="checkbox-${i}" />
                                        <label  onclick="changeItemTable(${jobOrder.id})"  class="box-switcher" data-switch="box-edit"   for="checkbox-${i}">${jobOrder?.jobDate?.format('yyyy-MM-dd')} ${jobOrder?.rotation?.name} ${jobOrder?.position?.name} ${jobOrder?.type}类工单</label>
                                    </div>
                                    <div class="pull-right action-buttons">
                                        <a href="#"  onclick="changeItemTable(${jobOrder.id})"   class="box-switcher" data-switch="box-edit" ><span class="glyphicon glyphicon-pencil"></span></a>
                                        <!--<a href="#" class="flag"><span class="glyphicon glyphicon-flag"></span></a>-->
                                        <a href="#" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
                                    </div>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                    <div id="tab2" class="tab-pane fade">
                        <ul class="todo-list">
                            <g:each in="${oldProgressJobOrders}" var="jobOrder" status="i">
                                <li class="todo-list-item">
                                    <div class="checkbox"  >
                                        <input type="checkbox"  readonly disabled  id="checkbox-${i}" />
                                        <label onclick="changeItemTable(${jobOrder.id})" class="box-switcher" data-switch="box-edit"  for="checkbox-${i}">${jobOrder?.jobDate?.format('yyyy-MM-dd')} ${jobOrder?.rotation?.name} ${jobOrder?.position?.name} ${jobOrder?.type}类工单</label>
                                    </div>
                                    <div class="pull-right action-buttons">
                                        <a href="#"  onclick="changeItemTable(${jobOrder.id})"  class="box-switcher" data-switch="box-edit" ><span class="glyphicon glyphicon-pencil"></span></a>
                                        <!--<a href="#" class="flag"><span class="glyphicon glyphicon-flag"></span></a>-->
                                        <a href="#" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
                                    </div>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                    <div id="tab3" class="tab-pane fade">
                        <ul class="todo-list">
                            <g:each in="${finishJobOrders}" var="jobOrder" status="i">
                                <li class="todo-list-item">
                                    <div class="checkbox">
                                        <input type="checkbox" readonly disabled checked id="checkbox-${i}" />
                                        <label  for="checkbox-${i}">${jobOrder?.jobDate?.format('yyyy-MM-dd')} ${jobOrder?.rotation?.name} ${jobOrder?.position?.name} ${jobOrder?.type}类工单</label>
                                    </div>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </div>
            </div>

            <!--<div class="panel-body">
                <ul class="todo-list">
                    <g:each in="${jobOrders}" var="jobOrder" status="i">
                    <li class="todo-list-item">
                        <g:if test="${jobOrder.isFinish}">
                            <div class="checkbox">
                                <input type="checkbox" readonly disabled checked id="checkbox-${i}" />
                                <label  for="checkbox-${i}">${jobOrder?.jobDate?.format('yyyy-MM-dd')} ${jobOrder?.rotation?.name} ${jobOrder?.position?.name} ${jobOrder?.type}类工单</label>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="checkbox">
                                <input type="checkbox"  readonly disabled  id="checkbox-${i}" />
                                <label  onclick="changeItemTable(${jobOrder.id})" class="box-switcher"  data-switch="box-edit"  for="checkbox-${i}">${jobOrder?.jobDate?.format('yyyy-MM-dd')} ${jobOrder?.rotation?.name} ${jobOrder?.position?.name} ${jobOrder?.type}类工单</label>
                            </div>
                            <div class="pull-right action-buttons">
                                <a href="#"  onclick="changeItemTable(${jobOrder.id})" class="box-switcher"  data-switch="box-edit" ><span class="glyphicon glyphicon-pencil"></span></a>
                                <!--<a href="#" class="flag"><span class="glyphicon glyphicon-flag"></span></a>-->
                                <a href="#" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
                            </div>
                        </g:else>

                    </li>
                    </g:each>
                </ul>
            </div>-->
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
                    <button class="btn btn-default margin" onclick="document.location.href='myTask';"  type="button">
                        <span class="glyphicon glyphicon-new-window"></span>
                        返回
                    </button>
                </div>
                <div class="panel-body">
                    <div id="toolbar">
                        <button class="btn btn-default margin" onclick="finishAllItem()"  type="button">
                            <span class="glyphicon glyphicon-check"></span>
                            全部正常执行
                        </button>
                    </div>
                    <table id="jobItemTable" data-toolbar="#toolbar"
                            data-cache="false" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="false"
                           data-side-pagination="server" data-pagination="true" data-query-params="queryParams"
                           data-select-item-name="checkIds" data-sort-name="id" data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="nofield" data-checkbox="true"></th>
                            <th data-field="equipment" data-sortable="true"  >设备</th>

                            <th data-field="standardItem" data-sortable="true" >检查标准</th>
                            <!--
                            <th data-field="isWrong" data-sortable="true"  data-formatter="isWrongFormatter">设备状态</th>

                            <th data-field="checker" data-sortable="true" >检查人</th>

                            <th data-field="checkDate" data-sortable="true" >检查日期</th>

                            <th data-field="status" data-sortable="true" >检查状态</th>
                            -->
                            <!--
                            <th data-field="checkResult" data-sortable="true" >检查描述</th>
                            <th data-field="remark" data-sortable="true" >备注</th>
                             -->
                            <th data-field="name" data-formatter="operatorFormatter">操作</th>


                        </tr>
                        </thead>
                    </table>

                </div>
            </g:form>
        </div>
    </div>
</div><!--/.row-->




<div class="modal fade panel" id="processModal" tabindex="-1" role="dialog" aria-labelledby="processModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <form  role="form" id="processForm"  class="easyui-form"
                   enctype="multipart/form-data" method="post" >
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                &times;
                </button>
                <h4 class="modal-title" id="processModalLabel">
                    异常记录
                </h4>
            </div>
            <div class="modal-body">

                    <input type="hidden" id="itemId" name="id"/>
                    <input type="hidden" id="wrongId" name="isWrong" value="true"/>
                   <table border="0" style="width: 100%">
                       <tr>
                           <td><span style="color: white">异常描述:</span></td>
                           <td>
                           <textarea type="text" id="checkResult" name="checkResult" rows="5"  style="color:red;width: 100%" required="true"/></textarea>
                           </td>
                       </tr>
                       <!--<tr><td>异常文件</td><td><input type="file" name="file"  class="form-control input-sm m-b-10"/></td></tr>-->
                   </table>


            </div>
            <div class="modal-footer">
                <button class="btn btn-default margin"   type="submit">
                    <span class="glyphicon glyphicon-check"></span>
                    <g:message code="default.submit.label" default="Submit"/>
                </button>

                <button class="btn btn-default margin" data-dismiss="modal" type="button">
                    <span class="glyphicon glyphicon-circle-arrow-down"></span>
                    <g:message code="default.close.label" default="Close"/>
                </button>
            </div>
        </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>