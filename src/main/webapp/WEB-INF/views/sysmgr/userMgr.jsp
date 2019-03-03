<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>用户管理</title>
<!-- 
<link href="${ctx}/static/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/static/jquery-ztree/3.5.12/js/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-ztree/3.5.12/js/jquery.ztree.excheck-3.5.min.js" type="text/javascript"></script>
 -->
<script type="text/javascript">
var perm = '';
<shiro:hasAnyPermissions name="user:edit">
	perm += '<a class="edit" href="javascript:void(0)" title="修改">修改</a>&nbsp;&nbsp;';
</shiro:hasAnyPermissions>
<shiro:hasPermission name="user:edit">
	perm += '<a class="editRole" href="javascript:void(0)" title="配置角色">配置角色</a>';
</shiro:hasPermission>
</script>
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
					<input type="hidden" id="search_organId" name="search_organId" value="${organId}"/>
					<%-- <div class="form-group">
						<label for="search_organId">机构</label> 
						<select id="search_organId" name="search_organId" class="form-control">
							<option value="">请选择</option>
							<c:forEach items="${smOrganList}" var="smOrgan">
								<option value="${smOrgan.organId}">${smOrgan.organName}</option>
							</c:forEach>
						</select>
					</div> --%>
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
						<!-- <input type="hidden" id="organId" name="organId"/> -->
						<div class="form-group">
							<label for="loginName" class="col-sm-2 control-label">登录名：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="loginName" name="loginName" placeholder="登录名">
								<div class="help-inline"><font color="red">*</font></div>
							</div>
						</div>
						<!-- 
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码：</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password" name="password" placeholder="密码">
								<div class="help-inline" id="requiredDivPwd"><font color="red">*</font></div>
							</div>
						</div>
						 -->
						<div class="form-group">
							<label for="userName" class="col-sm-2 control-label">姓名：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userName" name="userName" placeholder="姓名">
								<div class="help-inline"><font color="red">*</font></div>
							</div>
						</div>
						<div class="form-group">
							<label for="mobile" class="col-sm-2 control-label">手机号：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="mobile" name="mobile" maxlength="11" placeholder="手机号">
								<div class="help-inline"><font color="red">*</font></div>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">邮箱：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email" name="email" placeholder="邮箱">
								<div class="help-inline"><font color="red">*</font></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">区域：</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-4">
										<label class="sr-only" for="homeProv">省</label> 
										<select id="homeProv" name="homeProv" class="form-control">
											<option value="">请选择</option>
											<c:forEach items="${homeProvList}" var="homeProv">
												<option value="${homeProv.entryId}">${homeProv.entryName}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-4">
										<label class="sr-only" for="homeCity">市</label> 
										<select id="homeCity" name="homeCity" class="form-control">
										</select>
									</div>
									<div class="col-sm-4">
										<label class="sr-only" for="homeCounty">县</label> 
										<select id="homeCounty" name="homeCounty" class="form-control">
										</select>
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="organId">机构：</label>
							<div class="col-sm-10">
								<select id="organId" name="organId" class="form-control">
									<option value="">请选择</option>
									<c:forEach items="${smOrganList}" var="smOrgan">
										<option value="${smOrgan.organId}">${smOrgan.organName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<!-- 
						<div class="form-group">
							<label class="col-sm-2 control-label" for="status">状态：</label>
							<div class="col-sm-10">
								<select id="status" name="status" class="form-control">
									<option value="1">正常</option>
									<option value="0">失效</option>
								</select>
							</div>
						</div>
						 -->
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnSave">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal 角色设置-->
	<div class="modal fade" id="modalRole" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel2">用户角色配置</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="post" action="#">
						<input id="tmpUserId" type="hidden" />
						<c:forEach items="${roleList}" var="role">
						<div class="checkbox">
							<label>
								<input type="checkbox" value="${role.roleId}" /> ${role.roleName}
							</label>
						</div>
						</c:forEach>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnSaveRole">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="treeDivOrgan" style="display:none; position: absolute;z-index:999999;background:white;overflow-y:scroll;">
		<ul id="treeOrgan" class="ztree" style="margin-top:0; width:230px; height: 200px;"></ul>
	</div>

	<script type="text/javascript">
		var validator;
		$(function() {

			var $table = $('#table');
			$table.bootstrapTable({
				url : '${ctx}/sysmgr/pageQueryUser',
				height : getTableHeight(),
				columns : [ {
					field : 'userId',
					title : '编号',
					width : '10%',
					align : 'center'
				}, {
					field : 'mobile',
					title : '手机号',
					width : '10%',
					cellStyle : ellipsis,
					align : 'center'
				}, {
					field : 'loginName',
					title : '登录名',
					width : '10%',
					cellStyle : ellipsis,
					align : 'center'
				}, {
					field : 'userName',
					title : '姓名',
					cellStyle : ellipsis,
					width : '10%',
					align : 'center'
				}, {
					field : 'email',
					title : '邮箱',
					cellStyle : ellipsis,
					width : '10%',
					align : 'center'
				}, {
					field : 'createTime',
					title : '创建时间',
					formatter : Utils.tranDateStr,
					width : '10%',
					align : 'center'
				}/* , {
					field : 'statusName',
					title : '状态',
					width : '10%',
					align : 'center'
				} */, {
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
					loginName: {required:true,maxlength:32},//TODO remote验证已存在
					userName: {required:true,maxlength:32},
					mobile: {required:true,mobile:true},
					email: {required:true,email:true}
				}
			});

			// 新增
			$(".add").click(function() {
				$(".form-save").clearForm();
				
				$("#homeProv").val("");
				$("#homeCity").empty().append("<option value=''>请选择</option>");
				$("#homeCounty").empty().append("<option value=''>请选择</option>");
				
				$('#myModalLabel').html('新增');
				$('#myModal').modal('show');
				$("#requiredDivPwd").show();//密码必填
				validator.resetForm();//清除验证错误的显示
			});

			// 保存
			$("#btnSave").click(function() {
				var userId = $.trim($("#userId").val());
				//if(userId==''){
				//	$("#password").rules("add", { required: true });
					//password: {required:true},
					//$("#email").rules("add", { required: true, email: true });
					//$("#formSave").rules("add", { required: true, email: true });
				//}else{
				//	$("#password").rules("remove", "required");
				//}
				if($("#formSave").valid()){
					var obj = $(".form-save").getFormObject();
					$.ajaxPostJson("${ctx}/sysmgr/saveOrUpdateUser", obj, function(result) {
						$('#table').bootstrapTable("refresh");
						$('#myModal').modal('hide');
						showMessage("操作成功!");
					});
				}
			});
			
			// 保存角色信息
			$("#btnSaveRole").click(function() {
				var userId = $("#tmpUserId").val();
				var roleIds = [];
				$("#modalRole :checkbox:checked").each(function(){
					roleIds.push($(this).val());
				});
				$.ajaxPost("${ctx}/sysmgr/saveUserRole", {userId:userId,roleIds:roleIds}, function(result) {
					$('#modalRole').modal('hide');
					showMessage("操作成功!");
				});
			});

			//查询
			$("#btnSearch").click(function() {
				$table.bootstrapTable("refresh");
			});

			//区域级联下拉
			$("#homeProv").change(function() {
				$("#homeCity").empty().append("<option value=''>请选择</option>");
				$("#homeCounty").empty().append("<option value=''>请选择</option>");
				BizUtils.initSelectHomeCity($(this).val(), "homeCity", null, null);
			});
			$("#homeCity").change(function() {
				BizUtils.initSelectHomeCounty($(this).val(), "homeCounty", null, null);
			});
			
			//机构树初始化
			/* var setting = {
					callback: {
						onClick: onTreeClick
					},
					view: {
						showLine: false
					}
			};
			$.ajaxPostJson("${ctx}/sysmgr/queryOrgan", {}, function(result) {
				$.fn.zTree.init($("#treeOrgan"), setting, result);
				var treeObj = $.fn.zTree.getZTreeObj("treeOrgan");
				treeObj.expandAll(true);
			});
			
			$("#organName").click(function(){
				var organName = $("#organName");
				var organNameOffset = $("#organName").offset();
				$("#treeDivOrgan").css({left:organNameOffset.left + "px", top:organNameOffset.top + organName.outerHeight() + "px"}).slideDown("fast");
				$("body").bind("mousedown", onBodyDown);
				
				var organId = $("#organId").val();
				if($.trim(organId)!=''){
					var zTree = $.fn.zTree.getZTreeObj("treeOrgan");
					var node = zTree.getNodeByParam("id", organId, null);
					if(node){
						zTree.selectNode(node);
					}
				}
			}); */
			
			$(window).resize(function() {
				// 表格
				$table.bootstrapTable('resetView', {
					height : getTableHeight()
				});
				// 机构下拉树
				//var organName = $("#organName");
				//var organNameOffset = $("#organName").offset();
				//$("#treeDivOrgan").css({left:organNameOffset.left + "px", top:organNameOffset.top + organName.outerHeight() + "px"});
			});

		});
		
		// 修改、删除
		function operateFormatter(value, row, index) {
			return perm;
		}

		window.operateEvents = {
			'click .edit' : function(e, value, row, index) {
				validator.resetForm();//清除验证错误的显示
				$('#myModal').modal('show');
				$('#myModalLabel').html('修改');
				$("#requiredDivPwd").hide();//密码非必填
				$.ajaxPostJson("${ctx}/sysmgr/getUserById/" + row.userId, {}, function(result) {
					if (result) {
						$(".form-save").setFormObject(result);
						BizUtils.initSelectHomeCity(result.homeProv, "homeCity", result.homeCity, function(){
							BizUtils.initSelectHomeCounty(result.homeCity, "homeCounty", result.homeCounty);
						});
					}
				});
			},
			'click .editRole' : function(e, value, row, index) {
				$("#tmpUserId").val(value);//设置当前操作的userId
				$("#modalRole :checkbox").removeAttr("checked");
				$('#modalRole').modal('show');
				$.ajaxPostJson("${ctx}/sysmgr/queryUserRole/" + row.userId, {}, function(result) {
					if (result && result.length>0) {
						for(var i=0;i<result.length;i++){
							//$("#modalRole :checkbox[value='"+result[i]+"']").attr("checked",'checked');
							$("#modalRole :checkbox[value='"+result[i]+"']").trigger("click");
						}
					}
				});
			},
			'click .remove' : function(e, value, row, index) {
				$.ajaxPostJson("${ctx}/sysmgr/deleteUser/" + row.userId, {}, function(result) {
					$('#table').bootstrapTable("refresh");
					showMessage("操作成功!");
				});
			}
		};

		//机构树相关操作
		function onTreeClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeOrgan");
			var nodes = zTree.getSelectedNodes();
			if(nodes.length>0){
				$("#organId").val(nodes[0].id);
				$("#organName").val(nodes[0].name);
			}
			hideTree();
		}
		function hideTree() {
			$("#treeDivOrgan").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "organName" || event.target.id == "treeDivOrgan" || $(event.target).parents("#treeDivOrgan").length>0)) {
				hideTree();
			}
		}
		
	</script>
</body>
</html>
