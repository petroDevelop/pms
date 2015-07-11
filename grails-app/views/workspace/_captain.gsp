
<script type="text/javascript">
    function queryParams(params) {
        //params.your_param1 = 1;
        return params;
    }
    function showOne(index,jobOrderId){
        var obj={};
        obj.id=jobOrderId;
        $.post("${request.contextPath}/workspace/catchOneJobOrderDetail", obj,
                function (data, textStatus) {
                    $('#detailDiv').html(data);
                }, "html");
    }
    function operatorFormatter(value, row,index) {
        var str='<button class="btn btn-default margin box-switcher" data-switch="box-detail" onclick="showOne('+index+','+row.id+')"  type="button"><span class="glyphicon glyphicon-edit"></span> &nbsp;显示</button></a>';
        return str;
    }
    $(function () {
        //初始化百分比图
        $.post("${request.contextPath}/workspace/statusDataJson", null,
                function (data, textStatus) {
                    $('#easypiechart-blue').data('easyPieChart').update(data.teamPrecent);//小队开工率
                    $('#easypiechart-blue').find(".percent").text(data.teamPrecent + "%");

                    $('#easypiechart-orange').data('easyPieChart').update(data.checkJobPrecent);//检查工单执行率
                    $('#easypiechart-orange').find(".percent").text(data.checkJobPrecent + "%");

                    $('#easypiechart-teal').data('easyPieChart').update(data.maintainJobPrecent);//保养工单执行率
                    $('#easypiechart-teal').find(".percent").text(data.maintainJobPrecent + "%");

                    $('#easypiechart-red').data('easyPieChart').update(data.equipmentPrecent);//设备健康率
                    $('#easypiechart-red').find(".percent").text(data.equipmentPrecent + "%");
                }, "json");


    });
</script>


<div class="row">
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">小队开工率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-blue" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">检查工单执行率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-orange" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">保养工单执行率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-teal" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">设备健康率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-red" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->

<div class="row box animated tile active" id="box-list">
    <div class="col-lg-12">
        <div class="panel panel-default">

                <div class="panel-heading">
                    队内工单监控
                </div>
                <div class="panel-body">
                    <table id="jobItemTable"  data-toggle="table" data-url="${request.contextPath}/workspace/teamJobJson"
                           data-cache="false" data-show-refresh="true"
                           data-show-toggle="true" data-show-columns="true"
                           data-search="false"   data-side-pagination="server"
                           data-pagination="true" data-query-params="queryParams"
                           data-select-item-name="checkIds" data-sort-name="id" data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="jobDate" data-sortable="true"  >工单时间</th>

                            <th data-field="rotation" data-sortable="true" >班次</th>
                            <th data-field="position" data-sortable="true"  >岗位</th>

                            <th data-field="type" data-sortable="true" >工单类型</th>

                            <th data-field="isFinish" data-sortable="true" >是否完结</th>

                            <th data-field="id" data-formatter="operatorFormatter">查看详情</th>


                        </tr>
                        </thead>
                    </table>

                </div>

        </div>
    </div>
</div><!--/.row-->

<div class="row box animated tile " id="box-detail">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading"><span class="glyphicon glyphicon-check"></span>工单详情
                <button class="btn btn-default margin box-switcher" data-switch="box-list"  type="button">
                    <span class="glyphicon glyphicon-new-window"></span>
                    返回
                </button>
            </div>
            <div class="panel-body">
                <ul class="todo-list" id="detailDiv">

                </ul>
            </div>
            <div class="panel-footer">

            </div>
        </div>
    </div>
</div><!--/.row-->

