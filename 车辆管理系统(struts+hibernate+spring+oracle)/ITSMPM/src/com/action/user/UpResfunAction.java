package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Comps;
import com.java.Resfun;
import com.java.Roletb;
import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class UpResfunAction extends ActionSupport {

	private String pname;
	private Long resfunid;
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
		rol.setResfunid(resfunid);
		userService.upResfun(rol);
		addActionMessage("�����޸ĳɹ���");
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
			l=userService.QueryByTabId("Resfun", "resfunid", resfunid);
			//�ж��Ƿ��޸�
			if(l.size()!=0){
				
				for(int i=0;i<l.size();i++){
					Resfun rf=new Resfun();
					rf=(Resfun)l.get(i);
					if(rf.getCaction().equals(caction.trim())&&rf.getCname().equals(cname)&&rf.getPname().equals(pname)){
						System.out.println("mei gai");
					}else{
						List n=new ArrayList();
						n=userService.QueryByPcac("Resfun", "pname", pname, "cname", cname, "caction", caction);
						if(n.size()!=0){
							addActionError("�ü�¼�Ѿ����ڣ�");
						}
					}
				}
			
			
				
			}
		 
		 
		 
		 
	}
 
	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public Long getResfunid() {
		return resfunid;
	}


	public void setResfunid(Long resfunid) {
		this.resfunid = resfunid;
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
