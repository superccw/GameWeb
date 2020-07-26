<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>
	<%--静态base.jsp标签--%>
	<%@include file="/pages/commond/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			$("a.deleteClass").click(function () {
				//此函数中有this对象，是当前正在响应的dom事件
				/*
				confirm是确认提示框
				 */
				return  confirm("你确定删除【"+$(this).parent().parent().find("td:first").text()+"】吗?");
				//return false;//阻止元素默认行为==不提交请求
			})
		})
	</script>
</head>
<body>
	
	<div id="header">
			<%--<img class="logo_img" alt="" src="../../static/img/logo.gif" >--%>
			<span class="wel_word">图书管理系统</span>
		<%--			管理菜单jsp--%>
		<%@include file="/pages/commond/manager_menu.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>名称</td>
				<td>价格</td>
				<td>作者</td>
				<td>销量</td>
				<td>库存</td>
				<td colspan="2">操作</td>
			</tr>		

			<%--req域取值--%>
			<c:forEach items="${requestScope.page.items}" var="book">
				<tr>
					<td>${book.name}</td>
					<td>${book.price}</td>
					<td>${book.author}</td>
					<td>${book.sales}</td>
					<td>${book.stock}</td>
					<td><a href="manager/bookServlet?action=getbook&id=${book.id}&pageNo=${requestScope.page.pageNo}">修改</a></td>
					<td><a class="deleteClass" href="manager/bookServlet?action=delete&id=${book.id}&pageNo=${requestScope.page.pageNo}">删除</a></td>
				</tr>
			</c:forEach>



			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="pages/manager/book_edit.jsp?pageNo=${requestScope.page.pageTotal}">添加图书</a></td>
			</tr>	
		</table>
		<%@include file="/pages/commond/page_nav.jsp"%>
		<%--分页开始--%>
		<%--<div id="page_nav">
			&lt;%&ndash;非首页时显示的选项&ndash;%&gt;
			<c:if test="${requestScope.page.pageNo>1}">
				<a href="${requestScope.page.url}&pageNo=1">首页</a>
				<a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}">上一页</a>
			</c:if>
			    &lt;%&ndash;页码输出开始&ndash;%&gt;
				<c:choose>
					&lt;%&ndash;总页数小于5，显示从1-总页数&ndash;%&gt;
					<c:when test="${requestScope.page.pageTotal<=5}">
						<c:set var="begin" value="1"/>
						<c:set var="end" value="${requestScope.page.pageTotal}"/>
						&lt;%&ndash;<c:forEach begin="1" end="${requestScope.page.pageTotal}" var="i">
							<c:if test="${i==requestScope.page.pageNo}">
										【${i}】
							</c:if>
							<c:if test="${i!=requestScope.page.pageNo}">
								<a href="manager/bookServlet?action=page&pageNo=${i}">
									${i}
								</a>
							</c:if>
						</c:forEach>&ndash;%&gt;
					</c:when>

					&lt;%&ndash;总页数大于5的情况&ndash;%&gt;
					<c:when test="${requestScope.page.pageTotal>5}">
						<c:choose>
							&lt;%&ndash;1，初始页码为前三个数，显示1-5&ndash;%&gt;
							<c:when test="${requestScope.page.pageNo<=3}">
								<c:set var="begin" value="1"/>
								<c:set var="end" value="5"/>
								&lt;%&ndash;<c:forEach begin="1" end="5" var="i">
									<c:if test="${i==requestScope.page.pageNo}">
										【${i}】
									</c:if>
									<c:if test="${i!=requestScope.page.pageNo}">
										<a href="manager/bookServlet?action=page&pageNo=${i}">
												${i}
										</a>
									</c:if>
								</c:forEach>&ndash;%&gt;
							</c:when>
							&lt;%&ndash;2，当前页码为最后三个页码，显示总页码-4-总页码&ndash;%&gt;
							<c:when test="${requestScope.page.pageNo>requestScope.page.pageTotal-3}">
								<c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
								<c:set var="end" value="${requestScope.page.pageTotal}"/>
								&lt;%&ndash;<c:forEach begin="${requestScope.page.pageTotal-4}" end="${requestScope.page.pageTotal}" var="i">
									<c:if test="${i==requestScope.page.pageNo}">
										【${i}】
									</c:if>
									<c:if test="${i!=requestScope.page.pageNo}">
										<a href="manager/bookServlet?action=page&pageNo=${i}">
												${i}
										</a>
									</c:if>
								</c:forEach>&ndash;%&gt;
							</c:when>
							&lt;%&ndash;3,当前页码为中间的页码时，显示当前页码-2-当前页码+2&ndash;%&gt;
							<c:otherwise>
								<c:set var="begin" value="${requestScope.page.pageNo-2}"/>
								<c:set var="end" value="${requestScope.page.pageNo+2}"/>
								&lt;%&ndash;<c:forEach begin="${requestScope.page.pageNo-2}" end="${requestScope.page.pageNo+2}" var="i">
									<c:if test="${i==requestScope.page.pageNo}">
										【${i}】
									</c:if>
									<c:if test="${i!=requestScope.page.pageNo}">
										<a href="manager/bookServlet?action=page&pageNo=${i}">
												${i}
										</a>
									</c:if>
								</c:forEach>&ndash;%&gt;
							</c:otherwise>
						</c:choose>
					</c:when>
				</c:choose>

				<c:forEach begin="${begin}" end="${end}" var="i">
					<c:if test="${i==requestScope.page.pageNo}">
						【${i}】
					</c:if>
					<c:if test="${i!=requestScope.page.pageNo}">
						<a href="${requestScope.page.url}&pageNo=${i}">
								${i}
						</a>
					</c:if>
				</c:forEach>
				&lt;%&ndash;页码输出结束&ndash;%&gt;



				<c:if test="${requestScope.page.pageNo<requestScope.page.pageTotal}">
					<a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}">下一页</a>
					<a href="${requestScope.page.url}&pageNo=${requestScope.page.pageTotal}">末页</a>
				</c:if>

			共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录
			到第<input value="${param.pageNo}" name="pn" id="pn_input">页
			<input id="searchPageBtn" type="button" value="确定">
>
			&lt;%&ndash;指定页面跳转&ndash;%&gt;
			<script type="text/javascript">
				$(function () {
					//跳到指定页码
					$("#searchPageBtn").click(function () {
						var pageNo=$("#pn_input").val();
						//js函数方法
						location.href="${pageScope.basePath}${requestScope.page.url}&pageNo="+pageNo;
					})
				})
			</script>
		</div>--%>
		<%--分页结束--%>
	</div>

	<!--页脚-->
	<%@include file="/pages/commond/footer.jsp"%>
</body>
</html>