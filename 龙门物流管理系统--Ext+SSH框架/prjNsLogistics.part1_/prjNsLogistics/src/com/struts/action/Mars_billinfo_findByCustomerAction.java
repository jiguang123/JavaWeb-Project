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
import com.bu.*;
import com.po.BranchInfo;
import com.po.CustomerInfo;
import com.service.*;

import java.util.*;
/** 
 * MyEclipse Struts
 * Creation date: 08-13-2008
 * 
 * XDoclet definition:
 * @struts.action
 */
public class Mars_billinfo_findByCustomerAction extends Action {
	/*
	 * Generated Methods
	 */

	private MarsBusinessservice bs;
	public MarsBusinessservice getBs() {
		return bs;
	}
	public void setBs(MarsBusinessservice bs) {
		this.bs = bs;
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
		String customerid=request.getAttribute("cussendid").toString();
		String branchid=request.getAttribute("branchid").toString();
		String billstartdata=request.getAttribute("billstartdata").toString();
		String billenddata=request.getAttribute("billenddata").toString();
		Vector billvc=bs.getBillinfobusiness().findByCustomer(customerid, billstartdata, billenddata,branchid);
		request.getSession(true).setAttribute("billvc", billvc);
		return mapping.findForward("list��");
	}
	
}