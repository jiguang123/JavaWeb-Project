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

import com.bu.moster.MosterBillInfoBusiness;
import com.service.MosterBuService;
import com.struts.form.MosterBillInfoForm;
import com.struts.form.OptBillInfoForm;

/** 
 * MyEclipse Struts
 * Creation date: 08-16-2008
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class MoBillUpdateAction extends Action {
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
		String id = request.getParameter("BillID");

		MosterBillInfoForm mobif = (MosterBillInfoForm) mobs.getMobillinfobuss().findById(id);
		Vector cgvc = mobif.getCargos();
		request.setAttribute("mobillinfo", cgvc);
		
		
		return mapping.findForward("cargoByID");
		
	}
}