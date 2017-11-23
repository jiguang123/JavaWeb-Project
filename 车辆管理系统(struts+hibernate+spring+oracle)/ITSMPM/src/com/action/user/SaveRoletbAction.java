package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Roletb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SaveRoletbAction extends ActionSupport {

	private String rolename;
	private String roledes;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Roletb rol=new Roletb();
		rol.setRoledes(roledes);
		rol.setRolename(rolename);
		userService.SaveRoletb(rol);
		addActionMessage("���ݱ���ɹ���");
		return SUCCESS;
	}
	
	
	
	
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		List l=new ArrayList();
		if(rolename==null||rolename.trim().equals("")){
			addActionError("��ɫ��������д��");
		}
		l=userService.QueryByTab("Roletb", "rolename", rolename);
		if(l.size()!=0){
			addActionError("�ý�ɫ�Ѿ����ڣ�");
		}
		
		
	}




	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getRoledes() {
		return roledes;
	}
	public void setRoledes(String roledes) {
		this.roledes = roledes;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
