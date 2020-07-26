<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
	<!--base标签，永远固定相对路径-->
	<%--静态base.jsp标签--%>
	<%@include file="/pages/commond/head.jsp"%>
</head>
<body>
		<div id="login_header">
			<%--<img class="logo_img" alt="" src="static/img/logo.gif" >--%>
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎登录</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>会员</h1>
								<a href="pages/user/regist.jsp">立即注册</a>
							</div>
							<div class="msg_cont">
								<b></b>
								<span class="errorMsg">
									<%--<%=request.getAttribute("msg")==null?"请输入用户名和密码":request.getAttribute("msg")%>
									EL表达式替代上方回显表达式--%>
									${empty requestScope.msg?"请输入密码和用户名":requestScope.msg}
								</span>
							</div>

							<div class="login_box">
								<form action="userServlet" method="post">
									<%--隐藏域设置--%>
									<input type="hidden" name="action" value="login">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username"
										   value="${requestScope.username}"/><%--EL回显表达式--%>
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" />
									<br />
									<br />
									<input type="submit" value="登录" id="sub_btn" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!--页脚-->
		<%@include file="/pages/commond/footer.jsp"%>
</body>
</html>