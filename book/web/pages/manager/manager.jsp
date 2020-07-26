<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
	<%--静态base.jsp标签--%>
	<%@include file="/pages/commond/head.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>
	
	<div id="header">
			<%--<img class="logo_img" alt="" src="../../static/img/logo.gif" >--%>
			<span class="wel_word">后台管理系统</span>
		<%--			管理菜单jsp--%>
		<%--<a href="pages/commond/manager_menu.jsp">后台</a>--%>
		<%--调用menu菜单超链接--%>
		<%@include file="/pages/commond/manager_menu.jsp"%>
	</div>
	
	<div id="main">
		<h1>欢迎管理员进入后台管理系统</h1>
	</div>

	<!--页脚-->
	<%@include file="/pages/commond/footer.jsp"%>
</body>
</html>