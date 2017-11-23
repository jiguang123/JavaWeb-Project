package com.action.task;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Outcm;
import com.java.RP;
import com.java.Ucapli;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class UsecarsqdeleAction extends ActionSupport {
	private TaskService taskService;
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Ucapli pr=new Ucapli();
		Outcm ocm=new Outcm();
		if(a[0]!=null){
			//����id��ѯ���������ж������û�ճ�����ʾ��ɾ����
			List l =new ArrayList();
			l=taskService.getOutcmByUcapliId(new Long(a[0].trim()));
			if(l.size()!=0){
				for(int i=0;i<l.size();i++){//û�ճ�
					if(((Outcm)l.get(i)).getWhincom().equals("��")){
						addActionError("ɾ��ʧ�ܣ���������û���ճ���");
						return INPUT;
					}
				}
			}
			pr = taskService.QueryUcapliById(new Long(a[0].trim()));
			taskService.deleUca(pr);
			addActionMessage("����ɾ���ɹ���");
		}else{
			System.out.println("ɾ����Ϣʱ����");
		}
		return SUCCESS;
	}
	public TaskService getTaskService() {
		return taskService;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	
}
