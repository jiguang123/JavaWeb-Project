package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class UppasswordAction extends ActionSupport {

	private Long password;
	private Long xpassword;
	private String username;
	private UserService userService;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		List l=new ArrayList();
		l=userService.QueryByTab("Xxuser", "name", username);
		Xxuser xxuser=new Xxuser();
		xxuser=(Xxuser)l.get(0);
		xxuser.setPassword(password);
		xxuser.setStats("1");
		userService.upUser(xxuser);
		addActionMessage("�����޸ĳɹ���");
		return SUCCESS;
	}

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		if(password==null || xpassword==null){
			addActionError("����������룡");
		}else{
			if(password.intValue()!=xpassword.intValue()){
				addActionError("�������벻һ�£�");
			}
		}
		
	}

	public Long getPassword() {
		return password;
	}

	public void setPassword(Long password) {
		this.password = password;
	}

	public Long getXpassword() {
		return xpassword;
	}

	public void setXpassword(Long xpassword) {
		this.xpassword = xpassword;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	

}
