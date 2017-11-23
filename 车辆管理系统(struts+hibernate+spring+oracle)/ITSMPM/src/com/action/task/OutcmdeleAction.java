package com.action.task;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.java.Outcm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class OutcmdeleAction extends ActionSupport {
	private TaskService taskService;
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Outcm pr=new Outcm();
		if(a[0]!=null){
			pr = taskService.QueryOutcmById(new Long(a[0].trim()));
			if(pr.getWhincom().equals("��")){
				addActionError("ɾ��ʧ�ܣ���������û���ճ���");
				return INPUT;
			}
			taskService.deleOutcm(pr);
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
