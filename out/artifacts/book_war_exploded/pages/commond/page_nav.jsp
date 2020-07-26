<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/7/25
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--分页条--%>
<div id="page_nav">
    <%--非首页时显示的选项--%>
    <c:if test="${requestScope.page.pageNo>1}">
        <a href="${requestScope.page.url}&pageNo=1">首页</a>
        <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}">上一页</a>
    </c:if>
    <%--页码输出开始--%>
    <c:choose>
        <%--总页数小于5，显示从1-总页数--%>
        <c:when test="${requestScope.page.pageTotal<=5}">
            <c:set var="begin" value="1"/>
            <c:set var="end" value="${requestScope.page.pageTotal}"/>
        </c:when>

        <%--总页数大于5的情况--%>
        <c:when test="${requestScope.page.pageTotal>5}">
            <c:choose>
                <%--1，初始页码为前三个数，显示1-5--%>
                <c:when test="${requestScope.page.pageNo<=3}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="5"/>
                </c:when>
                <%--2，当前页码为最后三个页码，显示总页码-4-总页码--%>
                <c:when test="${requestScope.page.pageNo>requestScope.page.pageTotal-3}">
                    <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                    <c:set var="end" value="${requestScope.page.pageTotal}"/>
                </c:when>
                <%--3,当前页码为中间的页码时，显示当前页码-2-当前页码+2--%>
                <c:otherwise>
                    <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                    <c:set var="end" value="${requestScope.page.pageNo+2}"/>
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
    <%--页码输出结束--%>



    <c:if test="${requestScope.page.pageNo<requestScope.page.pageTotal}">
        <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}">下一页</a>
        <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageTotal}">末页</a>
    </c:if>

    共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录
    到第<input value="${param.pageNo}" name="pn" id="pn_input">页
    <input id="searchPageBtn" type="button" value="确定">
    >
    <%--指定页面跳转--%>
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
<%--分页条--%>
