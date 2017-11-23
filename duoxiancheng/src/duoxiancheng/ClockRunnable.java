package duoxiancheng;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class ClockRunnable implements Runnable{

	private static final String label = null;


	private static String format(int number) {
	    return number < 10 ? "0" + number : "" + number;// �������С��10������ǰ���0����
	}

	private static String getTime() {
	    Calendar calendar = new GregorianCalendar();
	    int hour = calendar.get(Calendar.HOUR_OF_DAY);   //��õ�ǰСʱ
	    int minute = calendar.get(Calendar.MINUTE);           //��õ�ǰ����
	    int second = calendar.get(Calendar.SECOND);           //��õ�ǰ��
	    return format(hour) + ":" + format(minute) + ":" + format(second);//���ظ�ʽ�����ַ���
	}

	
	 public void run() {
	        while (true) {//��ʱ��һֱ���ڸ���״̬
	        	getTime();       //����ʱ��
	            try {
	                Thread.sleep(1000);       //����һ����
	            } catch (InterruptedException e) {
	                e.printStackTrace();
	           }
	        }
	    }
}
