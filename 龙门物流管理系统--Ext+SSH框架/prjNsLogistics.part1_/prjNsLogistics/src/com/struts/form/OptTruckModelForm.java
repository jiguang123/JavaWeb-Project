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
 * Creation date: 08-16-2007
 * 
 * XDoclet definition:
 * @struts.form name="optTruckModelForm"
 */
public class OptTruckModelForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** tmweight property */
	private String tmweight;

	/** tmcubage property */
	private String tmcubage;

	/** tmname property */
	private String tmname;

	/** tmpassenger property */
	private String tmpassenger;

	/** tmid property */
	private String tmid;

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
	 * Returns the tmweight.
	 * @return String
	 */
	public String getTmweight() {
		return tmweight;
	}

	/** 
	 * Set the tmweight.
	 * @param tmweight The tmweight to set
	 */
	public void setTmweight(String tmweight) {
		this.tmweight = tmweight;
	}

	/** 
	 * Returns the tmcubage.
	 * @return String
	 */
	public String getTmcubage() {
		return tmcubage;
	}

	/** 
	 * Set the tmcubage.
	 * @param tmcubage The tmcubage to set
	 */
	public void setTmcubage(String tmcubage) {
		this.tmcubage = tmcubage;
	}

	/** 
	 * Returns the tmname.
	 * @return String
	 */
	public String getTmname() {
		return tmname;
	}

	/** 
	 * Set the tmname.
	 * @param tmname The tmname to set
	 */
	public void setTmname(String tmname) {
		this.tmname = tmname;
	}

	/** 
	 * Returns the tmpassenger.
	 * @return String
	 */
	public String getTmpassenger() {
		return tmpassenger;
	}

	/** 
	 * Set the tmpassenger.
	 * @param tmpassenger The tmpassenger to set
	 */
	public void setTmpassenger(String tmpassenger) {
		this.tmpassenger = tmpassenger;
	}

	/** 
	 * Returns the tmid.
	 * @return String
	 */
	public String getTmid() {
		return tmid;
	}

	/** 
	 * Set the tmid.
	 * @param tmid The tmid to set
	 */
	public void setTmid(String tmid) {
		this.tmid = tmid;
	}
}