/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.liu.po;

import java.io.Serializable;

/**
 *
 * @author asus
 */
public class BookBean implements Serializable{

    private int id;
    private String bookName;
    private String bookType;
    private String memo;
    private String money;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the bookName
     */
    public String getBookName() {
        return bookName;
    }

    /**
     * @param bookName the bookName to set
     */
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    /**
     * @return the bookType
     */
    public String getBookType() {
        return bookType;
    }

    /**
     * @param bookType the bookType to set
     */
    public void setBookType(String bookType) {
        this.bookType = bookType;
    }

    /**
     * @return the memo
     */
    public String getMemo() {
        return memo;
    }

    /**
     * @param memo the memo to set
     */
    public void setMemo(String memo) {
        this.memo = memo;
    }

    /**
     * @return the money
     */
    public String getMoney() {
        return money;
    }

    /**
     * @param money the money to set
     */
    public void setMoney(String money) {
        this.money = money;
    }
}

