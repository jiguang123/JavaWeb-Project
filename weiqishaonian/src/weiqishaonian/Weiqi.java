package weiqishaonian;

//Weiqi.java
import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.Spring;

class Weiqi extends Applet
{
Qipan qipan;
public void init()
{//��ʼ�����
qipan=new Qipan();
setLayout(new BorderLayout());
setSize(qipan.getsize());
add(qipan,"Center");
}
private void add(Qipan qipan2, String string) {
	// TODO �Զ����ɵķ������
	
}
public int getWidth() //�õ�����ֵ
{
return qipan.getWidth();
}
public int getHeight()
{
return qipan.getHeight();
}
public static void main(Spring[] args)
{
Frame f=new Frame("Weiqi");  //��������
f.setResizable(false);
f.setLayout(new BorderLayout());
Weiqi weiqi=new Weiqi();//��ʼ�������
weiqi.init();
weiqi.start();
f.setSize(weiqi.getWidth(),20+weiqi.getHeight());//��������
f.add(weiqi,"Center");
f.setVisible(true);
}}