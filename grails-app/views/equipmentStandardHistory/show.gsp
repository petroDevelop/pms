
<%@ page import="com.petrodata.pms.equipment.EquipmentStandardHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory')}" />
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
		

		<tr><th>	<span id="beginDate-label" class="property-label"><g:message code="equipmentStandardHistory.beginDate.label" default="Begin Date" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="beginDate-label"><g:formatDate date="${equipmentStandardHistoryInstance?.beginDate}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="endDate-label" class="property-label"><g:message code="equipmentStandardHistory.endDate.label" default="End Date" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${equipmentStandardHistoryInstance?.endDate}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="equipment-label" class="property-label"><g:message code="equipmentStandardHistory.equipment.label" default="Equipment" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="equipment-label"><g:link controller="equipment" action="show" id="${equipmentStandardHistoryInstance?.equipment?.id}">${equipmentStandardHistoryInstance?.equipment?.encodeAsHTML()}</g:link></span>
				</td>

		</tr>

		

		<tr><th>	<span id="standard-label" class="property-label"><g:message code="equipmentStandardHistory.standard.label" default="Standard" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="standard-label"><g:link controller="standard" action="show" id="${equipmentStandardHistoryInstance?.standard?.id}">${equipmentStandardHistoryInstance?.standard?.encodeAsHTML()}</g:link></span>
				</td>

		</tr>

		   </table>


	<g:form url="[resource:equipmentStandardHistoryInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:hiddenField name="id" value="${equipmentStandardHistoryInstance?.id}" />
			<g:link class="btn btn-default margin" action="edit"  id="${equipmentStandardHistoryInstance?.id}" resource="${equipmentStandardHistoryInstance}">
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
