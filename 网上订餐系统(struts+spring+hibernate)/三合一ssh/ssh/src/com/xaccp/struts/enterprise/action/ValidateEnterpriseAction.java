package com.xaccp.struts.enterprise.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.xaccp.service.EnterpriseInfoService;

public class ValidateEnterpriseAction extends Action {

	private EnterpriseInfoService enterService;
	
	public EnterpriseInfoService getEnterService() {
		return enterService;
	}

	public void setEnterService(EnterpriseInfoService enterService) {
		this.enterService = enterService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String enterpriseName=request.getParameter("enterpriseName");
		List list=enterService.findEnterpriseByName(enterpriseName);
        response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		/*
		 * �ж�������ݿ��д�������û�����list����null��
		 * �������û�������
		 * */
		if(list!=null){
			out.print("<span style='color: red;font-weight: bold;'>Sorry���û����Ѵ��ڣ�����</span>");
		}else{
			out.print("<span style='color: green;font-weight: bold;'>��ϲ�����û�������ʹ�ã�����</span>");
		}
		return null;
	}
}