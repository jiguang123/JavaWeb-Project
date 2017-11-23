package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Roletb;
import com.java.UR;
import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SaveUrAction extends ActionSupport {
	private Long userid;
	private Long roletbid;
	private UserService userService;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Roletb ro=new Roletb();
		ro=userService.QueryRoletbById(roletbid);
		Xxuser xu=new Xxuser();
		xu=userService.QueryXxuserById(userid);
		UR ur=new UR();
		ur.setRoletb(ro);
		ur.setXxuser(xu);
		userService.SaveUR(ur);
	    addActionMessage("���ݱ���ɹ���");
		return SUCCESS;
	}

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		 if(userid==null||userid.toString().equals("")){
			 addActionError("�û�����ѡ��");
		 }
		 if(roletbid==null||roletbid.toString().equals("")){
			 addActionError("��ɫ����ѡ��");
		 }
		 List l=new ArrayList();
		 l=userService.QueryByother("UR", "roletb.roletbid", roletbid, "xxuser.id", userid);
		 if(l.size()!=0){
			 addActionError("���û��Ѿ�������ý�ɫ��");
		 }
		 
		 
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public Long getRoletbid() {
		return roletbid;
	}

	public void setRoletbid(Long roletbid) {
		this.roletbid = roletbid;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
