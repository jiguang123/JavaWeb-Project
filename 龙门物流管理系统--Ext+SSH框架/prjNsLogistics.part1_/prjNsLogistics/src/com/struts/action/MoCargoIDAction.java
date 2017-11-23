/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.struts.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.service.MosterBuService;
import com.struts.form.OptBranchInfoForm;
import com.struts.form.OptUserInfoForm;

/** 
 * MyEclipse Struts
 * Creation date: 08-23-2008
 * 
 * XDoclet definition:
 * @struts.action
 */
public class MoCargoIDAction extends Action {
	/*
	 * Generated Methods
	 */
	private MosterBuService mobs;
	public MosterBuService getMobs() {
		return mobs;
	}
	public void setMobs(MosterBuService mobs) {
		this.mobs = mobs;
	}
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//从Sessions中获取当前登陆用户信息，获取该用户身份以及所属分公司编号
		OptUserInfoForm ui = (OptUserInfoForm) request.getSession(true).getAttribute("loginer");
		OptBranchInfoForm bi = (OptBranchInfoForm) request.getSession(true).getAttribute("loginBranch");
		
		Vector vccargo = mobs.getMocargoinfobuss().findAllID(new Integer(bi.getBranchid()));
		request.setAttribute("vccargo", vccargo);
		return mapping.findForward("mocargoID");
	}
}