<%@ page import="com.petrodata.pms.team.Rotation" %>



<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="rotation.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" maxlength="100" required="" value="${rotationInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="rotation.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" class="form-control overflow"  cols="40" rows="5" maxlength="500" value="${rotationInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'baseDepartment', 'error')} required">
	<label for="baseDepartment">
		<g:message code="rotation.baseDepartment.label" default="Base Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="baseDepartment" name="baseDepartment.id" from="${com.petrodata.pms.core.BaseDepartment.list()}" optionKey="id" required="" value="${rotationInstance?.baseDepartment?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'baseUsers', 'error')} ">
	<label for="baseUsers">
		<g:message code="rotation.baseUsers.label" default="Base Users" />
		
	</label>
	<g:select name="baseUsers" from="${com.petrodata.pms.core.BaseUser.list()}" multiple="multiple" optionKey="id" size="5" value="${rotationInstance?.baseUsers*.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'beginTime', 'error')} required">
	<label for="beginTime">
		<g:message code="rotation.beginTime.label" default="Begin Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="beginTime" class="form-control input-sm m-b-10"  type="number" value="${rotationInstance.beginTime}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'checkTime', 'error')} required">
	<label for="checkTime">
		<g:message code="rotation.checkTime.label" default="Check Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="checkTime" class="form-control input-sm m-b-10"  type="number" value="${rotationInstance.checkTime}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'creater', 'error')} required">
	<label for="creater">
		<g:message code="rotation.creater.label" default="Creater" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creater" name="creater.id" from="${com.petrodata.pms.core.BaseUser.list()}" optionKey="id" required="" value="${rotationInstance?.creater?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="rotation.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="endTime" class="form-control input-sm m-b-10"  type="number" value="${rotationInstance.endTime}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'timeZone', 'error')} required">
	<label for="timeZone">
		<g:message code="rotation.timeZone.label" default="Time Zone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="timeZone" required="" value="${rotationInstance?.timeZone}"/>

</div>

