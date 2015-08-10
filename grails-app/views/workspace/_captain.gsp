<%@ page import="com.petrodata.pms.team.PositionBaseUser; com.petrodata.pms.team.Rotation; com.petrodata.pms.core.BaseUser" %>

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

    function descFormatter(value,row,index)
    {
        var checkResultString = "<a data-toggle='modal' data-target='#processModal' herf='#' title='";
        checkResultString += value;
        //checkResultString += "'>";
        checkResultString += "' onclick='showDescription("+ index + ")'>";
        checkResultString += (value.length > 10)?value.substr(0,10) + "...":value;
        checkResultString += "</a>";
        return checkResultString;
    }

    function showDescription(index)
    {
        var data=$('#jobExceptionItemTable').bootstrapTable('getData');
        console.log(data);
        $("#processModal").show();
        $('#checkResult').val(data[index].checkResult);

    }
//    function rowStyle(row, index) {
//        var classes = ['active', 'success', 'info', 'warning', 'danger'];
//
//        if (row.isFinish=='未完成') {
//            return {
//                classes: classes[4]
//            };
//        }
//        return {};
//    }
    $(function () {
        //初始化百分比图
        $.post("${request.contextPath}/workspace/statusDataJson", null,
                function (data, textStatus) {
                    //$('#easypiechart-blue').data('easyPieChart').update(data.teamPrecent);//小队开工率
                    //$('#easypiechart-blue').find(".percent").text(data.teamPrecent + "%");

                    $('#easypiechart-orange').data('easyPieChart').update(data.checkJobPrecent);//检查工单执行率
                    $('#easypiechart-orange').find(".percent").text(data.checkJobPrecent + "%");

                    $('#easypiechart-teal').data('easyPieChart').update(data.maintainJobPrecent);//保养工单执行率
                    $('#easypiechart-teal').find(".percent").text(data.maintainJobPrecent + "%");

                    $('#easypiechart-red').data('easyPieChart').update(data.equipmentPrecent);//设备健康率
                    $('#easypiechart-red').find(".percent").text(data.equipmentPrecent + "%");
                }, "json");


    });
    function finishFormatter(value, row) {
        if(value == "未完成")
        {
            return "<p style='color: #ef4040;'>"+ value+"</p>";
        }
        else
        {
            return "<p style='color: #ffffff;'>"+ value+"</p>";
        }

    }

</script>
<link rel="stylesheet" href="${request.contextPath}/js/Simple-jQuery-Timeline-Plugin-Timelinr/css/style.css" media="screen" />
<script src="${request.contextPath}/js/Simple-jQuery-Timeline-Plugin-Timelinr/js/jquery.timelinr-0.9.54.js"></script>

<%
    int startAt=1;
    def baseUser=com.petrodata.pms.core.BaseUser.findByUsername(sec.username());
    def rotations=com.petrodata.pms.team.Rotation.findAllByBaseDepartment(baseUser.baseDepartment).sort{Date.parse("HH:mm",it.beginTime)};
    def positions=com.petrodata.pms.team.PositionBaseUser.executeQuery("select distinct pb.position from PositionBaseUser pb where pb.baseUser.baseDepartment=?",[baseUser.baseDepartment])
    //int beginHour=0;
    //int endHour=23;
    Date serverTime=new Date();
    int currentHour=serverTime.hours;
    def showList=[];
    if(rotations && rotations.size()>0){
        //beginHour=Date.parse("HH:mm",rotations[0].beginTime).hours;
        //endHour=Date.parse("HH:mm",rotations[-1].endTime).hours;
        String rotationDay=serverTime.format('yyyy-MM-dd HH:mm',TimeZone.getTimeZone(rotations[0].timeZone));
        currentHour=Date.parse('yyyy-MM-dd HH:mm',rotationDay).hours;
        showList=rotations.collect{Date.parse("HH:mm",it.beginTime).hours}
    }
    rotations.eachWithIndex{ rotation,i ->
        if(Date.parse("HH:mm",rotation.beginTime).hours<=currentHour && Date.parse("HH:mm",rotation.endTime).hours>=currentHour ){
            startAt=i+1;
        }
    }
    //def allHours=beginHour..endHour;
        /*
    def allHours=[];
    rotations.each{
        allHours<<Date.parse("HH:mm",it.beginTime).hours;
        allHours<<Date.parse("HH:mm",it.endTime).hours;
    }
    */
    //def allInfo=[];
/*    allHours.each{hour->
        def list=[];
        rotations.each{ro->
            if(Date.parse("HH:mm",rotations[0].beginTime).hours==hour){
                list<<[rotation:ro,type:'beginTime']
            }
            if(Date.parse("HH:mm",rotations[0].endTime).hours==hour){
                list<<[rotation:ro,type:'endTime']
            }
        }
        allInfo<<[hour:hour,info:list];
    }*/
