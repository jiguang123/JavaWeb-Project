package weiqishaonian;

//Qipan.java
import java.awt.*;
import java.awt.event.*;
import java.util.*;
//***************************************************************
class Qipan extends Panel 
{
public static final int _rectlen=22,_rectnum=19;
//Ĭ�ϵķ��񳤶ȼ���Ŀ
protected Vector qizis;
//�����������µ����ӣ������������ϵ��������Ӻͱ������
//��ĳһ������û��������ӣ���Vector qizis�б���ľ����������
//��ĳһ��������������ӣ���Vector qizis�б���ľ���һ��Vector��
//���Vector�а������б����������������Ӽ�������ӱ���
//������ӱ���λ�����Vector�����
protected int num;     //������Ŀ
protected int currentTurn; //�ֵ�˭��
protected int rectnum,rectlen;  //���񳤶ȼ���Ŀ
protected int qizilen;          //���ӵ�ֱ��
protected Qizi[][] map;         //�������ϵ���������
protected Image offscreen;
protected Graphics offg;
protected int size;       //���̵Ŀ�ȼ��߶�
protected int top,left;    //������߼��ϱߵı߾�
protected Point mouseLoc;  //����λ�ã���map�����е��±�
//*********************************************************
protected ControlPanel controlPanel;  //�������
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
{//�������
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
//��ʼ��
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
//******************�������̸���***************************
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
//*********************��������****************************
for(int i=0;i<rectnum+1;i++)
for(int j=0;j<rectnum+1;j++)
{
if(map[i][j]==null)
continue;
offg.setColor(map[i][j].color==Qizi._black?Color.black:Color.white);
offg.fillOval(left+i*rectlen-qizilen/2,top+j*rectlen-qizilen/2,
qizilen,qizilen);
}
//************��������λ�ã�����һ����Ҫ�µ�λ��**********
if(mouseLoc!=null)
{
offg.setColor(currentTurn==Qizi._black?Color.gray:
                          newColor(200,200,250) );
offg.fillOval(left+mouseLoc.x*rectlen-qizilen/2,
            top+mouseLoc.y*rectlen-qizilen/2,
            qizilen,qizilen);
}
//**************���滭��****************************
g.drawImage(offscreen,0,0,this);
}
private Color newColor(int i, int j, int k) {
	// TODO �Զ����ɵķ������
	return null;
}
public void update(Graphics g)
{//����
paint(g);
}
//*********************************************************
class ML extends MouseAdapter
{   //��һ������
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
//**************������������*************************
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
//*****************�ж���[x,y]���Ӻ��Ƿ��������Է�����
tizi(x,y);
//******************�ж��Ƿ������Լ������������������Ч
if(allDead(qizi).size()!=0)
{
map[x][y]=null;
repaint();
controlPanel.setMsg("�����Լ�");
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
//���¿������
controlPanel.setLabel();
}
public void mouseExited(MouseEvent evt)
{//����˳�ʱ�������Ҫ���ӵ�λ��
mouseLoc=null;
repaint();
}
}
private class MML extends MouseMotionAdapter
{//ȡ�ý�Ҫ���ӵ�λ��
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
//**********�ж���[x,y]���Ӻ��Ƿ��������Է�����***********
public static int[] xdir={0,0,1,-1};
public static int[] ydir={1,-1,0,0};
public void tizi(int x,int y)
{
Qizi qizi;
if( (qizi=map[x][y])==null)
return;
int color=qizi.color;
//***************ȡ��qizi����Χ�ļ�����*****************
Vector v=around(qizi);
for(int l=0;l<v.size();l++)
{
Qizi q=(Qizi)(v.elementAt(l) );
if(q.color==color)
continue;
//*****************����ɫ��ͬ��ȡ�ú�q����һ��������������ӡ�
//��û�����������򷵻�һ���յ�Vector
Vector dead=allDead(q);
//��ȥ������������
removeAll(dead);
//**********��������ӣ��򱣴����б����������*************
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
//����Vector qizis�еĵ�num��Ԫ��
qizis.setElementAt(dead,num-1);
}
}
repaint();
}
public boolean sideByBlank(Qizi qizi)
{//�ж�qizi��Χ�Ƿ��пհ�
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
//*************ȡ��qizi����Χ�ļ�����*****************
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
//ȡ�ú�q����һ��������������ˣ�
//��û�����������򷵻�һ���յ�Vector
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
//����������ȥVector v������
public void removeAll(Vector v)
{
for(int i=0;i<v.size();i++)
{
Qizi q=(Qizi)(v.elementAt(i) );
map[q.x][q.y]=null;
}
}
//*******************����**********************
public void back()
{
if(num==0)
{
controlPanel.setMsg("���ӿɻ�");
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
//***********������ٴ�ǰ��*************
public void forward()
{
if(num==qizis.size())
{
controlPanel.setMsg("����ǰ��");
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
//**************���¿�ʼ��Ϸ****************
public void start()
{
qizis=new Vector();
num=0;
map=new Qizi[rectnum+1][rectnum+1];
currentTurn=Qizi._black;
controlPanel.setLabel();
repaint();
}
//*****************���������***************
class ControlPanel extends Panel
{
protected Label lblTurn=new Label("",Label.CENTER);
protected Label lblNum=new Label("",Label.CENTER);
protected Label lblMsg=new Label("",Label.CENTER);
protected Choice choice=new Choice();
protected Button back=new Button("<< ����");
protected Button forward=new Button("ǰ��>>");
protected Button start=new Button("���¿�ʼ");
//********************************************
public int getWidth()
{
return 45;
}
public int getHeight()
{
return size;
}
//******************ѡ�����̵Ĵ�С******************
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
{//������ǰ��
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
{//���嶯��
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
{//��ǩ���·�����ɫ�벽��
lblTurn.setText(Qipan.this.currentTurn==Qizi._black?"�� ��":"�� ��");
lblTurn.setForeground(Qipan.this.currentTurn==Qizi._black?Color.black:
Color.white);
lblNum.setText("��"+(Qipan.this.num+1)+"��");
lblNum.setForeground(Qipan.this.currentTurn==Qizi._black?Color.black:
Color.white);
lblMsg.setText("");
}
public void setMsg(String msg)
{
lblMsg.setText(msg);//��ʾ��Ϣ
}
}
public Dimension getsize() {
	// TODO �Զ����ɵķ������
	return null;
}
}
