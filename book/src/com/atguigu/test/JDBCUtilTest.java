package com.atguigu.test;

import com.atguigu.utils.JDBCUtils;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;

public class JDBCUtilTest {
    @Test
    public void testjdbc(){
        for (int i=0;i<100;i++){
           Connection con=JDBCUtils.getConnection();
            System.out.println(con);
            //连接要关闭，不然只能最多获得file文件中设置的文件数
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
