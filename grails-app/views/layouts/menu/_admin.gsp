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
            <a class="" href="${request.contextPath}/requestmap/list">
                <span class="glyphicon glyphicon-share-alt"></span> 权限管理
            </a>
        </li>
    </ul>
</li>


<li><a href="widgets.html"><span class="glyphicon glyphicon-th"></span> Widgets</a></li>
<li><a href="charts.html"><span class="glyphicon glyphicon-stats"></span> Charts</a></li>
<li><a href="tables.html"><span class="glyphicon glyphicon-list-alt"></span> Tables</a></li>
<li><a href="forms.html"><span class="glyphicon glyphicon-pencil"></span> Forms</a></li>
<li><a href="buttons.html"><span class="glyphicon glyphicon-hand-up"></span> Buttons</a></li>
<li><a href="panels.html"><span class="glyphicon glyphicon-info-sign"></span> Alerts &amp; Panels</a></li>

<script>
    $(function(){
        <g:if test="${['baseUser','baseRole','requestmap'].contains(params.controller)}">
            $("div [href='#sub-item-1']").click();
        </g:if>

    });
</script>
