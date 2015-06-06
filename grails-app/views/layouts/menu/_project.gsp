<li><a href="${request.contextPath}/baseDepartment/underTeamList"><span class="glyphicon glyphicon-th"></span> 下属小队管理</a></li>
<li><a href="${request.contextPath}/baseUser/projectList"><span class="glyphicon glyphicon-stats"></span> 下属人员管理</a></li>
<li><a href="${request.contextPath}/equipment/projectList"><span class="glyphicon glyphicon-list-alt"></span> 下属设备管理</a></li>

<li class="parent ">
    <a href="#">
        <div  data-toggle="collapse" href="#sub-item-4"><span class="glyphicon glyphicon-list"></span> 监控管理
            <span class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
        </div>
    </a>
    <ul class="children collapse" id="sub-item-4">
        <li>
            <a class="" href="${request.contextPath}/">
                <span class="glyphicon glyphicon-hand-up"></span> 工单执行情况
            </a>
        </li>
        <li>
            <a class="" href="${request.contextPath}/">
                <span class="glyphicon glyphicon-info-sign"></span> 维修情况
            </a>
        </li>
        <li>
            <a class="" href="${request.contextPath}/">
                <span class="glyphicon glyphicon-share-alt"></span> 大修情况
            </a>
        </li>

    </ul>
</li>