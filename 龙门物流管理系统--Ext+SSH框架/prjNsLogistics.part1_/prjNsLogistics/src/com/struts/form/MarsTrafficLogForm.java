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
 * @struts.form name="marsTrafficLogForm"
 */
public class MarsTrafficLogForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** branchname property */
	private String branchname;

	/** truckid property */
	private String truckid;

	/** billid property */
	private String billid;

	/** trafficlogid property */
	private String trafficlogid;

	/** tlid property */
	private String tlid;

	/** branchid property */
	private String branchid;

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
	 * Returns the branchname.
	 * @return String
	 */
	public String getBranchname() {
		return branchname;
	}

	/** 
	 * Set the branchname.
	 * @param branchname The branchname to set
	 */
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	/** 
	 * Returns the truckid.
	 * @return String
	 */
	public String getTruckid() {
		return truckid;
	}

	/** 
	 * Set the truckid.
	 * @param truckid The truckid to set
	 */
	public void setTruckid(String truckid) {
		this.truckid = truckid;
	}

	/** 
	 * Returns the billid.
	 * @return String
	 */
	public String getBillid() {
		return billid;
	}

	/** 
	 * Set the billid.
	 * @param billid The billid to set
	 */
	public void setBillid(String billid) {
		this.billid = billid;
	}

	/** 
	 * Returns the trafficlogid.
	 * @return String
	 */
	public String getTrafficlogid() {
		return trafficlogid;
	}

	/** 
	 * Set the trafficlogid.
	 * @param trafficlogid The trafficlogid to set
	 */
	public void setTrafficlogid(String trafficlogid) {
		this.trafficlogid = trafficlogid;
	}

	/** 
	 * Returns the tlid.
	 * @return String
	 */
	public String getTlid() {
		return tlid;
	}

	/** 
	 * Set the tlid.
	 * @param tlid The tlid to set
	 */
	public void setTlid(String tlid) {
		this.tlid = tlid;
	}

	/** 
	 * Returns the branchid.
	 * @return String
	 */
	public String getBranchid() {
		return branchid;
	}

	/** 
	 * Set the branchid.
	 * @param branchid The branchid to set
	 */
	public void setBranchid(String branchid) {
		this.branchid = branchid;
	}
}