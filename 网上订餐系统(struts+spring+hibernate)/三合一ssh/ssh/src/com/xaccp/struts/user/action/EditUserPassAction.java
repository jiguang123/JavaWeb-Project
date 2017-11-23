package com.xaccp.struts.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.po.UserInfo;
import com.xaccp.service.UserInfoService;
import com.xaccp.util.MD5;

public class EditUserPassAction extends Action {

	private UserInfoService userInfoService;
	
	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String oldUserPass=request.getParameter("oldUserPass");
		MD5 md5=new MD5();
		//����û���Ϣ
		UserInfo userInfo=(UserInfo) request.getSession().getAttribute("USERINFO");
		//�����û�
		userInfo=userInfoService.findUserById(userInfo.getUId());
		//�жϾ������Ƿ���ȷ
		if(!md5.getMD5ofStr(oldUserPass).equals(userInfo.getUPass())){
			ActionErrors ae=new ActionErrors();
			ae.add("pass", new ActionError("passerror"));
			saveErrors(request, ae);
			return mapping.getInputForward();
		}
		String newUserPass=request.getParameter("newUserPass");
		userInfo.setUPass(md5.getMD5ofStr(newUserPass));
		//�Ѹ��µ���Ϣ����session��
		request.getSession().setAttribute("USERINFO", userInfo);
		//�޸��û�����
		userInfoService.updateUser(userInfo);
		return mapping.findForward("toMemberCenter");
	}
}