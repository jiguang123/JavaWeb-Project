/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * BookForm.java
 *
 * Created on 2013-2-28, 8:23:01
 */

package com.liu.view;

import com.liu.dao.BookDAO;
import com.liu.dao.TypeDAO;
import com.liu.po.BookBean;
import com.liu.po.TypeBean;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author asus
 */
public class BookForm extends javax.swing.JFrame {


    /** Creates new form BookForm */
    private Map<Integer,BookBean> map;
     private Map<Integer,TypeBean> map1;
    private BookDAO bookDao;
    private TypeDAO typeDao;
   
    public BookForm() {
        initComponents();
        bookDao = new BookDAO();
        typeDao = new TypeDAO();
        map = bookDao.readBook();
        map1 = typeDao.readType();
        initType();
       initData();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">                          
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        bookTable = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        bmemo = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        bid = new javax.swing.JTextField();
        bname = new javax.swing.JTextField();
        btype = new javax.swing.JComboBox();
        jLabel5 = new javax.swing.JLabel();
        bmoney = new javax.swing.JTextField();

        setTitle("图书管理");
        setBounds(new java.awt.Rectangle(100, 50, 0, 0));
        setIconImage(new javax.swing.ImageIcon(getClass().getResource("/com/liu/resouce/logo.jpg")).getImage());

        bookTable.setFont(new java.awt.Font("宋体", 0, 18)); // NOI18N
        bookTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "序号", "图书名称", "图书类型", "租金", "备注"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        bookTable.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bookTableMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(bookTable);

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "详细信息", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("宋体", 0, 18))); // NOI18N

        bmemo.setFont(new java.awt.Font("宋体", 0, 18));

        jButton1.setText("新增");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setText("保存");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setText("更新");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setText("删除");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("宋体", 0, 18));
        jLabel1.setText("序号：");

        jLabel2.setFont(new java.awt.Font("宋体", 0, 18));
        jLabel2.setText("名称：");

        jLabel3.setFont(new java.awt.Font("宋体", 0, 18));
        jLabel3.setText("类型：");

        jLabel4.setFont(new java.awt.Font("宋体", 0, 18));
        jLabel4.setText("备注：");

        bid.setFont(new java.awt.Font("宋体", 0, 18));

        bname.setFont(new java.awt.Font("宋体", 0, 18));

        btype.setFont(new java.awt.Font("宋体", 0, 18));
        btype.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "文学类", "教育类", "科技类", "文艺类" }));
        btype.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btypeActionPerformed(evt);
            }
        });

        jLabel5.setFont(new java.awt.Font("宋体", 0, 18));
        jLabel5.setText("租金：");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, 83, Short.MAX_VALUE)
                            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addComponent(jLabel3)
                                .addComponent(jLabel5)
                                .addComponent(jLabel4)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(33, 33, 33)))
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(bmemo, javax.swing.GroupLayout.DEFAULT_SIZE, 375, Short.MAX_VALUE)
                    .addComponent(bid, javax.swing.GroupLayout.DEFAULT_SIZE, 375, Short.MAX_VALUE)
                    .addComponent(bname, javax.swing.GroupLayout.DEFAULT_SIZE, 375, Short.MAX_VALUE)
                    .addComponent(bmoney, javax.swing.GroupLayout.DEFAULT_SIZE, 375, Short.MAX_VALUE)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(28, 28, 28)
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 69, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(30, 30, 30)
                        .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 28, Short.MAX_VALUE)
                        .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(btype, 0, 375, Short.MAX_VALUE))
                .addGap(65, 65, 65))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(bid, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(13, 13, 13)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(bname, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(btype, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(26, 26, 26)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(bmoney, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(32, 32, 32)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(bmemo, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(64, 64, 64)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(jLabel4))
                .addGap(22, 22, 22))
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 795, Short.MAX_VALUE)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(50, 50, 50)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(173, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 192, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10, 10, 10)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>                        
    //表格数据的初始化
    public void initData(){
        //加载数据
        DefaultTableModel dtm = (DefaultTableModel)bookTable.getModel();
        //清空表
        while(dtm.getRowCount()>0){
            dtm.removeRow(0);
        }
        //加载数据
        Set<Integer>set = map.keySet();
        for(Integer i:set){
            BookBean bean = map.get(i);
            Vector v = new Vector();
            v.add(bean.getId());
            v.add(bean.getBookName());
            v.add(bean.getBookType());
            v.add(bean.getMoney());
            v.add(bean.getMemo());
            dtm.addRow(v);
        }
    }
      //获取类别管理的所有类别
     public void initType(){
        Set<Integer> set = map1.keySet();
        DefaultComboBoxModel dcm = (DefaultComboBoxModel)btype.getModel();
        dcm.removeAllElements();
        for(Integer i:set){
            TypeBean bean = map1.get(i);
            dcm.addElement(bean.getTypeName());
        }

     }
    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        // 保存功能
         //先保存文本框里的值
        String id = bid.getText();
        String bookName = bname.getText();
        String bookType = (String) btype.getSelectedItem();
        String memo = bmemo.getText();
        String money = bmoney.getText();

        //封装成对象
        BookBean bean = new BookBean();

        bean.setId(Integer.parseInt(id));
        bean.setBookName(bookName);
        bean.setBookType(bookType);
        bean.setMemo(memo);
        bean.setMoney(money);

        //将bean放到map里面
               // Map<Integer,TypeBean>map = new HashMap<Integer,TypeBean>();
        map.put(Integer.parseInt(id), bean);
        //将map放到文件里面
        bookDao.writeBook(map);
        //刷新table
        initData();
    }                                        

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {                                         
         // 新增时，将文本框里的信息进行清空，并将序列号置为可编辑。
        bid.setEnabled(true);

        bid.setText("");
        bname.setText("");
        btype.setSelectedItem("");
        bmemo.setText("");
        bmoney.setText("");

    }                                        

    private void bookTableMouseClicked(java.awt.event.MouseEvent evt) {                                       
        //获取选中行号及序列号
        int currentRow = bookTable.getSelectedRow();
        //BookBean bean = map.get( currentRow);
         // 将选中的行，显示到信息栏中
        bid.setText((Integer) bookTable.getValueAt(currentRow, 0)+"");
        bname.setText((String) bookTable.getValueAt(currentRow, 1));
        btype.setSelectedItem((String) bookTable.getValueAt(currentRow, 2));
        bmoney.setText((String) bookTable.getValueAt(currentRow, 3));
        bmemo.setText((String) bookTable.getValueAt(currentRow, 4));

        //bmemo.setText(bean.getMemo());
    
        bid.setEnabled(false);  //序号框不可编辑
    }                                      

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {                                         
         // 删除操作
        //获取选中行号及序列号
        int currentRow = bookTable.getSelectedRow();
        int id = (Integer)bookTable.getValueAt(currentRow, 0);
        map.remove(id);
        bookDao.writeBook(map);
        JOptionPane.showMessageDialog(this,"类别删除成功");
        initData();
    }                                        

    private void btypeActionPerformed(java.awt.event.ActionEvent evt) {                                      
        // TODO add your handling code here:
}                                     

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        // 更新操作
        //先保存文本框里的值
        int currentRow = bookTable.getSelectedRow();
        int id = (Integer) bookTable.getValueAt(currentRow, 0);

        String bookName = bname.getText();
        String bookType = (String) btype.getSelectedItem();
        String memo = bmemo.getText();
        String money = bmoney.getText();
        //封装成对象
        BookBean bean = new BookBean();
        bean.setId(id);
        bean.setBookName(bookName);
        bean.setBookType(bookType);
        bean.setMemo(memo);
        bean.setMoney(money);

        //将bean放到map里面
               // Map<Integer,TypeBean>map = new HashMap<Integer,TypeBean>();
        map.put(id, bean);
        //将map放到文件里面
        bookDao.writeBook(map);
        //刷新table
        JOptionPane.showMessageDialog(this,"类别更新成功");
        initData();
    }                                        

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new BookForm().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify                     
    private javax.swing.JTextField bid;
    private javax.swing.JTextField bmemo;
    private javax.swing.JTextField bmoney;
    private javax.swing.JTextField bname;
    private javax.swing.JTable bookTable;
    private javax.swing.JComboBox btype;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration                   

}
