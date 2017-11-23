/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.liu.po;

/**
 *
 * @author asus
 */
import java.io.Serializable;

public class TypeBean implements Serializable{

    private int id;
    private String typeName;
    private String memo;

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
     * @return the typeName
     */
    public String getTypeName() {
        return typeName;
    }

    /**
     * @param typeName the typeName to set
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName;
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

    
}

