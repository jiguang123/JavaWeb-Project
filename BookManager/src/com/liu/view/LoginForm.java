/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * LoginForm.java
 *
 * Created on 2013-2-26, 18:33:36
 */

package com.liu.view;

import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;

/**
 *
 * @author asus
 */
public class LoginForm extends javax.swing.JFrame {

    /** Creates new form LoginForm */
    public LoginForm() {
        initComponents();   
 }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">                          
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        LoginName = new javax.swing.JTextField();
        LoginPwd = new javax.swing.JPasswordField();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("��½����");
        setBounds(new java.awt.Rectangle(300, 200, 0, 0));
        setIconImage(new javax.swing.ImageIcon(getClass().getResource("/com/liu/resouce/logo.jpg")).getImage());
        addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                formKeyPressed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("����", 0, 36));
        jLabel1.setForeground(new java.awt.Color(204, 0, 0));
        jLabel1.setText("ͼ�����ϵͳ");

        jLabel2.setFont(new java.awt.Font("����", 0, 24));
        jLabel2.setText("�û�����");

        jLabel3.setFont(new java.awt.Font("����", 0, 24));
        jLabel3.setText("���룺");

        LoginName.setName(""); // NOI18N
        LoginName.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                LoginNameActionPerformed(evt);
            }
        });
        LoginName.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                LoginNameKeyPressed(evt);
            }
        });

        LoginPwd.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                LoginPwdKeyPressed(evt);
            }
        });

        jButton1.setFont(new java.awt.Font("����", 0, 24)); // NOI18N
        jButton1.setText("��¼");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(97, 97, 97)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(LoginPwd)
                    .addComponent(LoginName, javax.swing.GroupLayout.DEFAULT_SIZE, 215, Short.MAX_VALUE))
                .addContainerGap(88, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(130, Short.MAX_VALUE)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 263, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(113, 113, 113))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(299, Short.MAX_VALUE)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(110, 110, 110))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(50, 50, 50)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(38, 38, 38)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(LoginName, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(LoginPwd, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(21, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>                        

    private void LoginNameActionPerformed(java.awt.event.ActionEvent evt) {                                          
        // TODO add your handling code here:
}                                         

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        
        //1.�Ȼ�ȡ�û���������
        String name = LoginName.getText();
        String password = new String(LoginPwd.getPassword());
        //2.������֤
        if("admin".equals(name)&&"admin".equals(password))
        {
            //��½�ɹ�
            //����LoginForm����ʾMainForm
            this.setVisible(false);
            new MainForm().setVisible(true);
        }
        else
        {
            //��¼ʧ��
           JOptionPane.showMessageDialog(this, "�û������������");
        }

    }                                        

    private void formKeyPressed(java.awt.event.KeyEvent evt) {                                
       //�û����̵�½
         
    }                               

    private void LoginNameKeyPressed(java.awt.event.KeyEvent evt) {                                     
        //�û����̵�½
        if(evt.getKeyText(evt.getKeyCode()).compareToIgnoreCase("Enter")==0)
        {
            jButton1.doClick(); 
        }
    }                                    

    private void LoginPwdKeyPressed(java.awt.event.KeyEvent evt) {                                    
        //�û����̵�½
        if(evt.getKeyText(evt.getKeyCode()).compareToIgnoreCase("Enter")==0)
        {
            jButton1.doClick();
        }
    }                                   

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new LoginForm().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify                     
    private javax.swing.JTextField LoginName;
    private javax.swing.JPasswordField LoginPwd;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    // End of variables declaration                   

}

