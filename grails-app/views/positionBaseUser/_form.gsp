<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils; com.petrodata.pms.team.PositionBaseUser" %>
<%@ page import="com.petrodata.pms.core.BaseUser" %>
<%
	org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
	def loginUser = BaseUser.findByUsername(sec.username());
	def list=BaseUser.findAllByBaseDepartmentAndIdNotEqual(loginUser?.baseDepartment,loginUser.id);
    %>

<div class="fieldcontain ${hasErrors(bean: positionBaseUserInstance, field: 'baseUser', 'error')} required">
	<label for="baseUser">
		<g:message code="positionBaseUser.baseUser.label" default="Base User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="baseUser" name="baseUser.id" from="${list}" optionKey="id" required="" value="${positionBaseUserInstance?.baseUser?.id}" class="form-control input-lg m-b-10"/>
</div>

<div class="fieldcontain ${hasErrors(bean: positionBaseUserInstance, field: 'position', 'error')} required">
	<label for="position">
		<g:message code="positionBaseUser.position.label" default="Position" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="position" name="position.id" from="${com.petrodata.pms.team.Position.list()}" optionKey="id" required="" value="${positionBaseUserInstance?.position?.id}" class="form-control input-lg m-b-10"/>
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
