<%@ page import="com.petrodata.pms.core.BaseUser; com.petrodata.pms.core.BaseDepartment" %>


 <input type="hidden" name="from" value="${params.from}"/>
<g:if test="${!baseDepartmentInstance}">
	<g:set var="baseDepartmentInstance" value="${new com.petrodata.pms.core.BaseDepartment()}"/>
</g:if>

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
	<g:set var="currentUser" value="${com.petrodata.pms.core.BaseUser.findByUsername(sec.username())}"/>
<sec:ifAnyGranted roles="ROLE_PROJECT">
	<input type="hidden" name="parent.id" value="${currentUser.baseDepartment?.id}"/>
	<input type="text"  class="form-control input-sm m-b-10" name="parentShow" value="${currentUser.baseDepartment?.name}" readonly disabled/>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_MANAGER,ROLE_ADMIN">
	<g:set var="list" value="${com.petrodata.pms.core.BaseDepartment.list()}"/>
	<g:if test="${params.from=='teamList'}">
		<g:set var="list" value="${com.petrodata.pms.core.BaseDepartment.findAllByType('项目部节点',['sort':'name','order':'asc'])}"/>
	</g:if>
	<g:if test="${params.from=='projectList'}">
		<g:set var="list" value="${com.petrodata.pms.core.BaseDepartment.findAllByParentIsNullAndType('公司节点',['sort':'name','order':'asc'])}"/>
	</g:if>
	<g:select id="parent" name="parent.id" from="${list}" optionKey="id"
			  value="${baseDepartmentInstance?.parent?.id}" class="form-control input-lg m-b-10" noSelection="['null': '']"/>
</sec:ifAnyGranted>
</div>


<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="baseDepartment.type.label" default="Type" />

	</label>
 	<sec:ifAnyGranted roles="ROLE_ADMIN">
		<g:select name="type" id="type" class="form-control input-lg m-b-10"
				  from="${baseDepartmentInstance?.constraints.type.inList}"
				  value="${baseDepartmentInstance?.type}"
				  valueMessagePrefix="baseDepartment.type"  />
 	</sec:ifAnyGranted>
<sec:ifNotGranted roles="ROLE_ADMIN">
	<%
		String type='';
		if(params.from=='projectList'){type='项目部节点'}
		if(params.from=='teamList'||params.from=='underTeamList'){type='小队节点'}
	%>
	<input type="hidden" name="type" value="${type}"/>
	<input type="text"  class="form-control input-sm m-b-10" name="typeShow" value="${type}" readonly disabled/>
</sec:ifNotGranted>

</div>

<g:if test="${params.from=='teamList' || params.from=='underTeamList' }">

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'isWorking', 'error')} ">
	<label for="isWorking">
		<g:message code="baseDepartment.isWorking.label" default="Is Working" />
		
	</label>
	<g:checkBox name="isWorking" value="${baseDepartmentInstance?.isWorking}" />
</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'reason', 'error')} ">
	<label for="reason">
		<g:message code="baseDepartment.reason.label" default="Reason" />

	</label>
	<g:textField class="form-control input-sm m-b-10"  name="reason" maxlength="100" value="${baseDepartmentInstance?.reason}"/>
</div>
</g:if>
<g:else>
	<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'children', 'error')} ">
		<label for="children">
			<g:message code="baseDepartment.children.label" default="Children" />

		</label>

		<ul class="one-to-many">
			<g:each in="${baseDepartmentInstance?.children?}" var="c">
				<li><g:link controller="baseDepartment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
			</g:each>

		</ul>

	</div>

</g:else>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="baseDepartment.latitude.label" default="Latitude" />
	</label>
	<g:textField class="form-control input-sm m-b-10" type="number"  name="latitude" maxlength="50" value="${baseDepartmentInstance?.latitude}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'longtitude', 'error')} required">
	<label for="longtitude">
		<g:message code="baseDepartment.longtitude.label" default="Longtitude" />
	</label>
	<g:textField class="form-control input-sm m-b-10" type="number" name="longtitude" maxlength="50" value="${baseDepartmentInstance?.longtitude}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baseDepartmentInstance, field: 'baseUsers', 'error')} ">
	<label for="baseUsers">
		<g:message code="baseDepartment.baseUsers.label" default="Base Users" />

	</label>

	<ul class="one-to-many">
		<g:each in="${baseDepartmentInstance?.baseUsers?}" var="b">
			<li>${b?.encodeAsHTML()}</li>
		</g:each>

	</ul>

</div>



