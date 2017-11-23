package com.xaccp.struts.user.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.service.UserInfoService;

public class ValidateUserAction extends Action {

	private UserInfoService userInService;
	
	public UserInfoService getUserInService() {
		return userInService;
	}

	public void setUserInService(UserInfoService userInService) {
		this.userInService = userInService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userName=request.getParameter("userName");
		//��ѯ�û����Ƿ��Ѵ���
		List list=userInService.findUserByUserName(userName);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		/*
		 * �ж�������ݿ��д�������û�����list.size()���ش���0��
		 * �������û��Ѵ���
		 * */
		if(list.size()!=0){
			out.print("<span style='color: red;font-weight: bold;'>Sorry���û����Ѵ��ڣ�����</span>");
		}
		else{
			out.print("<span style='color: green;font-weight: bold;'>��ϲ�����û�������ʹ�ã�����</span>");
		}
		return null;
	}
}