
<%@ page import="com.petrodata.pms.core.BaseDepartment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'baseDepartment.label', default: 'BaseDepartment')}" />
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
		<div class="col-lg-12">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
	</div><!--/.row-->

	<table class="table tile">
		

		<tr><th>	<span id="name-label" class="property-label"><g:message code="baseDepartment.name.label" default="Name" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${baseDepartmentInstance}" field="name"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="parent-label" class="property-label"><g:message code="baseDepartment.parent.label" default="Parent" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="parent-label"><g:link controller="baseDepartment" action="show" id="${baseDepartmentInstance?.parent?.id}">${baseDepartmentInstance?.parent?.encodeAsHTML()}</g:link></span>
				</td>

		</tr>

		

		<tr><th>	<span id="reason-label" class="property-label"><g:message code="baseDepartment.reason.label" default="Reason" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="reason-label"><g:fieldValue bean="${baseDepartmentInstance}" field="reason"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="baseUsers-label" class="property-label"><g:message code="baseDepartment.baseUsers.label" default="Base Users" /></span></th>
			<td>
				<g:each in="${baseDepartmentInstance.baseUsers}" var="b">
					<span class="property-value" aria-labelledby="baseUsers-label"><g:link controller="baseUser" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
				</g:each>
				</td>

		</tr>

		

		<tr><th>	<span id="children-label" class="property-label"><g:message code="baseDepartment.children.label" default="Children" /></span></th>
			<td>
				<g:each in="${baseDepartmentInstance.children}" var="c">
					<span class="property-value" aria-labelledby="children-label"><g:link controller="baseDepartment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
				</g:each>
				</td>

		</tr>

		

		<tr><th>	<span id="isContainer-label" class="property-label"><g:message code="baseDepartment.isContainer.label" default="Is Container" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="isContainer-label"><g:formatBoolean boolean="${baseDepartmentInstance?.isContainer}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="isTeam-label" class="property-label"><g:message code="baseDepartment.isTeam.label" default="Is Team" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="isTeam-label"><g:formatBoolean boolean="${baseDepartmentInstance?.isTeam}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="isWorking-label" class="property-label"><g:message code="baseDepartment.isWorking.label" default="Is Working" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="isWorking-label"><g:formatBoolean boolean="${baseDepartmentInstance?.isWorking}" /></span>
				</td>

		</tr>

		   </table>


	<g:form url="[resource:baseDepartmentInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:hiddenField name="id" value="${baseDepartmentInstance?.id}" />
			<g:link class="btn btn-default margin" action="edit"  id="${baseDepartmentInstance?.id}" resource="${baseDepartmentInstance}">
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
