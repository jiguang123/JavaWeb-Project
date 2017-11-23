package duoxiancheng;

public class MThreadDemo {
	static public void main(String[] args)
	  {
		  //����һ���µ��߳���group01������ΪThreadGroup01
		  ThreadGroup group01 = new ThreadGroup("ThreadGroup01");
		  group01.setMaxPriority(4);

		  //�������̣߳������뵽�߳���group01��
		  Thread query01 = new Thread(group01,new Query(),"Query01");
		  Thread query02 = new Thread(group01,new Query(),"Query02");
		  Thread query03 = new Thread(group01,new Query(),"Query03");

		  //����һ���µ��߳���group02������ΪThreadGroup02
		  ThreadGroup group02 = new ThreadGroup("ThreadGroup02");
		  //�������̣߳������뵽�߳���group02��
		  Thread transaction01 = new Thread(group02,new Transaction(),"Transaction01");
		  Thread transaction02 = new Thread(group02,new Transaction(),"Transaction02");

		  //����Ļ�����ǰ�����߳������Ϣ
		  System.out.println("============================================" );
		  System.out.println("�߳���group01�е��߳��У�" );
		  group01.list(); //��ʾ�߳���group01�е������߳�
		  System.out.println("�߳���group02�е��߳��У�" );
		  group02.list(); //��ʾ�߳���group01�е������߳�
		  System.out.println("============================================" );

		  query01.start();	//�����߳�
		  query02.start();
		  query03.start();
		  transaction01.start();
		  transaction02.start();
	  }
	}

	class Query implements Runnable
	{
		public void run()	//�ڴ˴����ô���ʵ������Ĵ���
		{
			//���߳��ܹ�˯��3��
			for(int cnt = 1; cnt < 6; cnt++)
			{
				try{
					//˯��һ������ĺ�����
					Thread.currentThread().sleep(
						(int)(Math.random() * 100));
					}catch(InterruptedException e){}
					
					//��ʾ��ǰ�̵߳���Ϣ
					System.out.println(Thread.currentThread() + 
						"���У������ǣ�" + cnt);
			}
		}
	}

	class Transaction implements Runnable
	{
		public void run()	//�ڴ˴����ô���ʵ������Ĵ���
		{
			//���߳��ܹ�˯��3��
			for(int cnt = 1; cnt < 6; cnt++)
			{
				try{
					if(cnt>2)
						//˯��һ������ĺ�����
						Thread.currentThread().sleep(
							(int)(Math.random() * 100));
					}catch(InterruptedException e){}
					
					//��ʾ�ض���ǰ����Ϣ
					System.out.println(Thread.currentThread() + 
						"���У������ǣ�" + cnt);
			}
		}

}
