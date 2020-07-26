package com.atguigu.web;

import com.atguigu.pojo.User;
import com.atguigu.service.UserService;
import com.atguigu.service.impl.UserServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private UserService userService=new UserServiceimpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username= req.getParameter("username");
        String password= req.getParameter("password");
        //调用loginService.login登录数据库
        User loginUser=userService.login(new User(null,username,password,null));
        if(loginUser==null){
            //回显错误信息,存储在req域中
            req.setAttribute("msg","用户或密码错误！");
            req.setAttribute("username",username);
            //跳回登录界面
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
        }else
        {
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req,resp);
        }
    }
}
