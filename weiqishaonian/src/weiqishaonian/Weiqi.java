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
{//初始化外观
qipan=new Qipan();
setLayout(new BorderLayout());
setSize(qipan.getsize());
add(qipan,"Center");
}
private void add(Qipan qipan2, String string) {
	// TODO 自动生成的方法存根
	
}
public int getWidth() //得到宽数值
{
return qipan.getWidth();
}
public int getHeight()
{
return qipan.getHeight();
}
public static void main(Spring[] args)
{
Frame f=new Frame("Weiqi");  //棋盘设置
f.setResizable(false);
f.setLayout(new BorderLayout());
Weiqi weiqi=new Weiqi();//开始下棋程序
weiqi.init();
weiqi.start();
f.setSize(weiqi.getWidth(),20+weiqi.getHeight());//棋盘设置
f.add(weiqi,"Center");
f.setVisible(true);
}}