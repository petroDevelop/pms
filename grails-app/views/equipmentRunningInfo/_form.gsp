<%@ page import="com.petrodata.pms.equipment.Equipment; com.petrodata.pms.equipment.EquipmentRunningInfo" %>
<%@ page import="com.petrodata.pms.core.BaseUser"%>
<%
	org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
	def loginUser = BaseUser.findByUsername(sec.username());
	def equipmentList=Equipment.findAllByInDepartment(loginUser?.baseDepartment);
%>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'equipment', 'error')} required">
	<label class="col-sm-2  control-label" for="equipment">
		<g:message code="equipmentRunningInfo.equipment.label" default="Equipment" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select id="equipment" name="equipment.id" from="${equipmentList}" optionKey="id" required="" value="${equipmentRunningInfoInstance?.equipment?.id}" class="form-control input-lg m-b-10"/>

	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'jobOrderInitDate', 'error')} required">
	<label class="col-sm-2  control-label" for="jobOrderInitDate">
		<g:message code="equipmentRunningInfo.jobOrderInitDate.label" default="Job Order Init Date" />
		<span class="required-indicator">*</span>
	</label>

	<div class="input-group date form_date col-md-5" id="jobOrderInitDateDIV" data-date="" data-date-format="yyyy-mm-dd" data-link-format="yyy-mm-dd"
		 data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
		<input class="form-control" size="16" type="text" id="jobOrderInitDate" name="jobOrderInitDate" value="${equipmentRunningInfoInstance?.jobOrderInitDate?.format('yyyy-MM-dd')}" readonly>
		<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'lastOverhaulTime', 'error')} required">
	<label class="col-sm-2  control-label" for="lastOverhaulTime">
		<g:message code="equipmentRunningInfo.lastOverhaulTime.label" default="Last Overhaul Time" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:field name="lastOverhaulTime" class="form-control input-sm m-b-10"  type="number" value="${equipmentRunningInfoInstance?.lastOverhaulTime}" required=""/>

	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'maintenanceInitTime', 'error')} required">
	<label class="col-sm-2  control-label" for="maintenanceInitTime">
		<g:message code="equipmentRunningInfo.maintenanceInitTime.label" default="Maintenance Init Time" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:field name="maintenanceInitTime" class="form-control input-sm m-b-10"  type="number" value="${equipmentRunningInfoInstance?.maintenanceInitTime}" required=""/>

	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'runningTime', 'error')} required">
	<label class="col-sm-2  control-label" for="runningTime">
		<g:message code="equipmentRunningInfo.runningTime.label" default="Running Time" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:field name="runningTime" class="form-control input-sm m-b-10"  type="number" value="${equipmentRunningInfoInstance?.runningTime}" required=""/>

	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'totalTime', 'error')} required">
	<label class="col-sm-2  control-label" for="totalTime">
		<g:message code="equipmentRunningInfo.totalTime.label" default="Total Time" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:field name="totalTime" class="form-control input-sm m-b-10"  type="number" value="${equipmentRunningInfoInstance?.totalTime}" required=""/>

	</div>
</div>

<script>
	$('.form_date').datetimepicker({
		language:  'zh-CN',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});

</script>
