<li class="parent  active">
    <a href="#">
        <div  data-toggle="collapse" href="#sub-item-2"><span class="glyphicon glyphicon-list"></span> 初始化数据
            <span class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
        </div>
    </a>
    <ul class="children collapse" id="sub-item-2">
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/equipment/teamList?layout=no',null)">
                <span class="glyphicon glyphicon-th"></span> 设备台帐管理
            </a>
        </li>
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/baseUser/teamList?layout=no',null)">
                <span class="glyphicon glyphicon-stats"></span> 下属人员管理
            </a>
        </li>
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/rotation/list?layout=no',null)">
                <span class="glyphicon glyphicon-list-alt"></span> 班次管理
            </a>
        </li>
        <li>
            <a class="" href="#"  onclick="loadRemotePage('${request.contextPath}/positionBaseUser/list?layout=no',null)">
                <span class="glyphicon glyphicon-pencil"></span> 岗位管理
            </a>
        </li>
        <li>
            <a class="" href="#"  onclick="loadRemotePage('${request.contextPath}/baseUser/myTeam?layout=no',null)">
                <span class="glyphicon glyphicon-hand-up"></span> 小队状态管理
            </a>
        </li>
    </ul>
</li>


<li>
    <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/equipmentRunningInfo/list?layout=no',null)">
        <span class="glyphicon glyphicon-info-sign"></span> 设备运行情况管理
    </a>
</li>
<li>
    <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/equipment/statusManage?layout=no',null)">
        <span class="glyphicon glyphicon-info-sign"></span> 设备状况维护
    </a>
</li>
<li>
    <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/equipmentStandardHistory/list?layout=no',null)">
        <span class="glyphicon glyphicon-info-sign"></span> 设备标准历史管理
    </a>
</li>
<li class="parent ">
    <a href="#">
        <div  data-toggle="collapse" href="#sub-item-5"><span class="glyphicon glyphicon-list"></span> 配件管理
            <span class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
        </div>
    </a>
    <ul class="children collapse" id="sub-item-5">
        <li>
            <a class="" href="#">
                <span class="glyphicon glyphicon-hand-up"></span> 配件管理
            </a>
        </li>


    </ul>
</li>
<li class="parent ">
    <a href="#">
        <div  data-toggle="collapse" href="#sub-item-4"><span class="glyphicon glyphicon-list"></span> 监控管理
            <span class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
        </div>
    </a>
    <ul class="children collapse" id="sub-item-4">
        <li>
            <a class="" href="#">
                <span class="glyphicon glyphicon-hand-up"></span> 工单执行情况
            </a>
        </li>
        <li>
            <a class="" href="#">
                <span class="glyphicon glyphicon-info-sign"></span> 维修情况
            </a>
        </li>
        <li>
            <a class="" href="#">
                <span class="glyphicon glyphicon-share-alt"></span> 大修情况
            </a>
        </li>

    </ul>
</li>

<script>
    /*
    $(function(){
        $('.parent').removeClass('active');
        <g:if test="${['equipment','baseUser','rotation','positionBaseUser','baseUser'].contains(params.controller)}">
        var obj=$("div [href='#sub-item-2']");
        obj.parent().parent().addClass('active');
        obj.click();
        </g:if>
        <g:if test="${['workspace'].contains(params.controller)}">
        var obj=$("div [href='#sub-item-4']");
        obj.parent().parent().addClass('active');
        obj.click();
        </g:if>
    });
    */
</script>