<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>用户管理</title>
<script src="${ctx}/static/jquery-ztree/3.5.12/js/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-ztree/3.5.12/js/jquery.ztree.excheck-3.5.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-plugins/jquery-form-utils.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-plugins/jquery.validate.extend.js" type="text/javascript"></script>

</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">绑定系统账户</h4>
				</div>
				<div class="modal-body">
					<form class="form-save form-horizontal" method="post" action="#">
						<input type="hidden" id="userId" />
						<div class="form-group">
							<label for="tel" class="col-sm-3 control-label">手机号：</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="tel" placeholder="请输入手机号">
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn btn-primary" id="getCode">免费获取验证码</button>
							</div>
						</div>
						<div class="form-group">
							<label for="verifyCode" class="col-sm-3 control-label">短信验证码：</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="verifyCode" placeholder="请输入短信验证码">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="btnSave">绑定</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
			eval('var societyUserInfo = ${societyUserInfo};');
			
			if(societyUserInfo == null){
				showMessage('获取第三方用户信息失败');
			}else{
				$(".form-save").clearForm();
				$('#myModal').modal('show');
				$('#myModalLabel').html('绑定系统账户');
			}

			// 保存
			$("#btnSave").click(function() {
				var obj = $(".form-save").getFormObject();
				$.post("${ctx}/societyUser/bindSocietyUser", {tel:obj.tel,verifyCode:obj.verifyCode,openId:societyUserInfo.openId,platformType:societyUserInfo.platformType,nickName:societyUserInfo.nickname,avatarUrl:societyUserInfo.avatarUrl,srcType:1} , function(result) {
					var obj =  eval('(' + result + ')');
					if(obj.returnCode == 0){
						location.href='${ctx}/login';
					}else{
						alert(obj.returnMsg);
					}
				});
			});
			
			//获取验证码
			$("#getCode").click(function(){
				var $this = this;
				var obj = $(".form-save").getFormObject();
				$.post("${ctx}/common/getVerifyCode/0/"+obj.tel, {} , function(result) {
					var obj =  eval('(' + result + ')');
					if(obj.returnCode == 0){
						djs.init($this);
						$("#tel").append("<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>校验码已发送至你的手机，请查收");
					}else{
						alert(obj.returnMsg);
					}
				});
			});
			
			//表单验证
			$('#cerform').validate({  
		        rules: {  
		            tel: {  
		                required: true,  
		                minlength: 7,  
		                maxlength: 13,  
		                isTell: true,  
		                isMobile: "#tel" 
		            },  
		            verifyCode: {  
		                required: true,
		                isNum: true  
		            }
		        },  
		        messages: {  
		            tel: {  
		                required: "电话不能为空！",  
		                minlength: "最少7个数字！",  
		                maxlength: "最长13个数字！",  
		                isTell: "电话格式不正确！"  
		            },  
		            verifyCode: {  
		                required: "请输入验证码",
		                 isNum: "请输入数字！"
		            }
		        },  
		        errorPlacement: function (error, element) {  
		            error.appendTo(element.parent());  
		        },  
		        submitHandler: function (form) {  
		            form.submit();  
		        },  
		        errorClass: "error",  
		        focusCleanup: true, //被验证的元素获得焦点时移除错误信息  
		        success: function (label) {  
		            label.html("<span style=\"color:green\">填写正确！</span>").addClass("success");  
		        }  
			});
		});
	</script>
	<script type="text/javascript">
	    var djs = {
	       node:null,
	       count:60,
	       start:function(){
	          if(this.count > 0){
	             this.node.innerHTML = this.count-- +"秒后可重新获取";
	             var _this = this;
	             setTimeout(function(){
	                 _this.start();
	             },1000);
	          }else{
	             this.node.removeAttribute("disabled");
	             this.node.innerHTML = "免费获取验证码";
	             this.count = 60;
	          }
	       },
	       //初始化
	       init:function(node){
	          this.node = node;
	          this.node.setAttribute("disabled",true);
	          this.start();
	       }
	    };
	</script>
</body>
</html>
