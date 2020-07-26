<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
	<!--base标签，永远固定相对路径-->
	<%--静态base.jsp标签--%>
	<%@include file="/pages/commond/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			//验证码图片绑定单击事件
			//src获取图片路径可读，可写
			//this为正在响应的dom对象
			$("#code_img").click(function () {
				this.src="${basePath}kaptcha.jpg?d="+new Date();
			})

			$("#sub_btn").click(function () {
				//用户名合法性
				var usernameText=$("#username").val();
				var usernamePat=/^\w{5,12}$/;
				if (!usernamePat.test(usernameText)){
					$(".errorMsg").text("用户名不合法！");
					return false;
				}
				//密码合法性
				var passwordText=$("#password").val();
				var passwordPat=/^\w{5,12}$/;
				if (!usernamePat.test(usernameText)){
					$(".errorMsg").text("密码格式不合法！");
					return false;
				}
				//确认密码
				var repwdText=$("#repwd").val();
				if (repwdText!=passwordText){
					$(".errorMsg").text("确认密码不对！");
					return false;
				}
				//邮箱格式
				var emailText=$("#email").val();
				var emailPat=/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
				if (!emailPat.test(emailText)){
					$(".errorMsg").text("邮箱格式不对！");
					return false;
				}
				$(".errorMsg").text("");
			})
		})
	</script>


<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}
</style>
</head>



<body>
		<div id="login_header">
			<%--<img class="logo_img" alt="" src="static/img/logo.gif" >--%>
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册会员</h1>
								<%--<span class="errorMsg">
									<%=request.getAttribute("msg")%>
								</span>--%>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="regist">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off"
										   tabindex="1" name="username" id="username" <%--value="<%=request.getAttribute("username")%>"
                                    EL表达式替换--%> value="${requestScope.username}"/>
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off"
										   tabindex="1" name="password" id="password" />
									<br />
									<br />
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码" autocomplete="off"
										   tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>电子邮件：</label>
									<input class="itxt" type="text" placeholder="请输入邮箱地址" autocomplete="off"
										   tabindex="1" name="email" id="email" <%--value="<%=request.getAttribute("email")%>"--%>
									 value="${requestScope.email}"/>
									<br />
									<br />
									<label>验证码：</label>
									<input class="itxt" type="text" name="code" style="width: 90px;" id="code"/>
									<img alt="" id="code_img" src="kaptcha.jpg" style="float: right; margin-right: 60px;width: 100px;height: 40px;">
									<br />
									<br />
									<input type="submit" value="注册" id="sub_btn" />
									
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