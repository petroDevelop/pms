<%@ page import="com.petrodata.pms.team.Rotation" %>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="rotation.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" maxlength="100" required="" value="${rotationInstance?.name}"/>
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
	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-format="hh:ii">
		<input class="form-control" size="16" type="text" id="beginTime" name="beginTime" value="${rotationInstance.beginTime}" readonly>
		<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="rotation.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-format="hh:ii">
		<input class="form-control" size="16" type="text" id="endTime" name="endTime" value="${rotationInstance.endTime}" readonly>
		<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'hours', 'error')} required">
	<label for="hours">
		<g:message code="rotation.hours.label" default="Hours" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:textField class="form-control input-sm m-b-10" name="hours" required="" value="${rotationInstance?.hours}"/>--}%
	<g:select class="form-control input-lg m-b-10"  id="hours" name="hours" from="${com.petrodata.pms.team.Rotation.listHours()}" value="${rotationInstance?.hours}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'checkTime', 'error')} required">
	<label for="checkTime">
		<g:message code="rotation.checkTime.label" default="Check Time" />
		<span class="required-indicator">*</span>
	</label>
	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-format="hh:ii">
		<input class="form-control" size="16" type="text"  id="checkTime" name="checkTime" value="${rotationInstance.checkTime}" readonly>
		<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'chargeDailyCheck', 'error')} ">
	<label for="chargeDailyCheck">
		<g:message code="rotation.chargeDailyCheck.label" default="Charge Daily Check" />
	</label>
	<g:checkBox name="chargeDailyCheck" value="${rotationInstance?.chargeDailyCheck}" />
</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="rotation.creater.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${com.petrodata.pms.core.BaseUser.list()}" optionKey="id" required="" value="${rotationInstance?.creator?.id}" class="form-control input-lg m-b-10"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'timeZone', 'error')} required">
	<label for="timeZone">
		<g:message code="rotation.timeZone.label" default="Time Zone" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control input-lg m-b-10"  id="timeZone" name="timeZone" from="${com.petrodata.pms.team.Rotation.listTimeZone()}" value="${rotationInstance?.timeZone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rotationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="rotation.description.label" default="Description" />
	</label>
	<g:textArea name="description" class="form-control overflow"  cols="40" rows="5" maxlength="500" value="${rotationInstance?.description}"/>
</div>

<script>
	$('.form_time').datetimepicker({
		language:  'zh-CN',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
	});
</script>

