
<%@ page import="com.petrodata.pms.equipment.EquipmentRunningInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>

	<div class="row">
		<ol class="breadcrumb">
			<li><a  href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active" ><g:link  action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			<li class="active" ><g:link  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		</ol>
	</div><!--/.row-->

	<div class="row">
		<div class="col-lg-12" style="height: 30px">

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
	</div><!--/.row-->

	<table class="table tile">
		

		<tr><th>	<span id="equipment-label" class="property-label"><g:message code="equipmentRunningInfo.equipment.label" default="Equipment" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="equipment-label"><g:link controller="equipment" action="show" id="${equipmentRunningInfoInstance?.equipment?.id}">${equipmentRunningInfoInstance?.equipment?.encodeAsHTML()}</g:link></span>
				</td>

		</tr>

		

		<tr><th>	<span id="jobOrderInitDate-label" class="property-label"><g:message code="equipmentRunningInfo.jobOrderInitDate.label" default="Job Order Init Date" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="jobOrderInitDate-label"><g:formatDate date="${equipmentRunningInfoInstance?.jobOrderInitDate}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="lastOverhaulTime-label" class="property-label"><g:message code="equipmentRunningInfo.lastOverhaulTime.label" default="Last Overhaul Time" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="lastOverhaulTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="lastOverhaulTime"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="maintenanceInitTime-label" class="property-label"><g:message code="equipmentRunningInfo.maintenanceInitTime.label" default="Maintenance Init Time" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="maintenanceInitTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="maintenanceInitTime"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="runningTime-label" class="property-label"><g:message code="equipmentRunningInfo.runningTime.label" default="Running Time" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="runningTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="runningTime"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="totalTime-label" class="property-label"><g:message code="equipmentRunningInfo.totalTime.label" default="Total Time" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="totalTime-label"><g:fieldValue bean="${equipmentRunningInfoInstance}" field="totalTime"/></span>
				</td>

		</tr>

		   </table>


	<g:form url="[resource:equipmentRunningInfoInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:hiddenField name="id" value="${equipmentRunningInfoInstance?.id}" />
			<g:link class="btn btn-default margin" action="edit"  id="${equipmentRunningInfoInstance?.id}" resource="${equipmentRunningInfoInstance}">
				<span class="glyphicon glyphicon-edit"></span>
				<g:message code="default.button.edit.label" default="Edit" /></g:link>
			<button type="submit" name="_action_delete"
					class="btn btn-default margin"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
				<span class="glyphicon glyphicon-trash"></span>${message(code: 'default.button.delete.label', default: 'Delete')}</button>

		</fieldset>
	</g:form>

	</body>
</html>
