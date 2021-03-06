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

import com.service.OptBuService;
import com.struts.form.OptBillInfoForm;
import com.struts.form.OptUserInfoForm;

/** 
 * MyEclipse Struts
 * Creation date: 08-17-2008
 * 
 * XDoclet definition:
 * @struts.action
 */
public class OptBillInfoUpdateAction extends Action {
	/*
	 * Generated Methods
	 */
	//声明私有的OptBuService
	private OptBuService bus;
	
	public OptBuService getBus() {
		return bus;
	}

	public void setBus(OptBuService bus) {
		this.bus = bus;
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
		//获取从前台传来的表单数据
		String bid = request.getParameter("BillID");	
		String bsid = request.getParameter("BillStateID");
		String bmemo =request.getParameter("BillMemo");
		
		//获取当前登陆用户ID
		OptUserInfoForm ui = (OptUserInfoForm) request.getSession(true).getAttribute("loginer");
		String uid = ui.getUserid();
		
		OptBillInfoForm bi = new OptBillInfoForm();
		bi.setBillid(bid);
		bi.setBillmemo(bmemo);
		bi.setBillstateid(bsid);
		bi.setUserid(uid);
		boolean isok = bus.getBillbuss().update(bi);
		
		request.setAttribute("BillUpdateState", isok);
		return mapping.findForward("billUpdateOK");
	}

	
}