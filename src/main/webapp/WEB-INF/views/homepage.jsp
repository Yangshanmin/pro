<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>首页</title>
<style>
#logo{
	/*margin:20% auto;
	 width:162px;
	height:148px; 
	background:url(${ctx}/static/images/logo.png) no-repeat;*/
}
body{overflow:hidden;}
</style>
</head>
<body>

	<div class="container-fluid">
		<br>
		<div id="logo" />欢迎！
	</div>

	<script type="text/javascript">
	</script>
</body>
</html>
