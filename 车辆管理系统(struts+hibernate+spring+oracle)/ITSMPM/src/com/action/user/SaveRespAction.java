package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Comps;
import com.java.RP;
import com.java.ResP;
import com.java.Resfun;
import com.java.Roletb;
import com.java.UR;
import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SaveRespAction extends ActionSupport {
	private Long compsid;
	private List<Long> resfunid;
	private UserService userService;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		for(Long resid : resfunid)
		{
			Comps xu=new Comps();
			xu=userService.QueryCompsById(compsid);
			Resfun rf= new Resfun();
			rf=userService.QueryResfunById(resid);
			ResP rp=new ResP();
			rp.setResfun(rf);
			rp.setComps(xu);
			userService.SaveResP(rp);
		}
	    addActionMessage("���ݱ���ɹ���");
		return SUCCESS;
	}

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		 if(compsid==null||compsid.toString().equals("")){
			 addActionError("Ȩ�ޱ���ѡ��");
		 }
		 if(resfunid==null||resfunid.size()==0){
			 addActionError("��Դ����ѡ��");
		 }
		 for(int i=0;i<resfunid.size();i++){
			 List l=new ArrayList();
			 l=userService.QueryByother("ResP", "comps.compsid", compsid, "resfun.resfunid", resfunid.get(i));
			 if(l.size()!=0){
				 addActionError("��Ȩ����Դ�Ѿ����ڣ�");
				 break;
			 }
		 }
		
		 
		 
		 
		 
	}
 

	public Long getCompsid() {
		return compsid;
	}

	public void setCompsid(Long compsid) {
		this.compsid = compsid;
	}
    
 
	public List<Long> getResfunid() {
		return resfunid;
	}

	public void setResfunid(List<Long> resfunid) {
		this.resfunid = resfunid;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
