
<%@ page import="com.petrodata.pms.team.Position" %>
<!DOCTYPE html>
<html>
<head>
	<g:if test="${!params.layout}">
		<meta name="layout" content="luminoPro">
	</g:if>
	<g:set var="entityName" value="${message(code: 'position.label', default: 'Position')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<script>
		function deleteFormatter(value, row) {
			var str='<a href="${request.contextPath}/position/delete/'+row.id+'"><button class="btn btn-default margin" type="button"><span class="glyphicon glyphicon-trash"></span> &nbsp;<g:message code="default.button.delete.label" default="Delete" /></button></a>';
			return str;
		}
		function editOne(id){
			window.location.href="${request.contextPath}/position/edit/"+id;
		}
		function editFormatter(value, row) {
			var str='<button class="btn btn-default margin" onclick="editOne('+row.id+')" type="button"><span class="glyphicon glyphicon-edit"></span> &nbsp;<g:message code="default.button.edit.label" default="Edit" /></button>';
			return str;
		}
		function nameFormatter(value, row) {
			var str='<a href="${request.contextPath}/position/show/'+row.id+'">'+row.name+'</a>';
			return str;
		}
		function queryParams(params) {
			//params.your_param1 = 1;
			return params;
		}
		function deleteAll(){
			var selects=$('#positionTable').bootstrapTable('getSelections');
			if(selects.length>0){
				var ids=new Array();
				for(var i=0;i<selects.length;i++){
					ids.push(selects[i].id);
				}
				var obj=new Object();
				obj.ids=ids.join(",");
				if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
					$.post("${request.contextPath}/position/deleteAll", obj,
							function (data, textStatus) {
								if (data.result) {
									$('#alertSucess').removeClass('hide');
									setTimeout(function(){
										$('#alertSucess').addClass('hide');
									}, 2000);
									$('#positionTable').bootstrapTable('refresh',[]);
								} else {
									$('#alertFault').removeClass('hide');
								}
							}, "json");
				}
			}
		}

		function importExcel(){
			$('#excelForm').form('submit', {
				url:'${request.contextPath}/position/importExel',
				success: function(data){
					var data = eval('(' + data + ')'); // change the JSON string to javascript object
					$('#myModal').modal('hide');
					if (data.result){
						$('#alertSucess').removeClass('hide');
						setTimeout(function(){
							$('#alertSucess').addClass('hide');
						}, 2000);
						$('#positionTable').bootstrapTable('refresh',[]);
					}else{
						$('#alertFault').removeClass('hide');
					}
				}
			});
		}
		function newWindow(){
			document.location.href="${createLink(controller: 'position',action:'create')}";
		}
		function autoCreate(){
			var r = window.confirm("确定从设备类别顶层树节点自动映射岗位么？");
			if(r){
				$.post("${request.contextPath}/position/autoCteate", null,
						function (data, textStatus) {
							if (data.result) {
								$('#alertSucess').removeClass('hide');
								setTimeout(function(){
									$('#alertSucess').addClass('hide');
								}, 2000);
								$('#positionTable').bootstrapTable('refresh',[]);
							} else {
								$('#alertFault').removeClass('hide');
							}
						}, "json");
			}
		}
		$(function() {
			$('#positionTable').bootstrapTable({});
		});
	</script>
</head>
<body>
<div class="modal fade panel" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close"
						data-dismiss="modal" aria-hidden="true">
				&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<g:message code="default.import.label" args="[entityName]" />
				</h4>
			</div>
			<div class="modal-body">
				<form  role="form" id="excelForm"  class="easyui-form"
					   enctype="multipart/form-data" method="post" >
					<input type="file" name="file" class="form-control input-sm m-b-10" required="" />
				</form>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default margin" onclick="importExcel()" type="button">
					<span class="glyphicon glyphicon-check"></span>
					<g:message code="default.submit.label" default="Submit"/>
				</button>
				<button class="btn btn-default margin" data-dismiss="modal" type="button">
					<span class="glyphicon glyphicon-circle-arrow-down"></span>
					<g:message code="default.close.label" default="Close"/>
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div >

	<div class="row">
		<ol class="breadcrumb">
			<li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active" ><g:message code="position.label" default="Position" /></li>
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
						<g:message code="default.list.label" args="[entityName]" />

					</div>
					<div class="panel-body">
						<div  id="toolbar">
							<button class="btn btn-default margin" onclick="autoCreate()" type="button" >
								<span class="glyphicon glyphicon-new-window"></span>
								依据设备类别自动创建
							</button>

							<button class="btn btn-default margin " onclick="newWindow()" type="button" >
								<span class="glyphicon glyphicon-plus"></span>
								<g:message code="default.new.label" args="[entityName]" />
							</button>

							<button class="btn btn-default margin" type="button"  onclick="deleteAll()" >
								<span class="glyphicon glyphicon-trash"></span>
								<g:message code="default.button.delete.label" default="Delete" />
							</button>

						</div>
						<table id="positionTable" data-toggle="table"  data-toolbar="#toolbar"
							   data-url="${request.contextPath}/position/json"   data-cache="false"
							   data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"
							   data-side-pagination="server" data-pagination="true" data-query-params="queryParams"
							   data-select-item-name="checkIds" data-sort-name="id" data-sort-order="asc">
							<thead>
							<tr>
								<th data-field="nofield" data-checkbox="true"></th>
								%{--<th data-field="id"  data-sortable="true" ></th>--}%
								<th data-field="name"  data-sortable="true"  data-formatter="nameFormatter" >
									${message(code: 'position.name.label', default: 'Name')}
								</th>
								<th data-field="eptCatas">
									${message(code: 'position.equipmentCatagory.label', default: 'Equipment Catagorys')}
								</th>
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



</div>

</body>
</html>
