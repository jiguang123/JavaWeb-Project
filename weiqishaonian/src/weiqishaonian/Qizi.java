package weiqishaonian;


//Qizi.java
//ȡ�úڰ��ӵ�λ��
public class Qizi
{
public static int _black=0,_white=1;
protected int x,y;
protected int color;
public Qizi(int i,int j,int c)
{
x=i;
y=j;
color=c;
}
public String toString()
{//
String c=(color==_black?"black":"white");
return "["+x+","+y+"]:"+c;
}
}