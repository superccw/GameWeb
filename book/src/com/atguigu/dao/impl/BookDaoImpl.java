package com.atguigu.dao.impl;

import com.atguigu.dao.BookDao;
import com.atguigu.pojo.Book;

import java.util.List;

public class BookDaoImpl extends BaseDao implements BookDao {
    @Override
    public int addBook(Book book) {
        String sql="insert into t_book(`name`,`author`,`price`,`sales`,`stock`,`img_path`)values(?,?,?,?,?,?)";
        return update(sql,book.getName(),book.getAuthor(),book.getPrice(),book.getSales(),book.getStock(),book.getImgpath());
    }

    @Override
    public int deletBookById(Integer id) {
        String sql="delete from t_book where id=?";
        return update(sql,id);
    }

    @Override
    public int updateBook(Book book) {
        String sql="update t_book set `name`=?,`author`=?,`price`=?,`sales`=?,`stock`=?,`img_path`=? where id=?";
        return update(sql,book.getName(),book.getAuthor(),book.getPrice(),book.getSales(),book.getStock(),book.getImgpath(),book.getId());
    }

    @Override
    public Book queryBookById(Integer id) {
        String sql="select `id`,`name`,`author`,`price`,`sales`,`stock`,`img_path` imgpath from t_book where id=?";
        return queryForOne(Book.class,sql,id);
    }

    @Override
    public List<Book> queryBooks() {
        String sql="select `id`,`name`,`author`,`price`,`sales`,`stock`,`img_path` imgpath from t_book";
        return queryForList(Book.class,sql);
    }

    /*
    页面方法的实现
     */
    @Override
    public Integer queryForPageTotalCount() {
        String sql="select count(*) from t_book";
        //将一行的信息转化为number后为个数
        Number count= (Number) queryForSingleValue(sql);
        //将number转化为int类型
        return count.intValue();
    }

    /*
    页面信息方法实现
     */
    @Override
    public List<Book> queryForPageItems(int begin, int pageSize) {
        String sql="select `id`,`name`,`author`,`price`,`sales`,`stock`,`img_path` imgpath from t_book limit ?,?";
        return queryForList(Book.class,sql,begin,pageSize);
    }




    @Override
    public List<Book> queryForPageItemsByPrice(int begin, int pageSize, int min, int max) {
        String sql="select `id`,`name`,`author`,`price`,`sales`,`stock`,`img_path` imgpath" +
                " from  t_book where price between ? and ?  limit ?,?";
        return queryForList(Book.class,sql,min,max,begin,pageSize);
    }

    @Override
    public Integer queryForPageTotalCountByPrice(int min, int max) {
        String sql="select count(*) from t_book where price between ? and ?";
        Number count= (Number) queryForSingleValue(sql,min,max);
        return count.intValue();
    }
}
