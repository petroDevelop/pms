
<%@ page import="com.petrodata.pms.equipment.Standard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'standard.label', default: 'Standard')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-standard" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list standard">  <table class="table tile">
			

                    <tr><th>	<span id="attention-label" class="property-label"><g:message code="standard.attention.label" default="Attention" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="attention-label"><g:fieldValue bean="${standardInstance}" field="attention"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardInstance?.attention}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="attention-label" class="property-label"><g:message code="standard.attention.label" default="Attention" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="attention-label"><g:fieldValue bean="${standardInstance}" field="attention"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="equipmentCatagory-label" class="property-label"><g:message code="standard.equipmentCatagory.label" default="Equipment Catagory" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="equipmentCatagory-label"><g:link controller="equipmentCatagory" action="show" id="${standardInstance?.equipmentCatagory?.id}">${standardInstance?.equipmentCatagory?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardInstance?.equipmentCatagory}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="equipmentCatagory-label" class="property-label"><g:message code="standard.equipmentCatagory.label" default="Equipment Catagory" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="equipmentCatagory-label"><g:link controller="equipmentCatagory" action="show" id="${standardInstance?.equipmentCatagory?.id}">${standardInstance?.equipmentCatagory?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="name-label" class="property-label"><g:message code="standard.name.label" default="Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${standardInstance}" field="name"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardInstance?.name}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="name-label" class="property-label"><g:message code="standard.name.label" default="Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${standardInstance}" field="name"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="reference-label" class="property-label"><g:message code="standard.reference.label" default="Reference" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="reference-label"><g:fieldValue bean="${standardInstance}" field="reference"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${standardInstance?.reference}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="reference-label" class="property-label"><g:message code="standard.reference.label" default="Reference" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="reference-label"><g:fieldValue bean="${standardInstance}" field="reference"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="standardItems-label" class="property-label"><g:message code="standard.standardItems.label" default="Standard Items" /></span></th>
                <td>
                    <g:each in="${standardInstance.standardItems}" var="s">
                        <span class="property-value" aria-labelledby="standardItems-label"><g:link controller="standardItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
                    </g:each>
                    </td>

                    </tr>






				%{--<g:if test="${standardInstance?.standardItems}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="standardItems-label" class="property-label"><g:message code="standard.standardItems.label" default="Standard Items" /></span>--}%
					%{----}%
						%{--<g:each in="${standardInstance.standardItems}" var="s">--}%
						%{--<span class="property-value" aria-labelledby="standardItems-label"><g:link controller="standardItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:standardInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${standardInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${standardInstance?.id}" resource="${standardInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
