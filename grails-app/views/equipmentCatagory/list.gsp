
<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="modal fade panel" id="myModal" tabindex="-1" role="dialog"
		 aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close"
							data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						模态框（Modal）标题
					</h4>
				</div>
				<div class="modal-body">
					在这里添加一些文本
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
							data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
		<div >

			<div class="row">
				<ol class="breadcrumb">
					<li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
					<li class="active" data-toggle="modal"
						data-target="#myModal"><g:message code="equipmentCatagory.label" default="EquipmentCatagory" /></li>
				</ol>
			</div><!--/.row-->

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"><g:message code="equipmentCatagory.label" default="EquipmentCatagory" /></h1>
				</div>
			</div><!--/.row-->


			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<g:form method="post">
						<div class="panel-heading"><g:message code="default.list.label" args="[entityName]" /></div>
						<div class="panel-body">
							                   <!--	sidePagination="client"
							                    data-method="post"
								                data-query-params="postQueryParams"
							                   	data-height="400"  data-page-list="[5, 10, 20, 50, 100, 200]"-->
							<table data-toggle="table" data-url="${request.contextPath}/equipmentCatagory/json"
								   data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"
								   data-side-pagination="server"
								   data-pagination="true"
								   data-query-params="queryParams"
								   data-select-item-name="toolbar1" data-sort-name="name" data-sort-order="desc">
								<thead>
								<tr>
									<th data-field="name" data-checkbox="true" >${message(code: 'equipmentCatagory.name.label', default: 'Name')}</th>

									<th data-field="code" data-sortable="true" >${message(code: 'equipmentCatagory.code.label', default: 'Code')}</th>

									<th data-field="parent" data-sortable="true" ><g:message code="equipmentCatagory.parent.label" default="Parent" /></th>

									<th data-field="isSpecial" data-sortable="true" >${message(code: 'equipmentCatagory.isSpecial.label', default: 'Is Special')}</th>

									<th data-field="specification" data-sortable="true" >${message(code: 'equipmentCatagory.specification.label', default: 'Specification')}</th>

									<th>操作</th>
								</tr>
								</thead>
							</table>

						</div>
						</g:form>
					</div>
				</div>
			</div><!--/.row-->
			<script>
				function queryParams(params) {
					params.your_param1 = 1; // add param1
					params.your_param2 = 2; // add param2
					// console.log(JSON.stringify(params));
					// {"limit":10,"offset":0,"order":"asc","your_param1":1,"your_param2":2}
					return params;
				}
				function postQueryParams(params) {
					params.your_param1 = 1; // add param1
					params.your_param2 = 2; // add param2
					return JSON.stringify(params); // body data
				}
			</script>
		</div>
	</body>
</html>