
<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-equipmentCatagory" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipmentCatagory">  <table class="table tile">
			

                    <tr><th>	<span id="specification-label" class="property-label"><g:message code="equipmentCatagory.specification.label" default="Specification" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="specification-label"><g:fieldValue bean="${equipmentCatagoryInstance}" field="specification"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentCatagoryInstance?.specification}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="specification-label" class="property-label"><g:message code="equipmentCatagory.specification.label" default="Specification" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="specification-label"><g:fieldValue bean="${equipmentCatagoryInstance}" field="specification"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="children-label" class="property-label"><g:message code="equipmentCatagory.children.label" default="Children" /></span></th>
                <td>
                    <g:each in="${equipmentCatagoryInstance.children}" var="c">
                        <span class="property-value" aria-labelledby="children-label"><g:link controller="equipmentCatagory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                    </g:each>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentCatagoryInstance?.children}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="children-label" class="property-label"><g:message code="equipmentCatagory.children.label" default="Children" /></span>--}%
					%{----}%
						%{--<g:each in="${equipmentCatagoryInstance.children}" var="c">--}%
						%{--<span class="property-value" aria-labelledby="children-label"><g:link controller="equipmentCatagory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="code-label" class="property-label"><g:message code="equipmentCatagory.code.label" default="Code" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${equipmentCatagoryInstance}" field="code"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentCatagoryInstance?.code}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="code-label" class="property-label"><g:message code="equipmentCatagory.code.label" default="Code" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${equipmentCatagoryInstance}" field="code"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="equipments-label" class="property-label"><g:message code="equipmentCatagory.equipments.label" default="Equipments" /></span></th>
                <td>
                    <g:each in="${equipmentCatagoryInstance.equipments}" var="e">
                        <span class="property-value" aria-labelledby="equipments-label"><g:link controller="equipment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
                    </g:each>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentCatagoryInstance?.equipments}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="equipments-label" class="property-label"><g:message code="equipmentCatagory.equipments.label" default="Equipments" /></span>--}%
					%{----}%
						%{--<g:each in="${equipmentCatagoryInstance.equipments}" var="e">--}%
						%{--<span class="property-value" aria-labelledby="equipments-label"><g:link controller="equipment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="isSpecial-label" class="property-label"><g:message code="equipmentCatagory.isSpecial.label" default="Is Special" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="isSpecial-label"><g:formatBoolean boolean="${equipmentCatagoryInstance?.isSpecial}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentCatagoryInstance?.isSpecial}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="isSpecial-label" class="property-label"><g:message code="equipmentCatagory.isSpecial.label" default="Is Special" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="isSpecial-label"><g:formatBoolean boolean="${equipmentCatagoryInstance?.isSpecial}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="name-label" class="property-label"><g:message code="equipmentCatagory.name.label" default="Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${equipmentCatagoryInstance}" field="name"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentCatagoryInstance?.name}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="name-label" class="property-label"><g:message code="equipmentCatagory.name.label" default="Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${equipmentCatagoryInstance}" field="name"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="parent-label" class="property-label"><g:message code="equipmentCatagory.parent.label" default="Parent" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="parent-label"><g:link controller="equipmentCatagory" action="show" id="${equipmentCatagoryInstance?.parent?.id}">${equipmentCatagoryInstance?.parent?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentCatagoryInstance?.parent}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="parent-label" class="property-label"><g:message code="equipmentCatagory.parent.label" default="Parent" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="parent-label"><g:link controller="equipmentCatagory" action="show" id="${equipmentCatagoryInstance?.parent?.id}">${equipmentCatagoryInstance?.parent?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:equipmentCatagoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${equipmentCatagoryInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${equipmentCatagoryInstance?.id}" resource="${equipmentCatagoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
