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
 * Creation date: 08-15-2008
 * 
 * XDoclet definition:
 * @struts.form name="marsBillStateFormForm"
 */
public class MarsBillStateFormForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** billstateid property */
	private String billstateid;

	/** billstatename property */
	private String billstatename;

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
	 * Returns the billstateid.
	 * @return String
	 */
	public String getBillstateid() {
		return billstateid;
	}

	/** 
	 * Set the billstateid.
	 * @param billstateid The billstateid to set
	 */
	public void setBillstateid(String billstateid) {
		this.billstateid = billstateid;
	}

	/** 
	 * Returns the billstatename.
	 * @return String
	 */
	public String getBillstatename() {
		return billstatename;
	}

	/** 
	 * Set the billstatename.
	 * @param billstatename The billstatename to set
	 */
	public void setBillstatename(String billstatename) {
		this.billstatename = billstatename;
	}
}