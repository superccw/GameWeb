package com.atguigu.dao;

import com.atguigu.pojo.User;

public interface UserDao {

    /*
    根据名字查询用户信息
    返回null则不存在用户
     */
    public User queryUserByUsername(String name);

    /*
    根据名字和密码查询信息
     */
    public User queryUserBynameandpassword(String name,String password);

    /*
    保存用户信息
     */
    public int saveUser(User user);


}