%>
<script>
    $(function(){
        $().timelinr({
            autoPlay: 'false',
            autoPlayPause:6000,
            startAt: ${startAt},
            autoPlayDirection: 'forward'
        })
    });
</script>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">今日工单汇总</div>
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <div id="timeline">
                        <ul id="dates">
                            <g:each in="${showList}" var="hour">
                                <li><a href="#Hour${hour}">${hour}:00</a></li>
                            </g:each>
                        </ul>
                        <ul id="issues">
                            <g:each in="${rotations}" var="rotation" status="i">
                            <li id="Hour${showList[i]}">
                                <%
                                    int oneHour=showList[i]
                                    if(oneHour>12){
                                        oneHour=(oneHour-12).abs().intValue()
                                    }
                                    %>
                                <img src="${request.contextPath}/js/Simple-jQuery-Timeline-Plugin-Timelinr/images/${oneHour}.png" width="256" height="256" />
                                <h1>${rotation.name}</h1>
                                <g:set var="localTime" value="${Date.parse('yyyy-MM-dd',(new Date()).format('yyyy-MM-dd',TimeZone.getTimeZone(rotation.timeZone)))}"/>
                                <g:set var="allNum" value="${com.petrodata.pms.order.JobOrder.countByRotationAndJobDate(rotation,localTime)}" />
                                <g:set var="overNum" value="${com.petrodata.pms.order.JobOrder.countByRotationAndJobDateAndIsFinish(rotation,localTime,true)}" />
                                <g:if test="${showList[i]<=currentHour}">
                                    <p style="color:goldenrod" >
                                        已生成运行检查工单${allNum}份<br/>
                                        其中完成${overNum}份,未完成${allNum-overNum}份.<br/>
                                        涉及岗位:${positions.collect{it.name}.join(",")}
                                    </p>
                                </g:if>
                                <g:else>
                                    <p style="text-decoration:line-through;color:darkgray">
                                        将生成运行检查工单${positions.size()}份,完成${0}份,未完成${positions.size()}份.<br/>
                                        涉及岗位:${positions.collect{it.name}.join(",")}</p>
                                </g:else>

                            </li>
                            </g:each>
                        </ul>
                        <div id="grad_left"></div>
                        <div id="grad_right"></div>
                        <a href="#" id="next">+</a>
                        <a href="#" id="prev">-</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->
<div class="row">
    <!--
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">小队开工率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-blue" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
    -->
    <div class="col-xs-8 col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">检查工单执行率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-orange" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-8 col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">保养工单执行率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-teal" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-8 col-md-4">
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
                <div class="panel-body tabs">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab1">未完成工单</a></li>
                        <li><a data-toggle="tab" href="#tab2">超期工单</a></li>
                        <li><a data-toggle="tab" href="#tab3">异常工单项</a></li>

                    </ul>
                    <div class="tab-content">
                        <div id="tab1" class="tab-pane fade in active">
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

                                    <th data-field="isFinish" data-sortable="true" data-formatter="finishFormatter">是否完结</th>

                                    <th data-field="id" data-formatter="operatorFormatter">查看详情</th>


                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div id="tab2" class="tab-pane fade">
                            <table id="jobOutDateItemTable"  data-toggle="table" data-url="${request.contextPath}/workspace/teamOutDateJobJson"
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

                                    <th data-field="isFinish" data-sortable="true" data-formatter="finishFormatter">是否完结</th>

                                    <th data-field="id" data-formatter="operatorFormatter">查看详情</th>


                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div id="tab3" class="tab-pane fade">
                            <table id="jobExceptionItemTable"  data-toggle="table" data-url="${request.contextPath}/workspace/teamExceptionJobJson"
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

                                    <th data-field="equipment" data-sortable="true" >设备名称</th>

                                    <th data-field="standardItem" data-sortable="true" >设备标准</th>

                                    <th data-field="checkResult" data-formatter="descFormatter">描述</th>

                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
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
                                <textArea type="text" id="checkResult" name="checkResult" rows="5"  style="color:red;width: 100%" readonly/></textarea>
                            </td>
                        </tr>
                        <!--<tr><td>异常文件</td><td><input type="file" name="file"  class="form-control input-sm m-b-10"/></td></tr>-->
                    </table>


                </div>
                <div class="modal-footer">
                    <button class="btn btn-default margin" data-dismiss="modal" type="button">
                        <span class="glyphicon glyphicon-circle-arrow-down"></span>
                        <g:message code="default.close.label" default="Close"/>
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>