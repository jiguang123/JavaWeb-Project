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
     // д
    public void writeBook(Map<Integer,BookBean >bookMap){
     //
        FileOutputStream fos = null;
        ObjectOutputStream oos = null;
        try {
            fos = new FileOutputStream("F:\\������\\book.txt");
            oos = new ObjectOutputStream(fos);
            oos.writeObject(bookMap);
            //��ջ�����
            oos.flush();
        }
        catch (FileNotFoundException ex) {
                Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        //�쳣����ߵ��ں��
        catch (IOException ex) {
                Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try{
                //�ȿ����
                 oos.close();
                 fos.close();
            }catch(IOException ex){
                Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE,null,ex);
            }
        }
    }

    //��
    public Map<Integer,BookBean>readBook(){
        FileInputStream fis = null;
        ObjectInputStream ois = null;
        Map<Integer, BookBean> map = null;
        try {
            fis = new FileInputStream("F:\\������\\book.txt");
            ois = new ObjectInputStream(fis);
            map = (Map<Integer, BookBean>) ois.readObject();//�����쳣����catch
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            //Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
            //ex.printStackTrace();
            map=new HashMap<Integer,BookBean>();//�����쳣ʱ�����д���map
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
