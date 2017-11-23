package weiqishaonian;

//Qipan.java
import java.awt.*;
import java.awt.event.*;
import java.util.*;
//***************************************************************
class Qipan extends Panel 
{
public static final int _rectlen=22,_rectnum=19;
//默认的方格长度及数目
protected Vector qizis;
//保存所有已下的棋子，包括在棋盘上的所有棋子和被提掉的
//若某一次落子没有造成提子，则Vector qizis中保存的就是这个棋子
//若某一次落子造成了提子，则Vector qizis中保存的就是一的Vector，
//这个Vector中包括所有被这个棋子提掉的棋子及这个棋子本身，
//这个棋子本身位于这个Vector的最后
protected int num;     //已下数目
protected int currentTurn; //轮到谁下
protected int rectnum,rectlen;  //方格长度及数目
protected int qizilen;          //棋子的直径
protected Qizi[][] map;         //在棋盘上的所有棋子
protected Image offscreen;
protected Graphics offg;
protected int size;       //棋盘的宽度及高度
protected int top,left;    //棋盘左边及上边的边距
protected Point mouseLoc;  //鼠标的位置，即map数组中的下标
//*********************************************************
protected ControlPanel controlPanel;  //控制面板
public int getWidth()
{
return size+controlPanel.getWidth()+35;
}
public int getHeight()
{
return size;
}
//********************************************************

public Qipan()
{//棋盘外观
top=left=20;
rectnum=_rectnum;
rectlen=_rectlen;
qizilen=rectlen*9/10;
size=2*left+rectnum*rectlen;
//********************************************************
addMouseListener(new ML());
addMouseMotionListener(new MML());
//********************************************************
setLayout(new BorderLayout() );
controlPanel=new ControlPanel();
setSize(getWidth(),size);
add(controlPanel,"East");
setSize(getWidth(),size);
add(controlPanel,"East");
//初始化
start();
}
public void addNotify()
{
super.addNotify();
offscreen=createImage(size,size);
offg=offscreen.getGraphics();
}
public void paint(Graphics g)
{
offg.setColor(new Color(180,150,100) );
offg.fillRect(0,0,size,size);
//******************画出棋盘格子***************************
offg.setColor(Color.black);
for(int i=0;i<rectnum+1;i++)
{
int x1=left+i*rectlen;
int x2=x1;
int y1=top;
int y2=top+rectnum*rectlen;
offg.drawLine(x1,y1,x2,y2);
//*********************************************************
x1=left;
x2=left+rectnum*rectlen;
y1=top+i*rectlen;
y2=y1;
offg.drawLine(x1,y1,x2,y2);
}
//*********************画出棋子****************************
for(int i=0;i<rectnum+1;i++)
for(int j=0;j<rectnum+1;j++)
{
if(map[i][j]==null)
continue;
offg.setColor(map[i][j].color==Qizi._black?Color.black:Color.white);
offg.fillOval(left+i*rectlen-qizilen/2,top+j*rectlen-qizilen/2,
qizilen,qizilen);
}
//************画出鼠标的位置，即下一步将要下的位置**********
if(mouseLoc!=null)
{
offg.setColor(currentTurn==Qizi._black?Color.gray:
                          newColor(200,200,250) );
offg.fillOval(left+mouseLoc.x*rectlen-qizilen/2,
            top+mouseLoc.y*rectlen-qizilen/2,
            qizilen,qizilen);
}
//**************画面画出****************************
g.drawImage(offscreen,0,0,this);
}
private Color newColor(int i, int j, int k) {
	// TODO 自动生成的方法存根
	return null;
}
public void update(Graphics g)
{//更新
paint(g);
}
//*********************************************************
class ML extends MouseAdapter
{   //放一颗棋子
public void mousePressed(MouseEvent evt)
{
int xoff=left/2;
int yoff=top/2;
int x=(evt.getX()-xoff)/rectlen;
int y=(evt.getY()-yoff)/rectlen;
if(x<0 || x>rectnum || y<0 || y>rectnum)
return;
if(map[x][y]!=null)
return;
//**************清除多余的棋子*************************
if(num<qizis.size())
{
int size=qizis.size();
for(int i=size-1;i>=num;i--)
qizis.removeElementAt(i);
}
//*******************************************************
Qizi qizi=new Qizi(x,y,currentTurn);
map[x][y]=qizi;
//********************************************************
qizis.addElement(qizi);
num++;
if(currentTurn==Qizi._black)
currentTurn=Qizi._white;
else
currentTurn=Qizi._black;
//*****************判断在[x,y]落子后，是否可以提掉对方的子
tizi(x,y);
//******************判断是否挤死了自己，若是则已落的子无效
if(allDead(qizi).size()!=0)
{
map[x][y]=null;
repaint();
controlPanel.setMsg("挤死自己");
//***********************back***************************
qizis.removeElement(qizi);
num--;
if(currentTurn==Qizi._black)
currentTurn=Qizi._white;
else
currentTurn=Qizi._black;
return;
}
mouseLoc=null;
//更新控制面板
controlPanel.setLabel();
}
public void mouseExited(MouseEvent evt)
{//鼠标退出时，清除将要落子的位置
mouseLoc=null;
repaint();
}
}
private class MML extends MouseMotionAdapter
{//取得将要落子的位置
public void mouseMoved(MouseEvent evt)
{
int xoff=left/2;
int yoff=top/2;
int x=(evt.getX()-xoff)/rectlen;
int y=(evt.getY()-yoff)/rectlen;
if(x<0 || x>rectnum || y<0 || y>rectnum)
return;
if(map[x][y]!=null)
return;
mouseLoc=new Point(x,y);
repaint();
}
}
//**********判断在[x,y]落子后，是否可以提掉对方的子***********
public static int[] xdir={0,0,1,-1};
public static int[] ydir={1,-1,0,0};
public void tizi(int x,int y)
{
Qizi qizi;
if( (qizi=map[x][y])==null)
return;
int color=qizi.color;
//***************取得qizi四周围的几个子*****************
Vector v=around(qizi);
for(int l=0;l<v.size();l++)
{
Qizi q=(Qizi)(v.elementAt(l) );
if(q.color==color)
continue;
//*****************若颜色不同，取得和q连在一起的所有已死的子。
//若没有已死的子则返回一个空的Vector
Vector dead=allDead(q);
//移去所有已死的子
removeAll(dead);
//**********若造成提子，则保存所有被提掉的棋子*************
if(dead.size()!=0)
{
Object obj=qizis.elementAt(num-1);
if(obj instanceof Qizi)
{
qizi=(Qizi)(qizis.elementAt(num-1));
dead.addElement(qizi);
}else
{
Vector vector=(Vector)obj;
for(int i=0;i<vector.size();i++)
dead.addElement(vector.elementAt(i) );
}
//更新Vector qizis中的第num个元素
qizis.setElementAt(dead,num-1);
}
}
repaint();
}
public boolean sideByBlank(Qizi qizi)
{//判断qizi周围是否有空白
for(int l=0;l<xdir.length;l++)
{
int xl=qizi.x+xdir[l];
int yl=qizi.y+ydir[l];
if(xl<0 || xl>rectnum || yl>rectnum)
continue;
if(map[xl][yl]==null)
return true;
}
return false;
}
//*************取得qizi四周围的几个子*****************
public Vector around(Qizi qizi)
{
Vector v=new Vector();
for(int l=0;l<xdir.length;l++)
{
int xl=qizi.x+xdir[l];
int yl=qizi.y+ydir[l];
if(xl<0 || xl>rectnum || yl<0 || yl>rectnum || map[xl][yl]==null)
continue;
v.addElement(map[xl][yl]);
}
return v;
}
//取得和q连在一起的所有已死的人，
//若没有已死的子则返回一个空的Vector
public Vector allDead(Qizi q)
{
Vector v=new Vector();
v.addElement(q);
int count=0;
while(true)
{
int origsize=v.size();
for(int i=count;i<origsize;i++)
{
Qizi qizi=(Qizi)(v.elementAt(i) );
if(sideByBlank(qizi) )
return new Vector();
Vector around=around(qizi);
for(int j=0;j<around.size();j++)
{
Qizi a=(Qizi)(around.elementAt(j) );
if(a.color!=qizi.color)
continue;
if(v.indexOf(a)<0)
v.addElement(a);
}
}
if(origsize==v.size())
break;
else
count=origsize;
}
return v;
}
//从棋盘上移去Vector v中棋子
public void removeAll(Vector v)
{
for(int i=0;i<v.size();i++)
{
Qizi q=(Qizi)(v.elementAt(i) );
map[q.x][q.y]=null;
}
}
//*******************悔棋**********************
public void back()
{
if(num==0)
{
controlPanel.setMsg("无子可悔");
return;
}
Object obj=qizis.elementAt(--num);
if(obj instanceof Qizi)
{
Qizi qizi=(Qizi)obj;
map[qizi.x][qizi.y]=null;
currentTurn=qizi.color;
}else
{
Vector v=(Vector)obj;
for(int i=0;i<v.size();i++)
{
Qizi q=(Qizi)(v.elementAt(i) );
if(i==v.size()-1)
{
map[q.x][q.y]=null;
int index=qizis.indexOf(v);
qizis.setElementAt(q,index);
currentTurn=q.color;
}else
{
map[q.x][q.y]=q;
}
}
}
controlPanel.setLabel();
repaint();
}
//***********悔棋后再次前进*************
public void forward()
{
if(num==qizis.size())
{
controlPanel.setMsg("不能前进");
return;
}
Object obj=qizis.elementAt(num++);
Qizi qizi;
if(obj instanceof Qizi)
{
qizi=(Qizi)(obj);
map[qizi.x][qizi.y]=qizi;
}else
{
Vector v=(Vector)obj;
qizi=(Qizi)(v.elementAt(v.size()-1) );
map[qizi.x][qizi.y]=qizi;
}
if(qizi.color==Qizi._black)
currentTurn=Qizi._white;
else
currentTurn=Qizi._black;
tizi(qizi.x,qizi.y);
controlPanel.setLabel();
repaint();
}
//**************重新开始游戏****************
public void start()
{
qizis=new Vector();
num=0;
map=new Qizi[rectnum+1][rectnum+1];
currentTurn=Qizi._black;
controlPanel.setLabel();
repaint();
}
//*****************控制面板类***************
class ControlPanel extends Panel
{
protected Label lblTurn=new Label("",Label.CENTER);
protected Label lblNum=new Label("",Label.CENTER);
protected Label lblMsg=new Label("",Label.CENTER);
protected Choice choice=new Choice();
protected Button back=new Button("<< 悔棋");
protected Button forward=new Button("前进>>");
protected Button start=new Button("重新开始");
//********************************************
public int getWidth()
{
return 45;
}
public int getHeight()
{
return size;
}
//******************选择棋盘的大小******************
public ControlPanel()
{
setSize(this.getWidth(),this.getHeight());
setLayout(new GridLayout(12,1,0,10));
setLabel();
choice.add("19 X 19");
choice.add("15 X 15");
choice.add("13 X 13");
choice.add("11 X 11");
choice.add("7 X 7");
choice.addItemListener(new IL());
add(lblTurn);
add(lblNum);
add(start);
add(choice);
add(lblMsg);
add(back);
add(forward);
back.addActionListener(new AL());
forward.addActionListener(new AL());
start.addActionListener(new AL());
setBackground(new Color(120,120,200));
}
public Insets getInsets()
{
return new Insets(5,5,5,5);
}
private class AL implements ActionListener
{//悔棋与前进
public void actionPerformed(ActionEvent evt)
{
if(evt.getSource()==back)
Qipan.this.back();
else if(evt.getSource()==forward)
Qipan.this.forward();
else if(evt.getSource()==start)
Qipan.this.start();
}
}
private class IL implements ItemListener
{//下棋动作
public void itemStateChanged(ItemEvent evt)
{
String s=(String)(evt.getItem());
int rects=Integer.parseInt(s.substring(0,2).trim() );
if(rects!=Qipan.this.rectnum)
{
Qipan.this.rectlen=(_rectlen*_rectnum)/rects;
Qipan.this.qizilen=rectlen*9/10;
Qipan.this.rectnum=rects;
Qipan.this.start();
}
}
}
public void setLabel()
{//标签待下方的颜色与步数
lblTurn.setText(Qipan.this.currentTurn==Qizi._black?"黑 方":"白 方");
lblTurn.setForeground(Qipan.this.currentTurn==Qizi._black?Color.black:
Color.white);
lblNum.setText("第"+(Qipan.this.num+1)+"手");
lblNum.setForeground(Qipan.this.currentTurn==Qizi._black?Color.black:
Color.white);
lblMsg.setText("");
}
public void setMsg(String msg)
{
lblMsg.setText(msg);//提示信息
}
}
public Dimension getsize() {
	// TODO 自动生成的方法存根
	return null;
}
}
