package duoxiancheng;

import java.awt.*;
import java.awt.event.*;

public class LoadFromAppli extends Frame {
	Image im;
	public LoadFromAppli()
	{
		im =Toolkit.getDefaultToolkit().getImage("2.31.jpg");
		addWindowListener(
				new WindowAdapter()
		{
		   public void windowClosing(WindowEvent e)
		  {
			 System.exit(0);
		  }
		});
	}

	public void paint(Graphics g)
	{
		g.drawImage(im,130,130,this);
	}
	public static void main(String[] args) {
		LoadFromAppli f = new LoadFromAppli();
		f.setSize(500,500);
        f.show();
	}
}
