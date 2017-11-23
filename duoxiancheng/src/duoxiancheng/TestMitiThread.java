package duoxiancheng;

public class TestMitiThread {
	public static void main(String[] rags) {
		System.out.println(Thread.currentThread().getName() + " �߳����п�ʼ!");
		new MitiSay("A").start();
		new MitiSay("B").start();
		System.out.println(Thread.currentThread().getName() + " �߳����н���!");
	}
}

class MitiSay extends Thread {
	public MitiSay(String threadName) {
		super(threadName);
	}

	public void run() {
		System.out.println(getName() + " �߳����п�ʼ!");
		for (int i = 0; i < 10; i++) {
			System.out.println(i + " " + getName());
			try {
				sleep((int) Math.random() * 10);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println(getName() + " �߳����н���!");
	}
}
