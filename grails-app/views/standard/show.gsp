
<%@ page import="com.petrodata.pms.equipment.Standard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'standard.label', default: 'Standard')}" />
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
		

		<tr><th>	<span id="attention-label" class="property-label"><g:message code="standard.attention.label" default="Attention" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="attention-label"><g:fieldValue bean="${standardInstance}" field="attention"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="equipmentCatagory-label" class="property-label"><g:message code="standard.equipmentCatagory.label" default="Equipment Catagory" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="equipmentCatagory-label"><g:link controller="equipmentCatagory" action="show" id="${standardInstance?.equipmentCatagory?.id}">${standardInstance?.equipmentCatagory?.encodeAsHTML()}</g:link></span>
				</td>

		</tr>

		

		<tr><th>	<span id="name-label" class="property-label"><g:message code="standard.name.label" default="Name" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${standardInstance}" field="name"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="reference-label" class="property-label"><g:message code="standard.reference.label" default="Reference" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="reference-label"><g:fieldValue bean="${standardInstance}" field="reference"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="standardItems-label" class="property-label"><g:message code="standard.standardItems.label" default="Standard Items" /></span></th>
			<td>
				<g:each in="${standardInstance.standardItems}" var="s">
					<span class="property-value" aria-labelledby="standardItems-label"><g:link controller="standardItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
				</g:each>
				</td>

		</tr>

		   </table>


	<g:form url="[resource:standardInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:hiddenField name="id" value="${standardInstance?.id}" />
			<g:link class="btn btn-default margin" action="edit"  id="${standardInstance?.id}" resource="${standardInstance}">
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
