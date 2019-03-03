<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<jsp:include page="../common/decorator.jsp"></jsp:include>
<jsp:include page="../common/taglib.jsp"></jsp:include>

<html>
<head>
<title>用户管理</title>
</head>

<body>

	<div class="container-fluid">
	
		<div class="row" id="divSearch">
			<div class="col-md-3 col-lg-3">
				<c:if test="${organId==null }">
				<button type="button" class="btn btn-default btn-md add">添加</button><!-- data-toggle="modal" data-target="#myModal" -->
				</c:if>
			</div>
			<div class="col-md-9 col-lg-9 text-right">
				<form class="form-search form-inline" action="#">
					<div class="form-group">
						<label for="search_userName">姓名：</label> <input type="text"
							class="form-control" id="search_userName" placeholder="请输入姓名" />
					</div>
					<div class="form-group">
						<label for="search_mobileLike">手机号：</label> <input type="text"
							class="form-control" id="search_mobileLike" placeholder="请输入手机号" />
					</div>
					<button type="button" class="btn btn-default" id="btnSearch">查询</button>
				</form>
			</div>
		</div>

		<div class="row">
			<table id="table"
				class="table  table-condensed table-hover">
			</table>
		</div>

	</div>

	<!-- Modal 新增修改-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
						<input type="hidden" id="userId" name="userId"/>
						<div class="form-group">
							<label for="mobile" class="col-sm-2 control-label">手机号：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="mobile" name="mobile" maxlength="11" placeholder="手机号">
								<div class="help-inline"><font color="red">*</font></div>
							</div>
						</div>
						<div class="form-group">
							<label for="userName" class="col-sm-2 control-label">姓名：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userName" name="userName" placeholder="姓名">
								<div class="help-inline"><font color="red">*</font></div>
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
	
	<script type="text/javascript">
		var validator;
		$(function() {

			var $table = $('#table');
			$table.bootstrapTable({
				url : '${ctx}/projectMgr/pageQuery',
				height : getTableHeight(),
				columns : [ {
					field : 'mobile',
					title : '手机号',
					width : '10%',
					align : 'center'
				}, {
					field : 'userName',
					title : '姓名',
					cellStyle : ellipsis,
					width : '10%',
					align : 'center'
				}, {
					field : 'projects',
					title : '项目',
					cellStyle : ellipsis,
					width : '30%',
					align : 'center'
				}, {
					field : 'updateTime',
					title : '更新时间',
					width : '10%',
					align : 'center'
				}, {
					field : 'userId',
					title : '操作',
					formatter : operateFormatter,
					events : operateEvents,
					width : '10%',
					align : 'center'
				} ]
			});
			
			$table.on('load-success.bs.table', function (data) {
				//console.log("load-success...");
			});
			
			validator = $("#formSave").validate({
				rules: {
					mobile: {required:true,mobile:true},
					userName: {required:true,maxlength:32}
				}
			});

			// 新增
			$(".add").click(function() {
				$(".form-save").clearForm();
				$('#myModalLabel').html('新增');
				$('#myModal').modal('show');
				validator.resetForm();//清除验证错误的显示
			});

			// 保存
			$("#btnSave").click(function() {
				var userId = $("#userId").val();
				if($("#formSave").valid()){
					var obj = $(".form-save").getFormObject();
					$.ajaxPostJson("${ctx}/projectMgr/saveOrUpdate", obj, function(result) {
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

			$(window).resize(function() {
				// 表格
				$table.bootstrapTable('resetView', {
					height : getTableHeight()
				});
			});

		});
		
		// 修改、删除
		function operateFormatter(value, row, index) {
			var html = '';
			html += '<a class="edit" href="javascript:void(0)">修改</a>&nbsp;&nbsp;';
			html += '<a class="remove" href="javascript:void(0)">删除</a>&nbsp;&nbsp;';
			return html;
		}

		window.operateEvents = {
			'click .edit' : function(e, value, row, index) {
				validator.resetForm();//清除验证错误的显示
				$('#myModal').modal('show');
				$('#myModalLabel').html('修改');
				$.ajaxPostJson("${ctx}/projectMgr/getById/" + row.userId, {}, function(result) {
					if (result) {
						$(".form-save").setFormObject(result);
					}
				});
			},
			'click .remove' : function(e, value, row, index) {
				$.ajaxPostJson("${ctx}/projectMgr/delete/" + row.userId, {}, function(result) {
					$('#table').bootstrapTable("refresh");
					showMessage("操作成功!");
				});
			}
		};

	</script>
</body>
</html>
