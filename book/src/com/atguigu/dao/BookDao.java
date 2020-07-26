package com.atguigu.dao;

import com.atguigu.pojo.Book;

import java.util.List;

//功能实现方法
public interface BookDao {
    public int addBook(Book book);

    public int deletBookById(Integer id);

    public int updateBook(Book book);

    public Book queryBookById(Integer id);

    public List<Book> queryBooks();

    //获取总页数方法
    public Integer queryForPageTotalCount();
    //获取指定页数信息
    public List<Book> queryForPageItems(int begin,int pageSize);

    //价格区间计算
    List<Book> queryForPageItemsByPrice(int begin, int pageSize, int min, int max);

    Integer queryForPageTotalCountByPrice(int min, int max);



}
