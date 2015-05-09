<%@ page import="com.petrodata.pms.core.BaseDepartment" %>




<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="baseDepartment.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" maxlength="50" required="" value="${baseDepartmentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="baseDepartment.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${com.petrodata.pms.core.BaseDepartment.list()}" optionKey="id" value="${baseDepartmentInstance?.parent?.id}" class="form-control input-lg m-b-10" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'reason', 'error')} ">
	<label for="reason">
		<g:message code="baseDepartment.reason.label" default="Reason" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="reason" maxlength="100" value="${baseDepartmentInstance?.reason}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'baseUsers', 'error')} ">
	<label for="baseUsers">
		<g:message code="baseDepartment.baseUsers.label" default="Base Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${baseDepartmentInstance?.baseUsers?}" var="b">
    <li><g:link controller="baseUser" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="baseUser" action="create" params="['baseDepartment.id': baseDepartmentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'baseUser.label', default: 'BaseUser')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'children', 'error')} ">
	<label for="children">
		<g:message code="baseDepartment.children.label" default="Children" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${baseDepartmentInstance?.children?}" var="c">
    <li><g:link controller="baseDepartment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="baseDepartment" action="create" params="['baseDepartment.id': baseDepartmentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'isContainer', 'error')} ">
	<label for="isContainer">
		<g:message code="baseDepartment.isContainer.label" default="Is Container" />
		
	</label>
	<g:checkBox name="isContainer" value="${baseDepartmentInstance?.isContainer}" />
</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'isTeam', 'error')} ">
	<label for="isTeam">
		<g:message code="baseDepartment.isTeam.label" default="Is Team" />
		
	</label>
	<g:checkBox name="isTeam" value="${baseDepartmentInstance?.isTeam}" />
</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'isWorking', 'error')} ">
	<label for="isWorking">
		<g:message code="baseDepartment.isWorking.label" default="Is Working" />
		
	</label>
	<g:checkBox name="isWorking" value="${baseDepartmentInstance?.isWorking}" />
</div>

