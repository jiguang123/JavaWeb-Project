package com.action.task;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Ucapli;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class TakecarAction extends ActionSupport {

	private TaskService taskService;
	private List message;
	private List driverselect;
	private List carselect;
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		//��ѯUcapli�ó��������ʼ����ʻԱ����ʼ�������������ǿ���״̬�µ�
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Ucapli pr=new Ucapli();
		if(a[0]!=null){
			pr = taskService.QueryUcapliById(new Long(a[0].trim()));
			 
		} 
		List l= new ArrayList();
		l.add(pr);
		setMessage(l);
		
		driverselect=taskService.DriverSelect("����");
		carselect=taskService.CarSelect("����");
		return SUCCESS;
	}
	
	public List getDriverselect() {
		return driverselect;
	}
	public void setDriverselect(List driverselect) {
		this.driverselect = driverselect;
	}
	public List getCarselect() {
		return carselect;
	}
	public void setCarselect(List carselect) {
		this.carselect = carselect;
	}

	public TaskService getTaskService() {
		return taskService;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	public List getMessage() {
		return message;
	}
	public void setMessage(List message) {
		this.message = message;
	}
}
