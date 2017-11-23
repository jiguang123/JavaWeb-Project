package com.action.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Comps;
import com.java.Resfun;
import com.java.Roletb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class ResfundeleAction extends ActionSupport {
	private UserService userService;
	private List message;
	
	public List getMessage() {
		return message;
	}
	public void setMessage(List message) {
		this.message = message;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Resfun pr=new Resfun();
		if(a[0]!=null){
			pr = userService.QueryResfunById(new Long(a[0].trim()));
			userService.deleResfun(pr);
			addActionMessage("����ɾ���ɹ���");
		}else{
			System.out.println("ɾ����Ϣʱ����");
		}
		return SUCCESS;
	}
	
	
	public String edit() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Resfun pr=new Resfun();
		if(a[0]!=null){
			pr = userService.QueryResfunById(new Long(a[0].trim()));
		} 
		List l=new ArrayList();
		l.add(pr);
		setMessage(l);
		return SUCCESS;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
