<%@ page import="com.petrodata.pms.core.BaseRole" %>




<div class="fieldcontain ${hasErrors(bean: baseRoleInstance, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="baseRole.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="authority" required="" value="${baseRoleInstance?.authority}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseRoleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="baseRole.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" required="" value="${baseRoleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseRoleInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="baseRole.type.label" default="Type" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="type" value="${baseRoleInstance?.type}"/>
</div>

