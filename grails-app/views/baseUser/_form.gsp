<%@ page import="com.petrodata.pms.core.BaseUser" %>




<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="baseUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="username" required="" value="${baseUserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="baseUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="password" required="" value="${baseUserInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="baseUser.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" class="form-control input-sm m-b-10"  name="email" required="" value="${baseUserInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="baseUser.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="firstName" required="" value="${baseUserInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="baseUser.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="lastName" required="" value="${baseUserInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'baseDepartment', 'error')} required">
	<label for="baseDepartment">
		<g:message code="baseUser.baseDepartment.label" default="Base Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="baseDepartment" name="baseDepartment.id" from="${com.petrodata.pms.core.BaseDepartment.list()}" optionKey="id" required="" value="${baseUserInstance?.baseDepartment?.id}" class="form-control input-lg m-b-10"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="baseUser.position.label" default="Position" />
		
	</label>
	<g:select id="position" name="position.id" from="${com.petrodata.pms.team.Position.list()}" optionKey="id" value="${baseUserInstance?.position?.id}" class="form-control input-lg m-b-10" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="baseUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${baseUserInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="baseUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${baseUserInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="baseUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${baseUserInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: baseUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="baseUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${baseUserInstance?.passwordExpired}" />
</div>

