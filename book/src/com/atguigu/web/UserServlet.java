package com.atguigu.web;

import com.atguigu.pojo.User;
import com.atguigu.service.UserService;
import com.atguigu.service.impl.UserServiceimpl;
import com.atguigu.utils.WebUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class UserServlet extends BaseServlet {

    /*方法封装*/
    private UserService userService=new UserServiceimpl();

    /**
     * 注销登录
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        //销毁session
        req.getSession().invalidate();
        //跳转到或重定向到首页
        resp.sendRedirect(req.getContextPath());
    }
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
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
            //session保存登录成功的信息
            req.getSession().setAttribute("user",loginUser);
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req,resp);
        }
    }

    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        //获取session保存的验证码
        String token= (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        //删除session中的验证码
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        //获取请求参数
        String username= req.getParameter("username");
        String password= req.getParameter("password");
        String email= req.getParameter("email");
        String code= req.getParameter("code");

        User user= (User) WebUtil.copyParamToBean(req.getParameterMap(),new User());
        //验证码确定，先将验证码写死
        if (token!=null&&token.equalsIgnoreCase(code))
        {
            if (userService.existUsername(username)){
                System.out.println("用户名["+username+"]不可用");
                //错误信息回显在req域中
                req.setAttribute("msg","用户名已存在");
                req.setAttribute("username",username);
                req.setAttribute("email",email);
                req.getRequestDispatcher("/pages/user/regist.jsp").forward(req,resp);
            }else{
                userService.registUser(new User(null,username,password,email));
                req.getRequestDispatcher("/pages/user/regist_success.jsp").forward(req,resp);
            }

        }else{
            //错误信息回显在req域中
            req.setAttribute("msg","验证码有误");
            req.setAttribute("username",username);
            req.setAttribute("email",email);
            System.out.println("验证码["+code+"]错误");
            req.getRequestDispatcher("/pages/user/regist.jsp").forward(req,resp);
        }
    }



  /*  @Override*/
    /*protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action=req.getParameter("action");
        *//*优化elseif代码*//*
      *//*  System.out.println(action);
        if ("login".equals(action)){
            login(req, resp);
        }
        else if("regist".equals(action)){
            regist(req, resp);
        }*//*
        try
        {
            Method method=this.getClass().getDeclaredMethod(action,HttpServletRequest.class,HttpServletResponse.class);

            //调用方法
            method.invoke(this,req,resp);
        }catch (Exception e){
            e.printStackTrace();
        }
    }*/
}
