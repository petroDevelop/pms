
<%@ page import="com.petrodata.pms.equipment.EquipmentStandardHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-equipmentStandardHistory" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipmentStandardHistory">  <table class="table tile">
			

                    <tr><th>	<span id="beginDate-label" class="property-label"><g:message code="equipmentStandardHistory.beginDate.label" default="Begin Date" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="beginDate-label"><g:formatDate date="${equipmentStandardHistoryInstance?.beginDate}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentStandardHistoryInstance?.beginDate}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="beginDate-label" class="property-label"><g:message code="equipmentStandardHistory.beginDate.label" default="Begin Date" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="beginDate-label"><g:formatDate date="${equipmentStandardHistoryInstance?.beginDate}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="endDate-label" class="property-label"><g:message code="equipmentStandardHistory.endDate.label" default="End Date" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${equipmentStandardHistoryInstance?.endDate}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentStandardHistoryInstance?.endDate}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="endDate-label" class="property-label"><g:message code="equipmentStandardHistory.endDate.label" default="End Date" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${equipmentStandardHistoryInstance?.endDate}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="equipment-label" class="property-label"><g:message code="equipmentStandardHistory.equipment.label" default="Equipment" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="equipment-label"><g:link controller="equipment" action="show" id="${equipmentStandardHistoryInstance?.equipment?.id}">${equipmentStandardHistoryInstance?.equipment?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentStandardHistoryInstance?.equipment}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="equipment-label" class="property-label"><g:message code="equipmentStandardHistory.equipment.label" default="Equipment" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="equipment-label"><g:link controller="equipment" action="show" id="${equipmentStandardHistoryInstance?.equipment?.id}">${equipmentStandardHistoryInstance?.equipment?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="standard-label" class="property-label"><g:message code="equipmentStandardHistory.standard.label" default="Standard" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="standard-label"><g:link controller="standard" action="show" id="${equipmentStandardHistoryInstance?.standard?.id}">${equipmentStandardHistoryInstance?.standard?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentStandardHistoryInstance?.standard}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="standard-label" class="property-label"><g:message code="equipmentStandardHistory.standard.label" default="Standard" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="standard-label"><g:link controller="standard" action="show" id="${equipmentStandardHistoryInstance?.standard?.id}">${equipmentStandardHistoryInstance?.standard?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:equipmentStandardHistoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${equipmentStandardHistoryInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${equipmentStandardHistoryInstance?.id}" resource="${equipmentStandardHistoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
