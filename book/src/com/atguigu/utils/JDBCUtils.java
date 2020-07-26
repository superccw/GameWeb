package com.atguigu.utils;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.swing.*;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtils {
    private static DruidDataSource dataSource;

    static {

        try {
            Properties properties=new Properties();
            //读取jdbc.properties配置文件
            InputStream inputStream=JDBCUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            //从数据流中加载数据
            properties.load(inputStream);
            //创建数据库连接池
            dataSource= (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 获取连接池中的连接
     * @return
     */
    public static Connection getConnection(){
        Connection con=null;
        try {
            con=dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    /**
     * 关闭连接
     * @param con
     */
    public static  void close(Connection con){
        if (con!=null){
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
