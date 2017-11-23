/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.liu.dao;

import com.liu.po.BookBean;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author asus
 */
public class BookDAO {
     // 写
    public void writeBook(Map<Integer,BookBean >bookMap){
     //
        FileOutputStream fos = null;
        ObjectOutputStream oos = null;
        try {
            fos = new FileOutputStream("F:\\缓存区\\book.txt");
            oos = new ObjectOutputStream(fos);
            oos.writeObject(bookMap);
            //清空缓存区
            oos.flush();
        }
        catch (FileNotFoundException ex) {
                Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        //异常级别高的在后边
        catch (IOException ex) {
                Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try{
                //先开后闭
                 oos.close();
                 fos.close();
            }catch(IOException ex){
                Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE,null,ex);
            }
        }
    }

    //读
    public Map<Integer,BookBean>readBook(){
        FileInputStream fis = null;
        ObjectInputStream ois = null;
        Map<Integer, BookBean> map = null;
        try {
            fis = new FileInputStream("F:\\缓存区\\book.txt");
            ois = new ObjectInputStream(fis);
            map = (Map<Integer, BookBean>) ois.readObject();//出现异常进入catch
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            //Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
            //ex.printStackTrace();
            map=new HashMap<Integer,BookBean>();//出现异常时，进行创建map
        } finally{
            try {
                if(ois!=null){
                    ois.close();
                }
                if(fis!=null){
                     fis.close();
                }

            } catch (IOException ex) {
                Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return map;
    }
}
