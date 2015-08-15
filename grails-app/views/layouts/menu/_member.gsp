<li>
    <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/workspace/myTask?layout=no',null)">
        <span class="glyphicon glyphicon-info-sign"></span> 待办任务
    </a>
</li>
<li>
    <a class="" href="#" onclick="loadRemotePage('${request.contextPath}/baseUser/myInfo?layout=no',null)">
        <span class="glyphicon glyphicon-info-sign"></span> 我的信息
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
        <g:if test="${['workspace'].contains(params.controller)}">
        $("div [href='#sub-item-4']").click();
        </g:if>
    });
    */
</script>