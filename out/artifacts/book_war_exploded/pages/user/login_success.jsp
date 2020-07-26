<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
	<%--静态base.jsp标签--%>
	<%@include file="/pages/commond/head.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
</style>
</head>
<body>
		<div id="header">
				<%--<img class="logo_img" alt="" src="static/img/logo.gif" >--%>
			<%--		静态包含登录成功后的界面--%>
			<%@include file="/pages/commond/login_success_menu.jsp"%>
		</div>
		
		<div id="main">
		
			<h1>欢迎回来 <a href="index.jsp">转到主页</a></h1>
	
		</div>

		<!--页脚-->
		<%@include file="/pages/commond/footer.jsp"%>
</body>
</html>