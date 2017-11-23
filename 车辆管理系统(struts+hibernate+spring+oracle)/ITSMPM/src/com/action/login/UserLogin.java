package com.action.login;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;
import com.service.utils.Constants;;
public class UserLogin extends ActionSupport {

	private String username;
	private Long password;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session = re.getSession();
		// TODO Auto-generated method stub
		//�û���¼�����Ƚ������action���ó��û������õ�session��
		//������֤�û�
		 List l=new ArrayList();
		l=userService.getXxuserBynmpass(username, password);
		if(l.size()==0){
			addActionError("�û������������");
			return INPUT;
		}else{
			//��֤ͨ����鿴�ǲ��ǵ�һ�ε�½������ǵ�һ�ε�½��ʾ�޸ĳ�ʼ����0---û�Ĺ�,1---�Ĺ�
			Xxuser xxuser =(Xxuser)l.get(0);
			if(xxuser.getStats().equals("0")){
				
				return "uppassword";
			}else{
				//��֤ͨ�����ó����û�����Ӧ��Ȩ�ޣ���������session��
				Long compsid=userService.getCompsIdBynm(username);
				session.setAttribute(Constants.COMPSID, compsid);
			    return SUCCESS;
			}
			
			
		}
	}
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		if(username==null||username.trim().toString().equals("")){
			addActionError("�û����������룡");
		}
		if(password==null||String.valueOf(password).toString().trim().equals("")){
			addActionError("����������룡");
		}
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Long getPassword() {
		return password;
	}
	public void setPassword(Long password) {
		this.password = password;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
