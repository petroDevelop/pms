
<%@ page import="com.petrodata.pms.equipment.EquipmentRunningInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-equipmentRunningInfo" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipmentRunningInfo">  <table class="table tile">
			

                    <tr><th>	<span id="jobOrderInitDate-label" class="property-label"><g:message code="equipmentRunningInfo.jobOrderInitDate.label" default="Check Init Date" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="jobOrderInitDate-label"><g:formatDate date="${equipmentRunningInfoInstance?.jobOrderInitDate}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentRunningInfoInstance?.jobOrderInitDate}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="jobOrderInitDate-label" class="property-label"><g:message code="equipmentRunningInfo.jobOrderInitDate.label" default="Check Init Date" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="jobOrderInitDate-label"><g:formatDate date="${equipmentRunningInfoInstance?.jobOrderInitDate}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="equipment-label" class="property-label"><g:message code="equipmentRunningInfo.equipment.label" default="Equipment" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="equipment-label"><g:link controller="equipment" action="show" id="${equipmentRunningInfoInstance?.equipment?.id}">${equipmentRunningInfoInstance?.equipment?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentRunningInfoInstance?.equipment}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="equipment-label" class="property-label"><g:message code="equipmentRunningInfo.equipment.label" default="Equipment" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="equipment-label"><g:link controller="equipment" action="show" id="${equipmentRunningInfoInstance?.equipment?.id}">${equipmentRunningInfoInstance?.equipment?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="lastOverhaulTime-label" class="property-label"><g:message code="equipmentRunningInfo.lastOverhaulTime.label" default="Last Overhaul Time" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="lastOverhaulTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="lastOverhaulTime"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentRunningInfoInstance?.lastOverhaulTime}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="lastOverhaulTime-label" class="property-label"><g:message code="equipmentRunningInfo.lastOverhaulTime.label" default="Last Overhaul Time" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="lastOverhaulTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="lastOverhaulTime"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="maintenanceInitTime-label" class="property-label"><g:message code="equipmentRunningInfo.maintenanceInitTime.label" default="Maintenance Init Time" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="maintenanceInitTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="maintenanceInitTime"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentRunningInfoInstance?.maintenanceInitTime}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="maintenanceInitTime-label" class="property-label"><g:message code="equipmentRunningInfo.maintenanceInitTime.label" default="Maintenance Init Time" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="maintenanceInitTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="maintenanceInitTime"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="totalTime-label" class="property-label"><g:message code="equipmentRunningInfo.totalTime.label" default="Total Time" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="totalTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="totalTime"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentRunningInfoInstance?.totalTime}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="totalTime-label" class="property-label"><g:message code="equipmentRunningInfo.totalTime.label" default="Total Time" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="totalTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="totalTime"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:equipmentRunningInfoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${equipmentRunningInfoInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${equipmentRunningInfoInstance?.id}" resource="${equipmentRunningInfoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
