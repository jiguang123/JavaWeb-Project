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
 * Creation date: 08-13-2008
 * 
 * XDoclet definition:
 * @struts.form name="optDepartmentInfoForm"
 */
public class OptDepartmentInfoForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** departmentid property */
	private String departmentid;

	/** departmentname property */
	private String departmentname;

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
	 * Returns the departmentid.
	 * @return String
	 */
	public String getDepartmentid() {
		return departmentid;
	}

	/** 
	 * Set the departmentid.
	 * @param departmentid The departmentid to set
	 */
	public void setDepartmentid(String departmentid) {
		this.departmentid = departmentid;
	}

	/** 
	 * Returns the departmentname.
	 * @return String
	 */
	public String getDepartmentname() {
		return departmentname;
	}

	/** 
	 * Set the departmentname.
	 * @param departmentname The departmentname to set
	 */
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
}