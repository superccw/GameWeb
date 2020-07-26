package com.ccw.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RequestAPIServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*获取资源路径*/
        System.out.println("URI=>"+req.getRequestURI());
        /*获取请求的同一资源定位符*/
        System.out.println("UPL=>"+req.getRequestURL());
    }
}
