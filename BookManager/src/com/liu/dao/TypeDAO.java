/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.liu.dao;

import com.liu.po.TypeBean;
import java.io.*;
import java.util.*;
import java.util.logging.*;
/**
 *
 * ���ļ����ж���д����
 */
public class TypeDAO {

    // д 
    public void writeType(Map<Integer,TypeBean >typeMap){
     // 
        FileOutputStream fos = null;
        ObjectOutputStream oos = null;
        try {
            fos = new FileOutputStream("F:\\������\\type.txt");
            oos = new ObjectOutputStream(fos);
            oos.writeObject(typeMap);
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
    public Map<Integer,TypeBean>readType(){
        FileInputStream fis = null;
        ObjectInputStream ois = null;
        Map<Integer, TypeBean> map = null;
        try {
            fis = new FileInputStream("F:\\������\\type.txt");
            ois = new ObjectInputStream(fis);
            map = (Map<Integer, TypeBean>) ois.readObject();//�����쳣����catch
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            //Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
            //ex.printStackTrace();
            map=new HashMap<Integer,TypeBean>();//�����쳣ʱ�����д���map
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

