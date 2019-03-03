<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta name="decorator" content="default" />
<title>修改密码</title>
<script>
	//jquery validate表单验证
	$(function() {

		$("#updateform").validate({
			rules : {
				passwordOld : "required",
				passwordNew : {
					required : true,
					minlength : 6
				},
				passwordNewConfirm : {
					required : true,
					minlength : 6,
					equalTo : "#passwordNew"
				}
			},
			messages : {
				passwordOld : "请输入原始密码",
				passwordNew : {
					required : "请输入密码",
					minlength : "至少为六位"
				},
				passwordNewConfirm : {
					required : "请输入密码",
					minlength : "至少为六位",
					equalTo : "两次密码不一致"
				}
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<br>
		<div id="box">
			<form class="form-save form-horizontal" method="post" action="#" id="updateform" name="updateform">
				<div class="form-group">
					<label for="passwordOld" class="col-md-3 control-label">原始密码：</label>
					<div class="col-sm-9">
						<input type="password" id="passwordOld" name="passwordOld"
							class="form-control " placeholder="原始密码"/>
					</div>
				</div>
				<div class="form-group">
					<label for="passwordNew" class="col-md-3 control-label">新密码：</label>
					<div class="col-md-9">
						<input type="password" id="passwordNew" name="passwordNew"
							class="form-control " placeholder="新密码"/>
					</div>
				</div>
				<div class="form-group">
					<label for="passwordNewConfirm" class="col-md-3 control-label">确认密码：</label>
					<div class="col-md-9">
						<input type="password" id="passwordNewConfirm"
							name="passwordNewConfirm" class="form-control" placeholder="确认密码"/>
					</div>
				</div>
				<div class="form-group">
					<label for="content" class="col-md-3 control-label"></label>
					<div class="col-md-9">
						<button type="button" class="btn btn-primary" id="btnSave">修改</button>
					</div>
				</div>
			</form>
		</div>

	</div>
	<script>
		$(document).ready(function() {
			$("#btnSave").click(function() {
				var passwordOld = $("#passwordOld").val();
				var passwordNew = $("#passwordNew").val();
				if ($("#updateform").valid()) {
					$.ajaxPost("${ctx}/sysmgr/updatePwd", {
						"pwdOldMd5" : passwordOld,
						"pwdNewMd5" : passwordNew
					}, function(result) {	
						showMessage("操作成功!");
						setTimeout(function(){history.back();},1000);
					});
				}

			});
		});
	</script>
</body>
</html>