package com.atguigu.web;

import com.atguigu.pojo.Book;
import com.atguigu.pojo.Page;
import com.atguigu.service.BookService;
import com.atguigu.service.impl.BookSrviceImpl;
import com.atguigu.utils.WebUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BookServlet extends BaseServlet {
   BookService bookService=new BookSrviceImpl();
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo=WebUtil.parseInt(req.getParameter("pageNo"),0);
        pageNo+=1;
        //获取请求参数，并封装为Book对象
        Book book=  WebUtil.copyParamToBean(req.getParameterMap(),new Book());
        //调用BookService.add保存添加信息
        bookService.addBook(book);
        //跳转到列表页面
        //此方法只有一次请求，会产生用户刷新界面重复请求的bug
       /* req.getRequestDispatcher("/manager/bookServlet?action=list").forward(req,resp);*/
        //用重定向两次请求解决此bug
        resp.sendRedirect(req.getContextPath()+"/manager/bookServlet?action=page&pageNo="+pageNo);
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //请求id数据
        int id=WebUtil.parseInt(req.getParameter("id"),0);
        //调用service方法操纵数据库
        bookService.deleteBookById(id);
        //重定向返回列表显示
        resp.sendRedirect(req.getContextPath()+"/manager/bookServlet?action=page&pageNo="+req.getParameter("pageNo"));
    }

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //请求参数封装为Book对象
        Book book=WebUtil.copyParamToBean(req.getParameterMap(),new Book());
        //调用bookservice.update
        bookService.updateBook(book);
        //重定向显示页面
        resp.sendRedirect(req.getContextPath()+"/manager/bookServlet?action=page&pageNo="+req.getParameter("pageNo"));
    }

    //通过编号获取参数
    protected void getbook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求参数的图书编号
        int id=WebUtil.parseInt(req.getParameter("id"),0);
        //调用qurybookbyid查询图书
        Book book=bookService.queryBookById(id);
        //保存在req隐藏域中
        req.setAttribute("book",book);
        //请求转发到book_edit.jsp页面,回显操作
        req.getRequestDispatcher("/pages/manager/book_edit.jsp").forward(req,resp);
    }

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1，通过bookservice查询到全部图书
        List<Book> books=bookService.queryBooks();
        //2，把全部图书放入request隐藏域中
        req.setAttribute("books",books);
        //3，请求转发到/pages/manager/book_manager.jsp页面
        req.getRequestDispatcher("/pages/manager/book_manager.jsp").forward(req,resp);
    }

    //分页处理
    protected void page (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求的pageNo和pageSzie
        int pageNo=WebUtil.parseInt(req.getParameter("pageNo"),1);
        int pageSize=WebUtil.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        //调用service层的page方法
        Page<Book> page=bookService.page(pageNo,pageSize);
        //设置分页路径
        page.setUrl("manager/bookServlet?action=page");
        //保存page对象到re域中
        req.setAttribute("page",page);
        //请求转发到pages/manager/book_manager.jsp页面
        req.getRequestDispatcher("/pages/manager/book_manager.jsp").forward(req,resp);

    }
}
