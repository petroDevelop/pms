
<%@ page import="com.petrodata.pms.equipment.StandardItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'standardItem.label', default: 'StandardItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-standardItem" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list standardItem">  <table class="table tile">
			

                    <tr><th>	<span id="type-label" class="property-label"><g:message code="standardItem.type.label" default="Type" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${standardItemInstance}" field="type"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.type}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="type-label" class="property-label"><g:message code="standardItem.type.label" default="Type" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${standardItemInstance}" field="type"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="aim-label" class="property-label"><g:message code="standardItem.aim.label" default="Aim" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="aim-label"><g:fieldValue bean="${standardItemInstance}" field="aim"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.aim}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="aim-label" class="property-label"><g:message code="standardItem.aim.label" default="Aim" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="aim-label"><g:fieldValue bean="${standardItemInstance}" field="aim"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="name-label" class="property-label"><g:message code="standardItem.name.label" default="Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${standardItemInstance}" field="name"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.name}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="name-label" class="property-label"><g:message code="standardItem.name.label" default="Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${standardItemInstance}" field="name"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="range-label" class="property-label"><g:message code="standardItem.range.label" default="Range" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="range-label"><g:fieldValue bean="${standardItemInstance}" field="range"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.range}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="range-label" class="property-label"><g:message code="standardItem.range.label" default="Range" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="range-label"><g:fieldValue bean="${standardItemInstance}" field="range"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="sop-label" class="property-label"><g:message code="standardItem.sop.label" default="Sop" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="sop-label"><g:fieldValue bean="${standardItemInstance}" field="sop"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.sop}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="sop-label" class="property-label"><g:message code="standardItem.sop.label" default="Sop" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="sop-label"><g:fieldValue bean="${standardItemInstance}" field="sop"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="sopCode-label" class="property-label"><g:message code="standardItem.sopCode.label" default="Sop Code" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="sopCode-label"><g:fieldValue bean="${standardItemInstance}" field="sopCode"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.sopCode}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="sopCode-label" class="property-label"><g:message code="standardItem.sopCode.label" default="Sop Code" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="sopCode-label"><g:fieldValue bean="${standardItemInstance}" field="sopCode"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="accessory-label" class="property-label"><g:message code="standardItem.accessory.label" default="Accessory" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="accessory-label"><g:fieldValue bean="${standardItemInstance}" field="accessory"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.accessory}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="accessory-label" class="property-label"><g:message code="standardItem.accessory.label" default="Accessory" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="accessory-label"><g:fieldValue bean="${standardItemInstance}" field="accessory"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="excuteCycle-label" class="property-label"><g:message code="standardItem.excuteCycle.label" default="Excute Cycle" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="excuteCycle-label"><g:fieldValue bean="${standardItemInstance}" field="excuteCycle"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.excuteCycle}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="excuteCycle-label" class="property-label"><g:message code="standardItem.excuteCycle.label" default="Excute Cycle" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="excuteCycle-label"><g:fieldValue bean="${standardItemInstance}" field="excuteCycle"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="manhour-label" class="property-label"><g:message code="standardItem.manhour.label" default="Manhour" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="manhour-label"><g:fieldValue bean="${standardItemInstance}" field="manhour"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.manhour}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="manhour-label" class="property-label"><g:message code="standardItem.manhour.label" default="Manhour" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="manhour-label"><g:fieldValue bean="${standardItemInstance}" field="manhour"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="standard-label" class="property-label"><g:message code="standardItem.standard.label" default="Standard" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="standard-label"><g:link controller="standard" action="show" id="${standardItemInstance?.standard?.id}">${standardItemInstance?.standard?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.standard}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="standard-label" class="property-label"><g:message code="standardItem.standard.label" default="Standard" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="standard-label"><g:link controller="standard" action="show" id="${standardItemInstance?.standard?.id}">${standardItemInstance?.standard?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="warningHour-label" class="property-label"><g:message code="standardItem.warningHour.label" default="Warning Hour" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="warningHour-label"><g:fieldValue bean="${standardItemInstance}" field="warningHour"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardItemInstance?.warningHour}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="warningHour-label" class="property-label"><g:message code="standardItem.warningHour.label" default="Warning Hour" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="warningHour-label"><g:fieldValue bean="${standardItemInstance}" field="warningHour"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:standardItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${standardItemInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${standardItemInstance?.id}" resource="${standardItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
