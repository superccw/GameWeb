<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书城首页</title>
<%--静态base.jsp标签--%>
<%@include file="/pages/commond/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			$("button.addToCart").click(function () {
				var bookId=$(this).attr("bookId");
				location.href="${basePath}cartServlet?action=addItem&id="+bookId;
			})
		})
	</script>
</head>
<body>
	
	<div id="header">
			<%--<img class="logo_img" alt="" src="static/img/logo.gif" >--%>
			<span class="wel_word">网上书城</span>
			<div>
				<c:if test="${empty sessionScope.user}">
					<a href="pages/user/login.jsp">登录</a>
					<a href="pages/user/regist.jsp">注册</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${not empty sessionScope.user}">
					<span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临书城</span>
					<a href="pages/order/order.jsp">我的订单</a>
					<a href="userServlet?action=logout">注销</a>&nbsp;
				</c:if>
				<a href="pages/cart/cart.jsp">购物车</a>
				<a href="pages/manager/manager.jsp">后台管理</a>
			</div>
	</div>
	<div id="main">
		<div id="book">
			<div class="book_cond">
				<form action="client/bookServlet" method="get">
					<input type="hidden" name="action" value="pageByPrice">
					价格：<input id="min" type="text" name="min" value="${param.min}"> 元 -
						<input id="max" type="text" name="max" value="${param.max}"> 元
						<input type="submit" value="查询" />
				</form>
			</div>
			<div style="text-align: center">
				<c:if test="${empty sessionScope.cart.items}">

				</c:if>
				<c:if test="${not empty sessionScope.cart.items}">
					<span>您的购物车中有${sessionScope.cart.totalCount}件商品</span>
					<div>
						您刚刚将<span style="color: rgba(170,19,31,0.7)">${sessionScope.lastName}</span>加入到了购物车中
					</div>
				</c:if>

			</div>

			<c:forEach items="${requestScope.page.items}" var="book">
				<div class="b_list">
					<div class="img_div">
						<img class="book_img" alt="" src="${book.imgpath}" />
					</div>
					<div class="book_info">
						<div class="book_name">
							<span class="sp1">书名:</span>
							<span class="sp2">${book.name}</span>
						</div>
						<div class="book_author">
							<span class="sp1">作者:</span>
							<span class="sp2">${book.author}</span>
						</div>
						<div class="book_price">
							<span class="sp1">价格:</span>
							<span class="sp2">￥${book.price}</span>
						</div>
						<div class="book_sales">
							<span class="sp1">销量:</span>
							<span class="sp2">${book.sales}</span>
						</div>
						<div class="book_amount">
							<span class="sp1">库存:</span>
							<span class="sp2">${book.stock}</span>
						</div>
						<div class="book_add">
							<button bookId="${book.id}" class="addToCart">加入购物车</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<%--静态包含分页条--%>
		<%@include file="/pages/commond/page_nav.jsp"%>
		<%--分页条
		<div id="page_nav">
			非首页时显示的选项
			<c:if test="${requestScope.page.pageNo>1}">
				<a href="${requestScope.page.url}&pageNo=1">首页</a>
				<a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}">上一页</a>
			</c:if>
			页码输出开始
			<c:choose>
				总页数小于5，显示从1-总页数
				<c:when test="${requestScope.page.pageTotal<=5}">
					<c:set var="begin" value="1"/>
					<c:set var="end" value="${requestScope.page.pageTotal}"/>
					<c:forEach begin="1" end="${requestScope.page.pageTotal}" var="i">
                        <c:if test="${i==requestScope.page.pageNo}">
                                    【${i}】
                        </c:if>
                        <c:if test="${i!=requestScope.page.pageNo}">
                            <a href="client/bookServlet?action=page&pageNo=${i}">
                                ${i}
                            </a>
                        </c:if>
                    </c:forEach>
				</c:when>

				总页数大于5的情况
				<c:when test="${requestScope.page.pageTotal>5}">
					<c:choose>
						1，初始页码为前三个数，显示1-5
						<c:when test="${requestScope.page.pageNo<=3}">
							<c:set var="begin" value="1"/>
							<c:set var="end" value="5"/>
							<c:forEach begin="1" end="5" var="i">
                                <c:if test="${i==requestScope.page.pageNo}">
                                    【${i}】
                                </c:if>
                                <c:if test="${i!=requestScope.page.pageNo}">
                                    <a href="client/bookServlet?action=page&pageNo=${i}">
                                            ${i}
                                    </a>
                                </c:if>
                            </c:forEach>
						</c:when>
						2，当前页码为最后三个页码，显示总页码-4-总页码
						<c:when test="${requestScope.page.pageNo>requestScope.page.pageTotal-3}">
							<c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
							<c:set var="end" value="${requestScope.page.pageTotal}"/>
							<c:forEach begin="${requestScope.page.pageTotal-4}" end="${requestScope.page.pageTotal}" var="i">
                                <c:if test="${i==requestScope.page.pageNo}">
                                    【${i}】
                                </c:if>
                                <c:if test="${i!=requestScope.page.pageNo}">
                                    <a href="client/bookServlet?action=page&pageNo=${i}">
                                            ${i}
                                    </a>
                                </c:if>
                            </c:forEach>
						</c:when>
						3,当前页码为中间的页码时，显示当前页码-2-当前页码+2
						<c:otherwise>
							<c:set var="begin" value="${requestScope.page.pageNo-2}"/>
							<c:set var="end" value="${requestScope.page.pageNo+2}"/>
							<c:forEach begin="${requestScope.page.pageNo-2}" end="${requestScope.page.pageNo+2}" var="i">
                                <c:if test="${i==requestScope.page.pageNo}">
                                    【${i}】
                                </c:if>
                                <c:if test="${i!=requestScope.page.pageNo}">
                                    <a href="client/bookServlet?action=page&pageNo=${i}">
                                            ${i}
                                    </a>
                                </c:if>
                            </c:forEach>
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
			页码输出结束



			<c:if test="${requestScope.page.pageNo<requestScope.page.pageTotal}">
				<a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}">下一页</a>
				<a href="${requestScope.page.url}&pageNo=${requestScope.page.pageTotal}">末页</a>
			</c:if>

			共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录
			到第<input value="${param.pageNo}" name="pn" id="pn_input">页
			<input id="searchPageBtn" type="button" value="确定">
			>
			指定页面跳转
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
		</div>
		分页条--%>
	</div>

	<!--页脚-->
	<%@include file="/pages/commond/footer.jsp"%>
</body>
</html>