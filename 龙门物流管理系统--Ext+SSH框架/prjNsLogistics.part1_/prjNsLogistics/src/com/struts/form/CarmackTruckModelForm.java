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
 * @struts.form name="carmackTruckModelForm"
 */
public class CarmackTruckModelForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** tMCubage property */
	private String tMCubage;

	/** tMWeight property */
	private String tMWeight;

	/** tMName property */
	private String tMName;

	/** tMID property */
	private String tMID;

	/** tMPassenger property */
	private String tMPassenger;

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
	 * Returns the tMCubage.
	 * @return String
	 */
	public String getTMCubage() {
		return tMCubage;
	}

	/** 
	 * Set the tMCubage.
	 * @param tMCubage The tMCubage to set
	 */
	public void setTMCubage(String tMCubage) {
		this.tMCubage = tMCubage;
	}

	/** 
	 * Returns the tMWeight.
	 * @return String
	 */
	public String getTMWeight() {
		return tMWeight;
	}

	/** 
	 * Set the tMWeight.
	 * @param tMWeight The tMWeight to set
	 */
	public void setTMWeight(String tMWeight) {
		this.tMWeight = tMWeight;
	}

	/** 
	 * Returns the tMName.
	 * @return String
	 */
	public String getTMName() {
		return tMName;
	}

	/** 
	 * Set the tMName.
	 * @param tMName The tMName to set
	 */
	public void setTMName(String tMName) {
		this.tMName = tMName;
	}

	/** 
	 * Returns the tMID.
	 * @return String
	 */
	public String getTMID() {
		return tMID;
	}

	/** 
	 * Set the tMID.
	 * @param tMID The tMID to set
	 */
	public void setTMID(String tMID) {
		this.tMID = tMID;
	}

	/** 
	 * Returns the tMPassenger.
	 * @return String
	 */
	public String getTMPassenger() {
		return tMPassenger;
	}

	/** 
	 * Set the tMPassenger.
	 * @param tMPassenger The tMPassenger to set
	 */
	public void setTMPassenger(String tMPassenger) {
		this.tMPassenger = tMPassenger;
	}
}