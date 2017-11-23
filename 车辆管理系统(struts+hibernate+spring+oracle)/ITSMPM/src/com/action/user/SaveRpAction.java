package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Comps;
import com.java.RP;
import com.java.Roletb;
import com.java.UR;
import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SaveRpAction extends ActionSupport {
	private Long compsid;
	private Long roletbid;
	private UserService userService;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Roletb ro=new Roletb();
		ro=userService.QueryRoletbById(roletbid);
		Comps xu=new Comps();
		xu=userService.QueryCompsById(compsid);
		RP rp=new RP();
		rp.setRoletb(ro);
		rp.setComps(xu);
		userService.SaveRP(rp);
	    addActionMessage("���ݱ���ɹ���");
		return SUCCESS;
	}

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		 if(compsid==null||compsid.toString().equals("")){
			 addActionError("Ȩ�ޱ���ѡ��");
		 }
		 if(roletbid==null||roletbid.toString().equals("")){
			 addActionError("��ɫ����ѡ��");
		 }
		 List l=new ArrayList();
		 l=userService.QueryByother("RP", "comps.compsid", compsid, "roletb.roletbid", roletbid);
		 if(l.size()!=0){
			 addActionError("�˽�ɫ�Ѿ��������Ȩ�ޣ�");
		 }
		 
		 
	}
 

	public Long getCompsid() {
		return compsid;
	}

	public void setCompsid(Long compsid) {
		this.compsid = compsid;
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
