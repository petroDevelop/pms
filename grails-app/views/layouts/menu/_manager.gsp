<li class="parent  active">
    <a href="#">
        <div  data-toggle="collapse" href="#sub-item-2"><span class="glyphicon glyphicon-list"></span> 初始化数据
            <span class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
        </div>
    </a>
    <ul class="children collapse" id="sub-item-2">
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/equipmentCatagory/list?layout=no',null)">
                <span class="glyphicon glyphicon-th"></span> 设备类别管理
            </a>
        </li>
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/standard/list?layout=no',null)">
                <span class="glyphicon glyphicon-stats"></span> 设备标准管理
            </a>
        </li>
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/equipment/list?layout=no',null)">
                <span class="glyphicon glyphicon-list-alt"></span> 设备台帐管理
            </a>
        </li>
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/position/list?layout=no',null)">
                <span class="glyphicon glyphicon-pencil"></span> 岗位管理
            </a>
        </li>
    </ul>
</li>
<li class="parent ">
    <a href="#">
        <div  data-toggle="collapse" href="#sub-item-3"><span class="glyphicon glyphicon-list"></span> 组织机构管理
            <span class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
        </div>
    </a>
    <ul class="children collapse" id="sub-item-3">
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/baseDepartment/projectList?layout=no',null)">
                <span class="glyphicon glyphicon-hand-up"></span> 项目部管理
            </a>
        </li>
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/baseDepartment/teamList?layout=no',null)">
                <span class="glyphicon glyphicon-info-sign"></span> 小队管理
            </a>
        </li>
        <li>
            <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/baseUser/list?layout=no',null)">
                <span class="glyphicon glyphicon-share-alt"></span> 人员管理
            </a>
        </li>

    </ul>
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
        <g:if test="${['equipmentCatagory','standard','equipment','position'].contains(params.controller)}">
            var obj=$("div [href='#sub-item-2']");
            obj.parent().parent().addClass('active');
            obj.click();
        </g:if>
        <g:if test="${['baseDepartment','baseUser'].contains(params.controller)}">
            var obj=$("div [href='#sub-item-3']");
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
