package duoxiancheng;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class ClockRunnable implements Runnable{

	private static final String label = null;


	private static String format(int number) {
	    return number < 10 ? "0" + number : "" + number;// 如果数字小于10就在其前面加0补齐
	}

	private static String getTime() {
	    Calendar calendar = new GregorianCalendar();
	    int hour = calendar.get(Calendar.HOUR_OF_DAY);   //获得当前小时
	    int minute = calendar.get(Calendar.MINUTE);           //获得当前分钟
	    int second = calendar.get(Calendar.SECOND);           //获得当前秒
	    return format(hour) + ":" + format(minute) + ":" + format(second);//返回格式化的字符串
	}

	
	 public void run() {
	        while (true) {//让时钟一直处于更新状态
	        	getTime();       //更新时钟
	            try {
	                Thread.sleep(1000);       //休眠一秒钟
	            } catch (InterruptedException e) {
	                e.printStackTrace();
	           }
	        }
	    }
}
