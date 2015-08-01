
<%@ page import="com.petrodata.pms.equipment.Equipment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script>
			function deleteFormatter(value, row) {
				var str='<button class="btn btn-default margin" onclick="deleteOne('+row.id+')" type="button"><span class="glyphicon glyphicon-trash"></span> &nbsp;<g:message code="default.button.delete.label" default="Delete" /></button></a>';
				return str;
			}
			function editFormatter(value, row,index) {
				var str='<button class="btn btn-default margin box-switcher" data-switch="box-edit" onclick="editOne('+index+','+row.id+')"  type="button"><span class="glyphicon glyphicon-edit"></span> &nbsp;<g:message code="default.button.edit.label" default="Edit" /></button></a>';
				return str;
			}
			function nameFormatter(value, row,index) {
				var str='<a href="javascript:void(0);" class="box-switcher" data-switch="box-edit" onclick="showOne('+index+','+row.id+')" >'+row.name+'</a>';
				return str;
			}
			function queryParams(params) {
				//params.your_param1 = 1;
				return params;
			}
			function deleteAll(){
				var selects=$('#equipmentTable').bootstrapTable('getSelections');
				if(selects.length>0){
					var ids=new Array();
					for(var i=0;i<selects.length;i++){
						ids.push(selects[i].id);
					}
					var obj=new Object();
					obj.ids=ids.join(",");
					if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
						$.post("${request.contextPath}/equipment/deleteAll", obj,
								function (data, textStatus) {
									if (data.result) {
										$('#alertSucess').removeClass('hide');
										setTimeout(function(){
											$('#alertSucess').addClass('hide');
										}, 2000);
										$('#equipmentTable').bootstrapTable('refresh',[]);
									} else {
										$('#alertFault').removeClass('hide');
									}
								}, "json");
					}
				}
			}
			function newOne(){
				$('#equipmentForm').form('clear');
			}
			function deleteOne(id){

			}
			function editOne(index,id){
				$('#equipmentForm').form('clear');
				var data=$('#equipmentTable').bootstrapTable('getData');
				$('#equipmentForm').form('load',data[index]);
			}
			function showOne(index,id){
				editOne(index,id);
			}
			function importExcel(){
				$('#excelForm').form('submit', {
					url:'${request.contextPath}/equipment/importExel',
					success: function(data){
						var data = eval('(' + data + ')'); // change the JSON string to javascript object
						$('#myModal').modal('hide');
						if (data.result){
							$('#alertSucess').removeClass('hide');
							setTimeout(function(){
								$('#alertSucess').addClass('hide');
							}, 2000);
							$('#equipmentTable').bootstrapTable('refresh',[]);
						}else{
							$('#alertFault').removeClass('hide');
						}
					}
				});
			}
			$(function(){
				$('#equipmentForm').form({
					success: function(data){
						var data = eval('(' + data + ')'); // change the JSON string to javascript object
						if (data.result){
						    $('#alertSucess').removeClass('hide');
							setTimeout(function(){
								$('#alertSucess').addClass('hide');
							}, 2000);
							$('#box-edit').closest('.box').toggleClass('active');
							$('#box-list').closest('.box').addClass('active');
							$('#equipmentTable').bootstrapTable('refresh',[]);
						}else{
						   $('#alertFault').removeClass('hide');
						}
					}
				});
			});
		</script>
	</head>
	<body>

	<div >

		<div class="row">
			<ol class="breadcrumb">
				<li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active" >下属设备</li>
			</ol>
		</div><!--/.row-->

		<div class="row">
		<div class="col-lg-12" style="height: 10px">

		</div>
		</div><!--/.row-->
		<div class="alert bg-success hide" id="alertSucess" role="alert">
			<span class="glyphicon glyphicon-check"></span>
			<g:message code="default.sucess.label" default="Sucess" />    <!--  data-dismiss="alert" -->
			<a href="#" class="pull-right" onclick="$('#alertSucess').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
		</div>

		<div class="alert bg-danger hide" id="alertFault" role="alert">
			<span class="glyphicon glyphicon-exclamation-sign"> </span>
			<g:message code="default.fault.label" default="Fault" />

			<a href="#" class="pull-right" onclick="$('#alertFault').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
		</div>

		<div class="row box animated tile active" id="box-list">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<g:form method="post">
						<div class="panel-heading">
							下属设备列表
						</div>
						<div class="panel-body">
							<div  id="toolbar">

								<button class="btn btn-default margin box-switcher" onclick="newOne()" type="button" data-switch="box-edit">
									<span class="glyphicon glyphicon-plus"></span>
									<g:message code="default.new.label" args="[entityName]" />
								</button>

								<button class="btn btn-default margin" type="button"  onclick="deleteAll()" >
									<span class="glyphicon glyphicon-trash"></span>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>

							</div>
							<table id="equipmentTable" data-toggle="table"   data-toolbar="#toolbar"
								   data-url="${request.contextPath}/equipment/json"   data-cache="false"
								   data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"
								   data-side-pagination="server" data-pagination="true" data-query-params="queryParams"
								   data-select-item-name="checkIds" data-sort-name="id" data-sort-order="asc">
								<thead>
								<tr>
									<th data-field="nofield" data-checkbox="true"></th>

									<th data-field="name"  data-sortable="true"  data-formatter="nameFormatter"  >${message(code: 'equipment.name.label', default: 'Name')}</th>

									<th data-field="standard.text"  >${message(code: 'equipment.standard.label', default: 'Standard')}</th>


									
									<th data-field="techState"  data-sortable="true"   >${message(code: 'equipment.techState.label', default: 'Tech State')}</th>
									
									<th data-field="serviceState"  data-sortable="true"   >${message(code: 'equipment.serviceState.label', default: 'Service State')}</th>
									
									<th data-field="feature"  data-sortable="true"   >${message(code: 'equipment.feature.label', default: 'Feature')}</th>
									
									<th data-field="id" data-formatter="editFormatter"><g:message code="default.button.edit.label" default="Edit" /></th>
									<!--<th data-field="id" data-formatter="deleteFormatter"><g:message code="default.button.delete.label" default="Delete" /></th>-->

								</tr>
								</thead>
							</table>

						</div>
					</g:form>
				</div>
			</div>
		</div><!--/.row-->

		<div class="row box animated tile"  id="box-edit">
			<div class="col-lg-12 form-group">
						<div class="panel panel-default">
							<div class="panel-heading"><g:message code="default.info.label" args="[entityName]" /></div>
							<div class="panel-body">
				<form  role="form"  action='${request.contextPath}/equipment/serverSave'  class="form-horizontal" id="equipmentForm" enctype="multipart/form-data" method="post" >
					<g:hiddenField name="version" value="${equipmentInstance?.version}" />
					<g:hiddenField name="id" value="${equipmentInstance?.id}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<button class="btn btn-default margin" type="submit"  ><span class="glyphicon glyphicon-check"></span> &nbsp;${message(code: 'default.submit.label', default: 'Submit')}</button>
						<button class="btn btn-default margin  box-switcher"  data-switch="box-list"  type="button"><span class="glyphicon glyphicon-list-alt"></span> &nbsp;${message(code: 'default.button.back.label', default: 'Back')}</button>
					</fieldset>
				</form>
							</div>
						</div>
			</div>
	</div><!--/.row-->

	</div>

	</body>
</html>
