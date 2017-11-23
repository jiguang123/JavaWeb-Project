package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.Test;
import com.service.intface.user.UserService;

public class SaveXxuserAction extends ActionSupport {

	private String name;
	private Long password;
	private String des;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Xxuser xxuser=new Xxuser();
		xxuser.setDes(des.trim());
		xxuser.setName(name.trim());
		xxuser.setPassword(password);
		xxuser.setStats("0");
		System.out.println("aaasdsdsadsa"+name);
		userService.saveUser(xxuser);
		addActionMessage("���ݱ���ɹ���");
		return SUCCESS;
	}
	 
	
	
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		List l=new ArrayList();
		if(name==null||name.trim().equals("")){
			addActionError("�û�������д��");
		}
		if(password==null){
			addActionError("���������д��");
		}
		l=userService.QueryByTab("Xxuser", "name", name);
		if(l.size()!=0){
			addActionError("���û��Ѿ����ڣ�");
		}
	}



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	 
	public Long getPassword() {
		return password;
	}
	public void setPassword(Long password) {
		this.password = password;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	 
	 
	 

}
