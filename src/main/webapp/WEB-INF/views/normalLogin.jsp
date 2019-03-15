<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
<head>
	<title>后台</title>
	<link href="${ctx}/static/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/common/Utils.js" type="text/javascript"></script>
	<link href="//at.alicdn.com/t/font_776092_cenbu47fbg6.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/css/login.css" type="text/css" rel="stylesheet" />
</head>

<body>
<div id="messageDiv" style="z-index:9999; display:none;position:fixed;top:70%;left:45%;transform: translate(-40%, -40%);background-color:#000;color:#fff;border-radius:4px;padding:10px;filter:alpha(Opacity=60);-moz-opacity:0.6;opacity: 0.6;">
	<span>提示信息</span>
</div>
	<div class="container text-center">
		<div id="loginbox">
			<form id="loginForm" autocomplete="off" class="form-vertical text-center form-save" action="${ctx}/normalLogin1" method="post">
				<h3>用户登录</h3>
				<div class="input-group">
					<i class="iconfont icon-yonghu"></i>
					<input type="text" id="username" name="mobile" class="form-control input-medium required" placeholder="手机号">
				</div>
				<div class="input-group">
					<i class="iconfont icon-mima"></i>
					<input type="password" id="password" name="password" class="form-control input-medium required" placeholder="密码">
				</div>

				
				<div class="form-actions form-line-split">
					<span class="pull-center">
						<input type="button" class="btn btn-primary" style="width: 96px !important;margin-right: 25px !important;"value="登 录" id="btnLogin" />
					</span>
					<span class="pull-center">
						<input type="reset" class="btn btn-default" style="width: 96px !important;" id="btnRecover" value="忘记密码"  />
					</span>
				</div>
				
			</form>

			<!-- ======忘记密码div====== -->
			<form id="recoverForm" class="form-vertical" action="${ctx}/resetPwd" method="post">
				<h3>找回密码</h3>
				<div class="input-group">
					<i class="iconfont icon-dianhua"></i>
					<input type="text" id="email" name="email" class="form-control" placeholder="邮箱" maxlength="32"/>
				</div>
				<div class="input-group">
					<i class="iconfont icon-xinfeng"></i>
					<input type="text" id="code" name="code" class="form-control" placeholder="短信验证码" />
				</div>
				<div class="input-group">
					<i class="iconfont icon-mima"></i>
					<input type="password" id="newpassword" name="newpassword" class="form-control input-medium required" placeholder="新密码">
				</div>
				<div class="input-group" style="display:inline-block;width:300px;">
					<input type="button" id="btnGetCode" class="btn btn-link" style="float:left;display:inline-block;" value="获取验证码" />
					<div id="messageBox2" class="input-group alert alert-danger input-medium controls hide" style="margin-left:5px;width:150px !important;display:inline-block;">
						<!-- <button class="close" data-dismiss="alert">×</button> -->
						<label id="loginError2" class="error"></label>
					</div>
				</div>
				<div class="form-line-split">
					<span class="pull-center">
						<a href="javascript:void(0);" class="flip-link" id="btnReturnLogin">
							<input type="button" class="btn btn-default" style="width: 96px !important;margin-right: 25px !important;" value="返回"/></a>
					</span>
					<span class="pull-center">
						<input type="button" class="btn btn-primary" id="btnReset" style="width: 96px !important;" value="确定" />
					</span>
				</div>
			</form>
		
		</div>
	</div>
<div>

	<a href="${ctx}/login">联盟管理员登陆</a>
	<a href="${ctx}/teamLogin" style="float:right; margin-right: 50px">球队管理员登陆</a>

</div>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-validation/jquery.validate.extend.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-plugins/jquery-md5.js" type="text/javascript"></script>

	<script>
		$(document).ready(function() {
			var loginForm = $('#loginForm');
			var recoverForm = $('#recoverForm');
			loginForm.validate({
					rules: {
						username: {required:true},
						password: {required:true}
					},
					messages: {
						username: {required: "请填写用户名"},
						password: {required: "请填写密码"},
						validateCode: {required: "请填写验证码"}
					},
					showErrors:function(errorMap,errorList) {
						if(errorList && errorList.length>0){
							$.each(errorList, function(i,v){
								$("#loginError").empty().html(v.message);
								$(v.element).focus();
								return false;
							});
							$("#messageBox").removeClass('hide');
						}
					}
			});

			$("#normalLogin1").attr("action", "normalUser")

			$("#btnLogin").click(function(){
				if(!loginForm.valid()){
					return;
				}
				$("#password").val($.md5($("#password").val()));
				loginForm.submit();
			});


			var speed = 400;
			$('#btnRecover').click(function(){
				loginForm.fadeTo(speed,0.01).css('z-index','100');
				recoverForm.fadeTo(speed,1).css('z-index','200');
			});
			$('#btnReturnLogin').click(function(){
				recoverForm.fadeTo(speed,0.01).css('z-index','100');
				loginForm.fadeTo(speed,1).css('z-index','200');
			});
			
			//回车键提交
			document.onkeydown = function(evt){
		    var evt = window.event?window.event:evt;
		     if (evt.keyCode==13) {
		    		if(loginForm.css("zIndex")==200){
			           document.forms["loginForm"].submit();
		    		}else{
		    			$("#btnReset").click();
		    		}
		     }
		   }

		   $("#btnGetCode").click(function () {
		   	var email = $.trim($("#email").val());
		   	console.log(email)
			   if (email != '') {
			   	$.ajax({
					url: "${ctx}/sendCode",
					methed: "post",
					data: {
						email: email
					},
					dataType: "json",
					success: function (res) {
						showMessage("验证码已发送!");
						console.log(res)
					}
				})
			   } else {
				   console.log("邮箱不能为空")
				   showMessage("邮箱不能为空！");
			   }
		   })

			
			$("#btnReset").click(function() {
				var email = $.trim($("#email").val());
				var code = $.trim($("#code").val());
				var newpassword = $.trim($("#newpassword").val());
				if ($("#recoverForm").valid()) {
						$.ajax({
							url: "${ctx}/modify",
							methed: "post",
							data: {
								email : email,
								code : code,
								newpassword : $.md5(newpassword)
							},
							success: function (res) {
								showMessage(res);
								$('#btnReturnLogin').click();
							}
						})
					}
			})

			/*效果*/
			// $('#loginForm').mouseenter(function () {
			// 	$('#loginbox').css('opacity','1')
			// })
			//
			// $('#loginForm').mouseleave(function () {
			// 	$('#loginbox').css('opacity','0.3')
			// })
			//
			// $('#recoverForm').mouseenter(function () {
			// 	$('#loginbox').css('opacity','1')
			// })
			//
			// $('#recoverForm').mouseleave(function () {
			// 	$('#loginbox').css('opacity','0.3')
			// })

		})

	</script>

</body>
</html>