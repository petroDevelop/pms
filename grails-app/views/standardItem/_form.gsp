<%@ page import="com.petrodata.pms.equipment.StandardItem" %>


<g:if test="${!standardItemInstance}">
	<g:set var="standardItemInstance" value="${new com.petrodata.pms.equipment.StandardItem()}"/>
</g:if>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="standardItem.type.label" default="Type" />
		
	</label>
	<g:select name="type" id="standardItemType" class="form-control input-lg m-b-10"
			  from="${standardItemInstance?.constraints.type.inList}" value="${standardItemInstance?.type}" valueMessagePrefix="standardItem.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'aim', 'error')} ">
	<label for="aim">
		<g:message code="standardItem.aim.label" default="Aim" />
		
	</label>
	<g:select name="aim" class="form-control input-lg m-b-10"  from="${standardItemInstance?.constraints.aim.inList}" value="${standardItemInstance?.aim}" valueMessagePrefix="standardItem.aim" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'checkType', 'error')} ">
	<label for="checkType">
		<g:message code="standardItem.checkType.label" default="Check Type" />
		
	</label>
	<!--
	<ul>
		<g:set var="drawi" value="${-1}"/>
		<g:each in="${standardItemInstance?.constraints.checkType.inList}" var="one" status="i">
			<g:if test="${one==standardItemInstance.checkType}">
				<g:set var="drawi" value="${i}"/>
			</g:if>
			<li><input id="checkType${i}"  name="checkType" type="radio"><label for="checkType${i}">${one}</label></li>
		</g:each>
		<g:if test="${drawi>=0}">
			<script>
				document.getElementById("checkType${drawi}").click();
			</script>
		</g:if>
	</ul>
     -->
	<g:select name="checkType" class="form-control input-lg m-b-10"  from="${standardItemInstance?.constraints.checkType.inList}" value="${standardItemInstance?.checkType}" valueMessagePrefix="standardItem.checkType" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'checkDays', 'error')} required">
	<label for="checkDays">
		<g:message code="standardItem.checkDays.label" default="Check Days" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="checkDays" class="form-control input-sm m-b-10"  type="number" value="${standardItemInstance?.checkDays}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="standardItem.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" maxlength="50" required="" value="${standardItemInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'range', 'error')} ">
	<label for="range">
		<g:message code="standardItem.range.label" default="Range" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="range" maxlength="100" value="${standardItemInstance?.range}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'sop', 'error')} ">
	<label for="sop">
		<g:message code="standardItem.sop.label" default="Sop" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="sop" maxlength="100" value="${standardItemInstance?.sop}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'sopCode', 'error')} ">
	<label for="sopCode">
		<g:message code="standardItem.sopCode.label" default="Sop Code" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="sopCode" maxlength="100" value="${standardItemInstance?.sopCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'accessory', 'error')} ">
	<label for="accessory">
		<g:message code="standardItem.accessory.label" default="Accessory" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="accessory" maxlength="100" value="${standardItemInstance?.accessory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'excuteCycle', 'error')} required">
	<label for="excuteCycle">
		<g:message code="standardItem.excuteCycle.label" default="Excute Cycle" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="excuteCycle" class="form-control input-sm m-b-10"  type="number" value="${standardItemInstance?.excuteCycle}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'manhour', 'error')} required">
	<label for="manhour">
		<g:message code="standardItem.manhour.label" default="Manhour" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="manhour" class="form-control input-sm m-b-10"  type="number" value="${standardItemInstance?.manhour}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'standard', 'error')} required" style="display: none;">
	<label for="standard">
		<g:message code="standardItem.standard.label" default="Standard" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="standard" name="standard.id" from="${com.petrodata.pms.equipment.Standard.list()}" optionKey="id" required="" value="${standardItemInstance?.standard?.id}" class="form-control input-lg m-b-10"/>
</div>

<div class="fieldcontain ${hasErrors(bean: standardItemInstance, field: 'warningHour', 'error')} required">
	<label for="warningHour">
		<g:message code="standardItem.warningHour.label" default="Warning Hour" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="warningHour" class="form-control input-sm m-b-10"  type="number" value="${standardItemInstance?.warningHour}" required=""/>
</div>

