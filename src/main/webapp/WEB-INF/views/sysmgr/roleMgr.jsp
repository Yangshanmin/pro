<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>角色管理</title>
<script>
var perm = '';
<shiro:hasPermission name="role:edit">
	perm = '<a class="edit" href="javascript:void(0)" title="修改">修改</a>&nbsp;&nbsp;'
		+ '<a class="authorize" href="javascript:void(0)" title="权限设置">权限设置</a>&nbsp;&nbsp;'
        +'<a class="remove" href="javascript:void(0)" title="删除">删除</a>';
</shiro:hasPermission>
</script>
</head>
<body>

	<div class="container-fluid">
	
		<div class="row" id="divSearch">
			<div class="col-md-3 col-lg-3">
				<button type="button" class="btn btn-default btn-md add">添加</button>
				<!-- data-toggle="modal" data-target="#myModal" -->
			</div>
			<div class="col-md-9 col-lg-9 text-right">
				<form class="form-search form-inline" action="#">
					<div class="form-group">
						<label for="search_roleName">角色名称：</label> 
						<input type="text" class="form-control" id="search_roleName" placeholder="请输入角色名称" />
					</div>
					<button type="button" class="btn btn-default" id="btnSearch">查询</button>
				</form>
			</div>
		</div>

		<div class="row">
			<table id="table" class="table table-condensed table-hover">
			</table>
		</div>

	</div>

	<!-- Modal 新增修改 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加</h4>
				</div>
				<div class="modal-body">
					<form id="formSave" class="form-save form-horizontal" method="post" action="#">
						<input type="hidden" id="roleId" name="roleId"/>
						<div class="form-group">
							<label for="roleName" class="col-sm-3 control-label">角色名称：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="roleName" name="roleName" placeholder="角色名称" maxlength="64">
								<div class="help-inline"><font color="red">*</font></div>
							</div>
						</div>
						<div class="form-group">
							<label for="roleDesc" class="col-sm-3 control-label">描述：</label>
							<div class="col-sm-9">
								<textarea class="form-control" rows="3" id="roleDesc" name="roleDesc" placeholder="描述" maxlength="1000"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnSave">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal 配置角色权限 -->
	<div class="modal fade" id="roleResModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">设置角色菜单权限</h4>
				</div>
				<div class="modal-body" style="height:400px;">
					<iframe id="frmRoleRes" width="100%" height="100%" frameborder="0"></iframe>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnSaveRoleResModal">保存</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {

			var $table = $('#table');
			$table.bootstrapTable({
				url : '${ctx}/sysmgr/pageQueryRole',
				height : getTableHeight(),
				columns : [ {
					field : 'roleId',
					title : '编号',
					width : '10%',
					align : 'center'
				}, {
					field : 'roleName',
					title : '角色名称',
					width : '15%',
					align : 'center',
					cellStyle : ellipsis
				}, {
					field : 'roleDesc',
					title : '描述',
					width : '20%',
					align : 'center',
					cellStyle : ellipsis
				}, {
					field : 'modifyUser',
					title : '创建人',
					width : '10%',
					align : 'center'
				}, {
					field : 'createTime',
					title : '创建时间',
					formatter : Utils.tranDateStr,
					width : '10%',
					align : 'center'
				}, {
					field : 'roleId',
					title : '操作',
					formatter : operateFormatter,
					events : operateEvents,
					width : '15%',
					align : 'center'
				} ]
			});
			
			$table.on('load-success.bs.table', function (data) {
				//console.log("load-success...");
			});

			$(window).resize(function() {
				$table.bootstrapTable('resetView', {
					height : getTableHeight()
				});
			});

			// 新增
			$(".add").click(function() {
				$(".form-save").clearForm();
				$('#myModal').modal('show');
				$('#myModalLabel').html('新增');
			});
			
			$("#formSave").validate({
				rules: {
					roleName: {required:true,maxlength:64},
					roleDesc: {maxlength:1000}
				}
			});

			// 保存
			$("#btnSave").click(function() {
				if($("#formSave").valid()){
					var obj = $(".form-save").getFormObject();
					$.ajaxPostJson("${ctx}/sysmgr/saveOrUpdateRole", obj, function(result) {
						$('#table').bootstrapTable("refresh");
						$('#myModal').modal('hide');
						showMessage("操作成功!");
					});
				}
			});

			//查询
			$("#btnSearch").click(function() {
				$table.bootstrapTable("refresh");
			});
			
			//保存权限
			$("#btnSaveRoleResModal").click(function(){
				var retInfo = document.getElementById('frmRoleRes').contentWindow.getRoleCheckedNodes();
				$('#roleResModal').modal('hide');
				$.ajaxPost("${ctx}/sysmgr/saveRoleRes",{roleId:retInfo.roleId,resIds:retInfo.resIds},function(result){
					showMessage('操作成功');
				});
			});

		});
		
		// 修改、删除
		function operateFormatter(value, row, index) {
			return perm;
		}

		window.operateEvents = {
			'click .edit' : function(e, value, row, index) {
				$('#myModal').modal('show');
				$('#myModalLabel').html('修改');
				$.ajaxPostJson("${ctx}/sysmgr/getRoleById/" + row.roleId, {}, function(result) {
					if (result) {
						$(".form-save").setFormObject(result);
					}
				});
			},
			'click .authorize' : function(e, value, row, index) {
				$('#roleResModal').modal('show');
				$("#frmRoleRes").attr('src',"${ctx}/sysmgr/roleRes/"+row.roleId);
			},
			'click .remove' : function(e, value, row, index) {
				confirmMsg("确认删除?",null,function(){
					$.ajaxPostJson("${ctx}/sysmgr/deleteRole/" + row.roleId, {}, function(result) {
						$('#table').bootstrapTable("refresh");
						showMessage("操作成功!");
					});
				});
			}
		};

	</script>

</body>
</html>
