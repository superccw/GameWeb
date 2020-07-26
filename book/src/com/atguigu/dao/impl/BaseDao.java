package com.atguigu.dao.impl;

import com.atguigu.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import javax.management.Query;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

//抽象函数，不能被实例化
public abstract class BaseDao {
    //导入DButil包,使用包内封装的方法执行sql操作

    //使用DBUtil包
    private QueryRunner queryRunner=new QueryRunner();

    /*
    sql删改查操作方法
    返回-1表示方法没有执行，返回其他表示影响的行数
     */
    public int update(String sql,Object...args){
        Connection connection= JDBCUtils.getConnection();
        try {
           return queryRunner.update(connection,sql,args);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(connection);
        }
        return -1;
    }

    /*
    查询返回一个javabean的sql语句
     */
    public <T> T queryForOne(Class<T> type,String sql,Object...args){
        Connection connection=JDBCUtils.getConnection();
        try {
            return queryRunner.query(connection,sql,new BeanHandler<T>(type),args);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(connection);
        }
        return null;
    }
    /*
       查询返回多个javabean的sql语句
        */
    public <T>List<T> queryForList(Class<T> type,String sql,Object...args){
        Connection connection=JDBCUtils.getConnection();
        try {
            return queryRunner.query(connection,sql,new BeanListHandler<T>(type),args);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(connection);
        }
        return null;
    }

    /*
    返回一行一列的sql语句
     */
    public Object queryForSingleValue(String sql,Object...args){
        Connection con=JDBCUtils.getConnection();
        try {
            return queryRunner.query(con,sql,new ScalarHandler(),args);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con);
        }
        return null;
    }

}
