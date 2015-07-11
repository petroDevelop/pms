
<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
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


		<tr><th>	<span id="specification-label" class="property-label"><g:message code="equipmentCatagory.specification.label" default="Specification" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="specification-label"><g:fieldValue bean="${equipmentCatagoryInstance}" field="specification"/></span>
			</td>

		</tr>


		<tr><th>	<span id="children-label" class="property-label"><g:message code="equipmentCatagory.children.label" default="Children" /></span></th>
			<td>
				<g:each in="${equipmentCatagoryInstance.children}" var="c">
					<span class="property-value" aria-labelledby="children-label"><g:link controller="equipmentCatagory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
				</g:each>
			</td>

		</tr>


		<tr><th>	<span id="code-label" class="property-label"><g:message code="equipmentCatagory.code.label" default="Code" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${equipmentCatagoryInstance}" field="code"/></span>
			</td>

		</tr>

		<tr><th>	<span id="equipments-label" class="property-label"><g:message code="equipmentCatagory.equipments.label" default="Equipments" /></span></th>
			<td>
				<g:each in="${equipmentCatagoryInstance.equipments}" var="e">
					<span class="property-value" aria-labelledby="equipments-label"><g:link controller="equipment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
				</g:each>
			</td>

		</tr>


		<tr><th>	<span id="isSpecial-label" class="property-label"><g:message code="equipmentCatagory.isSpecial.label" default="Is Special" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="isSpecial-label"><g:formatBoolean boolean="${equipmentCatagoryInstance?.isSpecial}" /></span>
			</td>

		</tr>


		<tr><th>	<span id="name-label" class="property-label"><g:message code="equipmentCatagory.name.label" default="Name" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${equipmentCatagoryInstance}" field="name"/></span>
			</td>

		</tr>


		<tr><th>	<span id="parent-label" class="property-label"><g:message code="equipmentCatagory.parent.label" default="Parent" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="parent-label"><g:link controller="equipmentCatagory" action="show" id="${equipmentCatagoryInstance?.parent?.id}">${equipmentCatagoryInstance?.parent?.encodeAsHTML()}</g:link></span>
			</td>

		</tr>


	</table>


			<g:form url="[resource:equipmentCatagoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${equipmentCatagoryInstance?.id}" />
					<g:link class="btn btn-default margin" action="edit"  id="${equipmentCatagoryInstance?.id}" resource="${equipmentCatagoryInstance}">
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
