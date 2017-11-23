package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Comps;
import com.java.Resfun;
import com.java.Roletb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SaveResfunAction extends ActionSupport {

	private String pname;
	private String cname;
	private String caction;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Resfun rol=new Resfun();
		rol.setCaction(caction);
		rol.setCname(cname);
		rol.setPname(pname);
		userService.SaveResfun(rol);
		addActionMessage("���ݱ���ɹ���");
		return SUCCESS;
	}
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		 if(pname==null||pname.toString().equals("")){
			 addActionError("����ڵ����Ʊ��");
		 }
		 if(cname==null||cname.toString().equals("")){
			 addActionError("����ڵ����Ʊ��");
		 }
		 if(caction==null||caction.toString().equals("")){
			 addActionError("����ڵ㶯�����");
		 }
		 List l=new ArrayList();
		 l=userService.QueryByPcac("Resfun", "pname", pname, "cname", cname, "caction", caction);
		 if(l.size()!=0){
			 addActionError("�ü�¼�Ѿ����ڣ�");
		 }
		 
		 
		 
		 
		 
	}

	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public String getCaction() {
		return caction;
	}


	public void setCaction(String caction) {
		this.caction = caction;
	}


	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
