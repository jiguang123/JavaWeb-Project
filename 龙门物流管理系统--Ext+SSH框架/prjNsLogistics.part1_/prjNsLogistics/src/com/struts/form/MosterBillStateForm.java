/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.struts.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 08-12-2008
 * 
 * XDoclet definition:
 * @struts.form name="mosterBillStateForm"
 */
public class MosterBillStateForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** billStateName property */
	private String billStateName;

	/** billStateID property */
	private String billStateID;

	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the billStateName.
	 * @return String
	 */
	public String getBillStateName() {
		return billStateName;
	}

	/** 
	 * Set the billStateName.
	 * @param billStateName The billStateName to set
	 */
	public void setBillStateName(String billStateName) {
		this.billStateName = billStateName;
	}

	/** 
	 * Returns the billStateID.
	 * @return String
	 */
	public String getBillStateID() {
		return billStateID;
	}

	/** 
	 * Set the billStateID.
	 * @param billStateID The billStateID to set
	 */
	public void setBillStateID(String billStateID) {
		this.billStateID = billStateID;
	}
}