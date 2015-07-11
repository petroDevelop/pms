<g:each in="${items}" var="item" status="i">
    <li class="todo-list-item">
            <div class="checkbox">
                <input type="checkbox" readonly disabled
                       <g:if test="${item.status=='已查'}">checked</g:if> id="checkbox-${i}" />
                <label  for="checkbox-${i}">
                    设备:${item?.equipment?.name}|
                    标准项:${item?.standardItem?.standard?.name}-${item?.standardItem?.type}|
                    状态:${item?.status}|
                    <g:if test="${item.status=='已查'}">
                        检查人:${item?.checker?.username}|
                        检查时间:${item?.checkDate?.format("yyyy-MM-dd HH:mm",TimeZone.getTimeZone(item.jobOrder.rotation.timeZone))}|
                        检查描述:${item?.checkResult}|
                    </g:if>

                </label>
            </div>
    </li>
</g:each>