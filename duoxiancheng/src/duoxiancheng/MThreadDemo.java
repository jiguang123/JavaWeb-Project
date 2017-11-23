package duoxiancheng;

public class MThreadDemo {
	static public void main(String[] args)
	  {
		  //创建一个新的线程组group01，名称为ThreadGroup01
		  ThreadGroup group01 = new ThreadGroup("ThreadGroup01");
		  group01.setMaxPriority(4);

		  //创建新线程，并加入到线程组group01中
		  Thread query01 = new Thread(group01,new Query(),"Query01");
		  Thread query02 = new Thread(group01,new Query(),"Query02");
		  Thread query03 = new Thread(group01,new Query(),"Query03");

		  //创建一个新的线程组group02，名称为ThreadGroup02
		  ThreadGroup group02 = new ThreadGroup("ThreadGroup02");
		  //创建新线程，并加入到线程组group02中
		  Thread transaction01 = new Thread(group02,new Transaction(),"Transaction01");
		  Thread transaction02 = new Thread(group02,new Transaction(),"Transaction02");

		  //向屏幕输出当前所有线程组的信息
		  System.out.println("============================================" );
		  System.out.println("线程组group01中的线程有：" );
		  group01.list(); //显示线程组group01中的所有线程
		  System.out.println("线程组group02中的线程有：" );
		  group02.list(); //显示线程组group01中的所有线程
		  System.out.println("============================================" );

		  query01.start();	//启动线程
		  query02.start();
		  query03.start();
		  transaction01.start();
		  transaction02.start();
	  }
	}

	class Query implements Runnable
	{
		public void run()	//在此处放置处理实际任务的代码
		{
			//让线程总共睡眠3次
			for(int cnt = 1; cnt < 6; cnt++)
			{
				try{
					//睡眠一个随机的毫秒数
					Thread.currentThread().sleep(
						(int)(Math.random() * 100));
					}catch(InterruptedException e){}
					
					//显示当前线程的信息
					System.out.println(Thread.currentThread() + 
						"运行，次数是：" + cnt);
			}
		}
	}

	class Transaction implements Runnable
	{
		public void run()	//在此处放置处理实际任务的代码
		{
			//让线程总共睡眠3次
			for(int cnt = 1; cnt < 6; cnt++)
			{
				try{
					if(cnt>2)
						//睡眠一个随机的毫秒数
						Thread.currentThread().sleep(
							(int)(Math.random() * 100));
					}catch(InterruptedException e){}
					
					//显示特定当前的信息
					System.out.println(Thread.currentThread() + 
						"运行，次数是：" + cnt);
			}
		}

}
