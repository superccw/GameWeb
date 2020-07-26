package com.atguigu.test;

import com.atguigu.dao.BookDao;
import com.atguigu.dao.impl.BookDaoImpl;
import com.atguigu.pojo.Book;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

public class BookDaoImplTest {
    BookDao bookDao=new BookDaoImpl();
    @Test
    public void addBook() {

        bookDao.addBook(new Book(21,"我操你个嘴","ccw",new BigDecimal(999),11000,0,null));
    }

    @Test
    public void deletBookById() {
        bookDao.deletBookById(21);
    }

    @Test
    public void updateBook() {
        for (Book qurybook:bookDao.queryBooks()){
            System.out.println(qurybook);
        }
    }

    @Test
    public void queryBookById() {
    }

    @Test
    public void queryBooks() {
    }

    @Test
    public void queryForPageTotalCount() {
        System.out.println(bookDao.queryForPageTotalCount());
    }

    /*
    页面信息方法实现
     */
    @Test
    public void queryForPageItems() {

    }
}