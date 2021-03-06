/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.service.MosterBuService;
import com.struts.form.MosterBillInfoForm;
import com.struts.form.MosterCargoVectorForm;
import com.struts.form.OptUserInfoForm;

/** 
 * MyEclipse Struts
 * Creation date: 08-16-2008
 * 
 * XDoclet definition:
 * @struts.action path="/cargovcadd" name="mosterCargoVectorForm" input="/CargoVCAdd.jsp" scope="request"
 */
public class MoCargoVCAddAction extends Action {
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
		
		//获取从前台传来的表单数据
		String cvid = request.getParameter("CVID");	
		String cargoid = request.getParameter("CargoID");
		String billid =request.getParameter("BillID");

		MosterCargoVectorForm mocvf = new MosterCargoVectorForm();		

		mocvf.setCvID(cvid);
		mocvf.setCargoID(cargoid);
		mocvf.setBillID(billid);

		boolean isok = mobs.getMocargoVecbuss().save(mocvf);
		
		request.setAttribute("cvAddState", isok);
		return mapping.findForward("cargovcadd");
		
		
	}
}