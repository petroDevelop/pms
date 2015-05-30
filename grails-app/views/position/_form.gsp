<%@ page import="com.petrodata.pms.team.Position" %>

<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="position.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" maxlength="100" required="" value="${positionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'eptCatas', 'error')} required">
	<label for="eptCatas">
		<g:message code="position.equipmentCatagory.label" default="Equipment Catagory" />
		<span class="required-indicator">*</span>
	</label>

	<ul>
	<g:each in="${com.petrodata.pms.equipment.EquipmentCatagory.findAllByParentIsNull(['sort':'name','order':'asc'])}" var="ec" status="i">
		<li><input type="checkbox" name="eptCatas" id="eptCatas${i}"
			   <g:if test="${positionInstance?.eptCatas?.contains(ec)}">
				   checked="true"
			   </g:if>
			   value="${ec?.id}" /><label for="eptCatas${i}">${ec?.name}</label></li>
		<g:if test="${positionInstance?.eptCatas?.contains(ec)}">
		<script>
			(function() {
				document.getElementById("eptCatas${i}").click();
			});
		</script>
		</g:if>
	</g:each>
	</ul>
</div>

